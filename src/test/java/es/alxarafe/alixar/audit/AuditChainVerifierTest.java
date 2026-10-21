package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditCanonicalEncoder;
import es.alxarafe.alixar.audit.application.AuditChainVerifier;
import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditHashCalculator;
import es.alxarafe.alixar.audit.application.AuditVerificationFailure;
import es.alxarafe.alixar.audit.application.AuditVerificationResult;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import java.util.UUID;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class AuditChainVerifierTest {

    private static final UUID CHAIN_ID = AuditChain.DEFAULT_CHAIN_ID;
    private static final Clock CLOCK = Clock.fixed(
        Instant.parse("2026-10-21T12:34:56.123456789Z"),
        ZoneOffset.UTC
    );

    private final AuditCanonicalEncoder encoder = new AuditCanonicalEncoder();
    private final AuditHashCalculator hashCalculator = new AuditHashCalculator();
    private final InMemoryAuditEventRepository repository = new InMemoryAuditEventRepository();
    private final AuditEventAppender appender = new AuditEventAppender(
        repository,
        encoder,
        hashCalculator,
        CLOCK
    );
    private final AuditChainVerifier verifier = new AuditChainVerifier(
        repository,
        encoder,
        hashCalculator
    );

    @Test
    void acceptsAValidChain() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);

        AuditVerificationResult result = verifier.verify(CHAIN_ID);

        assertThat(result.valid()).isTrue();
        assertThat(result.checkedEvents()).isEqualTo(3);
        assertThat(result.failure()).isNull();
    }

    @Test
    void rejectsAMissingChainHead() {
        AuditVerificationResult result = verifier.verify(UUID.randomUUID());

        assertThat(result.valid()).isFalse();
        assertThat(result.failure()).isEqualTo(AuditVerificationFailure.CHAIN_HEAD_MISSING);
    }

    @Test
    void rejectsAModifiedHistoricalField() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        AuditEvent original = repository.events(CHAIN_ID).get(1);
        repository.replaceEvent(CHAIN_ID, 2, copyWithAction(original, "TAMPERED"));

        assertThat(verifier.verify(CHAIN_ID).failure())
            .isEqualTo(AuditVerificationFailure.EVENT_HASH_MISMATCH);
    }

    @Test
    void rejectsADeletedIntermediateEvent() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        repository.deleteEvent(CHAIN_ID, 2);

        AuditVerificationResult result = verifier.verify(CHAIN_ID);

        assertThat(result.valid()).isFalse();
        assertThat(result.failure()).isEqualTo(AuditVerificationFailure.SEQUENCE_MISMATCH);
        assertThat(result.failedSequence()).isEqualTo(2L);
    }

    @Test
    void rejectsAnAlteredPreviousHash() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        AuditEvent original = repository.events(CHAIN_ID).get(1);
        repository.replaceEvent(CHAIN_ID, 2, copyWithPreviousHash(original, "f".repeat(64)));

        assertThat(verifier.verify(CHAIN_ID).failure())
            .isEqualTo(AuditVerificationFailure.PREVIOUS_HASH_MISMATCH);
    }

    @Test
    void rejectsAnAlteredEventHash() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        AuditEvent original = repository.events(CHAIN_ID).get(1);
        repository.replaceEvent(CHAIN_ID, 2, original.withEventHash("e".repeat(64)));

        assertThat(verifier.verify(CHAIN_ID).failure())
            .isEqualTo(AuditVerificationFailure.EVENT_HASH_MISMATCH);
    }

    @Test
    void rejectsAnAlteredSequence() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        AuditEvent original = repository.events(CHAIN_ID).get(1);
        repository.replaceEvent(CHAIN_ID, 2, copyWithSequence(original, 99));

        assertThat(verifier.verify(CHAIN_ID).failure())
            .isEqualTo(AuditVerificationFailure.SEQUENCE_MISMATCH);
    }

    @Test
    void rejectsAHeadHashThatDoesNotMatchTheLastEvent() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        repository.updateChainHead(new AuditChainHead(CHAIN_ID, 3, "f".repeat(64)));

        assertThat(verifier.verify(CHAIN_ID).failure())
            .isEqualTo(AuditVerificationFailure.HEAD_HASH_MISMATCH);
    }

    @Test
    void rejectsEventsBeyondTheDeclaredHead() {
        repository.seedChain(CHAIN_ID);
        appendEvents(3);
        AuditEvent last = repository.events(CHAIN_ID).getLast();
        repository.insert(new AuditEvent(
            UUID.randomUUID(),
            CHAIN_ID,
            4,
            last.occurredAt(),
            null,
            "system",
            AuditAuthenticationType.SYSTEM,
            "EXTRA",
            "AUDIT",
            null,
            AuditResult.SUCCESS,
            null,
            AuditCanonicalEncoder.FORMAT_VERSION,
            last.eventHash(),
            "a".repeat(64)
        ));

        assertThat(verifier.verify(CHAIN_ID).failure())
            .isEqualTo(AuditVerificationFailure.UNEXPECTED_EVENT);
    }

    private void appendEvents(int count) {
        for (int index = 1; index <= count; index++) {
            appender.append(new AuditEventDraft(
                CHAIN_ID,
                null,
                "system",
                AuditAuthenticationType.SYSTEM,
                "TEST_ACTION_" + index,
                "TEST",
                null,
                AuditResult.SUCCESS,
                null
            ));
        }
    }

    private AuditEvent copyWithAction(AuditEvent event, String action) {
        return new AuditEvent(
            event.id(), event.chainId(), event.sequence(), event.occurredAt(),
            event.actorUserId(), event.actorUsername(), event.authenticationType(),
            action, event.resourceType(), event.resourceId(), event.result(),
            event.requestId(), event.integrityFormatVersion(), event.previousHash(),
            event.eventHash()
        );
    }

    private AuditEvent copyWithPreviousHash(AuditEvent event, String previousHash) {
        return new AuditEvent(
            event.id(), event.chainId(), event.sequence(), event.occurredAt(),
            event.actorUserId(), event.actorUsername(), event.authenticationType(),
            event.action(), event.resourceType(), event.resourceId(), event.result(),
            event.requestId(), event.integrityFormatVersion(), previousHash,
            event.eventHash()
        );
    }

    private AuditEvent copyWithSequence(AuditEvent event, long sequence) {
        return new AuditEvent(
            event.id(), event.chainId(), sequence, event.occurredAt(),
            event.actorUserId(), event.actorUsername(), event.authenticationType(),
            event.action(), event.resourceType(), event.resourceId(), event.result(),
            event.requestId(), event.integrityFormatVersion(), event.previousHash(),
            event.eventHash()
        );
    }
}
