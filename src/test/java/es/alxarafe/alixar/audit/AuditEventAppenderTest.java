package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditCanonicalEncoder;
import es.alxarafe.alixar.audit.application.AuditEventAppender;
import es.alxarafe.alixar.audit.application.AuditEventDraft;
import es.alxarafe.alixar.audit.application.AuditHashCalculator;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.time.Clock;
import java.time.Instant;
import java.time.ZoneOffset;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class AuditEventAppenderTest {

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

    @Test
    void assignsSequenceAndPreviousHashAndComputesTheEventHashExactlyOnce() {
        repository.seedChain(AuditChain.DEFAULT_CHAIN_ID);

        AuditEvent first = appender.append(draft("FIRST"));
        AuditEvent second = appender.append(draft("SECOND"));

        assertThat(first.sequence()).isEqualTo(1);
        assertThat(first.previousHash()).isEqualTo(AuditChain.GENESIS_HASH);
        assertThat(first.occurredAt()).isEqualTo(Instant.parse("2026-10-21T12:34:56.123456Z"));
        assertThat(first.eventHash()).isEqualTo(hashCalculator.sha256Hex(encoder.encode(first)));

        assertThat(second.sequence()).isEqualTo(2);
        assertThat(second.previousHash()).isEqualTo(first.eventHash());
        assertThat(second.eventHash()).isEqualTo(hashCalculator.sha256Hex(encoder.encode(second)));
        assertThat(repository.events(AuditChain.DEFAULT_CHAIN_ID)).containsExactly(first, second);
    }

    private AuditEventDraft draft(String action) {
        return new AuditEventDraft(
            AuditChain.DEFAULT_CHAIN_ID,
            null,
            "system",
            AuditAuthenticationType.SYSTEM,
            action,
            "TEST",
            null,
            AuditResult.SUCCESS,
            null
        );
    }
}
