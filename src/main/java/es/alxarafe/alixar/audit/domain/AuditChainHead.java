package es.alxarafe.alixar.audit.domain;

import java.util.UUID;

public record AuditChainHead(
    UUID chainId,
    long lastSequence,
    String lastHash
) {
}
