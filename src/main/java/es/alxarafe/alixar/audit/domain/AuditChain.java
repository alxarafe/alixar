package es.alxarafe.alixar.audit.domain;

import java.util.UUID;

public final class AuditChain {

    public static final UUID DEFAULT_CHAIN_ID =
        UUID.fromString("00000000-0000-0000-0000-000000000001");
    public static final String GENESIS_HASH = "0".repeat(64);

    private AuditChain() {
    }
}
