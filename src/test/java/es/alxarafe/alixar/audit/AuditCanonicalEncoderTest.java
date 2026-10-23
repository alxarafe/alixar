package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditCanonicalEncoder;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.UUID;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class AuditCanonicalEncoderTest {

    private static final UUID EVENT_ID = UUID.fromString("123e4567-e89b-12d3-a456-426614174000");
    private static final UUID RESOURCE_ID = UUID.fromString("9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d");
    private static final Instant OCCURRED_AT = Instant.parse("2026-10-21T12:34:56.123456789Z");

    private final AuditCanonicalEncoder encoder = new AuditCanonicalEncoder();

    @Test
    void encodesTheCompleteV1SpecificationDeterministically() {
        AuditEvent event = event(null, "Alice", AuditAuthenticationType.SESSION);

        String canonical = canonical(event);

        assertThat(canonical).isEqualTo(
            "ALXAR-AUDIT-EVENT\n"
                + "integrity_format_version=1:1\n"
                + "event_id=36:123e4567-e89b-12d3-a456-426614174000\n"
                + "chain_id=36:00000000-0000-0000-0000-000000000001\n"
                + "sequence=1:1\n"
                + "occurred_at=27:2026-10-21T12:34:56.123456Z\n"
                + "actor_user_id=-1:\n"
                + "actor_username=5:Alice\n"
                + "authentication_type=7:SESSION\n"
                + "action=13:USER_DISABLED\n"
                + "resource_type=4:USER\n"
                + "resource_id=36:9a8b7c6d-5e4f-3a2b-1c0d-9e8f7a6b5c4d\n"
                + "result=7:SUCCESS\n"
                + "request_id=-1:\n"
                + "previous_hash=64:" + AuditChain.GENESIS_HASH + "\n"
        );
        assertThat(encoder.encode(event)).isEqualTo(encoder.encode(event));
    }

    @Test
    void distinguishesNullFromTheLiteralStringNull() {
        String nullValue = canonical(event(null, null, null));
        String literalNull = canonical(event(null, "null", null));

        assertThat(nullValue).contains("actor_username=-1:\n");
        assertThat(literalNull).contains("actor_username=4:null\n");
        assertThat(nullValue).isNotEqualTo(literalNull);
    }

    @Test
    void usesUtf8ByteLengthsRatherThanCharacterCounts() {
        String canonical = canonical(event(null, "Jürgen", null));

        assertThat(canonical).contains("actor_username=7:Jürgen\n");
    }

    @Test
    void eventHashIsNotPartOfTheCanonicalBytes() {
        AuditEvent first = event(null, "Alice", null);
        AuditEvent second = first.withEventHash("f".repeat(64));

        assertThat(encoder.encode(second)).isEqualTo(encoder.encode(first));
    }

    @Test
    void rejectsUnsupportedIntegrityFormatVersions() {
        AuditEvent event = new AuditEvent(
            EVENT_ID,
            AuditChain.DEFAULT_CHAIN_ID,
            1,
            OCCURRED_AT,
            null,
            "Alice",
            AuditAuthenticationType.SESSION,
            "USER_DISABLED",
            "USER",
            RESOURCE_ID.toString(),
            AuditResult.SUCCESS,
            null,
            2,
            AuditChain.GENESIS_HASH,
            null
        );

        assertThatThrownBy(() -> encoder.encode(event))
            .isInstanceOf(IllegalArgumentException.class)
            .hasMessageContaining("Unsupported audit integrity format version");
    }

    private AuditEvent event(String actorUserId, String actorUsername, AuditAuthenticationType authenticationType) {
        return new AuditEvent(
            EVENT_ID,
            AuditChain.DEFAULT_CHAIN_ID,
            1,
            OCCURRED_AT,
            actorUserId == null ? null : UUID.fromString(actorUserId),
            actorUsername,
            authenticationType,
            "USER_DISABLED",
            "USER",
            RESOURCE_ID.toString(),
            AuditResult.SUCCESS,
            null,
            AuditCanonicalEncoder.FORMAT_VERSION,
            AuditChain.GENESIS_HASH,
            null
        );
    }

    private String canonical(AuditEvent event) {
        return new String(encoder.encode(event), StandardCharsets.UTF_8);
    }
}
