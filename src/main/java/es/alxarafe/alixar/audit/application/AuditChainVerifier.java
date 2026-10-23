package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * Verifies a hash chain independently of its storage technology.
 *
 * <p>The same core can later verify data read from PostgreSQL, an exported
 * JSONL archive or a command-line verifier as long as the source implements
 * {@link AuditChainSource}.</p>
 */
public class AuditChainVerifier {

    public static final int DEFAULT_BATCH_SIZE = 500;

    private final AuditChainSource source;
    private final AuditCanonicalEncoder encoder;
    private final AuditHashCalculator hashCalculator;

    public AuditChainVerifier(
        AuditChainSource source,
        AuditCanonicalEncoder encoder,
        AuditHashCalculator hashCalculator
    ) {
        this.source = source;
        this.encoder = encoder;
        this.hashCalculator = hashCalculator;
    }

    public AuditVerificationResult verify(UUID chainId) {
        Optional<AuditChainHead> headResult = source.findChainHead(chainId);
        if (headResult.isEmpty()) {
            return AuditVerificationResult.invalid(0, AuditVerificationFailure.CHAIN_HEAD_MISSING, null);
        }

        AuditChainHead head = headResult.get();
        long expectedSequence = 1;
        long checkedEvents = 0;
        String expectedPreviousHash = AuditChain.GENESIS_HASH;

        while (expectedSequence <= head.lastSequence()) {
            List<AuditEvent> batch = source.readEvents(
                chainId,
                expectedSequence - 1,
                DEFAULT_BATCH_SIZE
            );
            if (batch.isEmpty()) {
                return AuditVerificationResult.invalid(
                    checkedEvents,
                    AuditVerificationFailure.EVENT_MISSING,
                    expectedSequence
                );
            }

            for (AuditEvent event : batch) {
                if (event.sequence() != expectedSequence) {
                    return AuditVerificationResult.invalid(
                        checkedEvents,
                        AuditVerificationFailure.SEQUENCE_MISMATCH,
                        expectedSequence
                    );
                }
                if (!chainId.equals(event.chainId())) {
                    return AuditVerificationResult.invalid(
                        checkedEvents,
                        AuditVerificationFailure.CHAIN_ID_MISMATCH,
                        event.sequence()
                    );
                }
                if (event.integrityFormatVersion() != AuditCanonicalEncoder.FORMAT_VERSION) {
                    return AuditVerificationResult.invalid(
                        checkedEvents,
                        AuditVerificationFailure.UNSUPPORTED_FORMAT_VERSION,
                        event.sequence()
                    );
                }
                if (!expectedPreviousHash.equals(event.previousHash())) {
                    return AuditVerificationResult.invalid(
                        checkedEvents,
                        AuditVerificationFailure.PREVIOUS_HASH_MISMATCH,
                        event.sequence()
                    );
                }

                String recomputedHash = hashCalculator.sha256Hex(encoder.encode(event));
                if (!recomputedHash.equals(event.eventHash())) {
                    return AuditVerificationResult.invalid(
                        checkedEvents,
                        AuditVerificationFailure.EVENT_HASH_MISMATCH,
                        event.sequence()
                    );
                }

                expectedPreviousHash = recomputedHash;
                checkedEvents++;
                expectedSequence++;

                if (expectedSequence > head.lastSequence()) {
                    break;
                }
            }
        }

        List<AuditEvent> unexpectedEvents = source.readEvents(chainId, head.lastSequence(), 1);
        if (!unexpectedEvents.isEmpty()) {
            return AuditVerificationResult.invalid(
                checkedEvents,
                AuditVerificationFailure.UNEXPECTED_EVENT,
                unexpectedEvents.getFirst().sequence()
            );
        }

        if (!expectedPreviousHash.equals(head.lastHash())) {
            return AuditVerificationResult.invalid(
                checkedEvents,
                AuditVerificationFailure.HEAD_HASH_MISMATCH,
                null
            );
        }

        return AuditVerificationResult.valid(checkedEvents);
    }
}
