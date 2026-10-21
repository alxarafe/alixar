package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * Read-only source of audit chain data.
 *
 * <p>The verifier depends only on this port. Implementations can read from
 * PostgreSQL, an exported JSONL archive or any other future source without
 * changing verification rules.</p>
 */
public interface AuditChainSource {

    Optional<AuditChainHead> findChainHead(UUID chainId);

    List<AuditEvent> readEvents(UUID chainId, long afterSequence, int limit);
}
