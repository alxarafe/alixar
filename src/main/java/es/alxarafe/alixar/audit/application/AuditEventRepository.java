package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.util.Optional;
import java.util.UUID;

/**
 * Append-only audit event persistence port.
 *
 * <p>There is intentionally no operation to update or delete an individual
 * audit event. {@link #lockChainHead(UUID)} must be called inside the transaction
 * that also inserts the event and advances the chain head.</p>
 */
public interface AuditEventRepository extends AuditChainSource {

    Optional<AuditChainHead> lockChainHead(UUID chainId);

    void insert(AuditEvent event);

    void updateChainHead(AuditChainHead head);
}
