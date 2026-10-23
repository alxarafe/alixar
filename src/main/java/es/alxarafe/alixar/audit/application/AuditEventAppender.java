package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.time.Clock;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

/**
 * Appends one event to a chain.
 *
 * <p>The caller must run this use case inside a transaction. The repository
 * locks the chain head so concurrent appends cannot reuse the same parent.</p>
 */
public class AuditEventAppender {

    private final AuditEventRepository repository;
    private final AuditCanonicalEncoder encoder;
    private final AuditHashCalculator hashCalculator;
    private final Clock clock;

    public AuditEventAppender(
        AuditEventRepository repository,
        AuditCanonicalEncoder encoder,
        AuditHashCalculator hashCalculator,
        Clock clock
    ) {
        this.repository = repository;
        this.encoder = encoder;
        this.hashCalculator = hashCalculator;
        this.clock = clock;
    }

    public AuditEvent append(AuditEventDraft draft) {
        AuditChainHead head = repository.lockChainHead(draft.chainId())
            .orElseThrow(() -> new IllegalStateException("Audit chain head not found: " + draft.chainId()));

        Instant occurredAt = clock.instant().truncatedTo(ChronoUnit.MICROS);
        long sequence = head.lastSequence() + 1;

        AuditEvent unsignedEvent = new AuditEvent(
            UUID.randomUUID(),
            draft.chainId(),
            sequence,
            occurredAt,
            draft.actorUserId(),
            draft.actorUsername(),
            draft.authenticationType(),
            draft.action(),
            draft.resourceType(),
            draft.resourceId(),
            draft.result(),
            draft.requestId(),
            AuditCanonicalEncoder.FORMAT_VERSION,
            head.lastHash(),
            null
        );

        String eventHash = hashCalculator.sha256Hex(encoder.encode(unsignedEvent));
        AuditEvent event = unsignedEvent.withEventHash(eventHash);

        repository.insert(event);
        repository.updateChainHead(new AuditChainHead(draft.chainId(), sequence, eventHash));
        return event;
    }
}
