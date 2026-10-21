package es.alxarafe.alixar.audit.application;

import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/**
 * Deterministic, explicit and versioned canonical representation of an audit
 * event.
 *
 * <p>Format version 1 authenticates the event fields, including
 * {@code previous_hash}, exactly once. {@code event_hash} is not part of its own
 * input. The full specification is documented in {@code docs/audit.md}.</p>
 */
public class AuditCanonicalEncoder {

    public static final int FORMAT_VERSION = 1;
    public static final String HEADER = "ALXAR-AUDIT-EVENT";
    public static final String UTF_8_NAME = "UTF-8";
    public static final char FIELD_SEPARATOR = '=';
    public static final char LENGTH_SEPARATOR = ':';
    public static final String NULL_LENGTH = "-1";
    public static final char LINE_SEPARATOR = '\n';

    private static final DateTimeFormatter TIMESTAMP_FORMAT =
        DateTimeFormatter.ofPattern("uuuu-MM-dd'T'HH:mm:ss.SSSSSS'Z'")
            .withZone(ZoneOffset.UTC);

    public byte[] encode(AuditEvent event) {
        if (event.integrityFormatVersion() != FORMAT_VERSION) {
            throw new IllegalArgumentException(
                "Unsupported audit integrity format version: " + event.integrityFormatVersion()
            );
        }

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        writeLine(output, HEADER);
        writeField(output, "integrity_format_version", Integer.toString(event.integrityFormatVersion()));
        writeField(output, "event_id", event.id().toString());
        writeField(output, "chain_id", event.chainId().toString());
        writeField(output, "sequence", Long.toString(event.sequence()));
        writeField(output, "occurred_at", timestamp(event.occurredAt()));
        writeField(output, "actor_user_id", event.actorUserId() == null ? null : event.actorUserId().toString());
        writeField(output, "actor_username", event.actorUsername());
        writeField(
            output,
            "authentication_type",
            event.authenticationType() == null ? null : event.authenticationType().name()
        );
        writeField(output, "action", event.action());
        writeField(output, "resource_type", event.resourceType());
        writeField(output, "resource_id", event.resourceId());
        writeField(output, "result", event.result().name());
        writeField(output, "request_id", event.requestId());
        writeField(output, "previous_hash", event.previousHash());
        return output.toByteArray();
    }

    private String timestamp(Instant instant) {
        return TIMESTAMP_FORMAT.format(instant.truncatedTo(ChronoUnit.MICROS));
    }

    private void writeLine(ByteArrayOutputStream output, String line) {
        output.writeBytes(line.getBytes(StandardCharsets.UTF_8));
        output.write(LINE_SEPARATOR);
    }

    private void writeField(ByteArrayOutputStream output, String name, String value) {
        output.writeBytes(name.getBytes(StandardCharsets.UTF_8));
        output.write(FIELD_SEPARATOR);
        if (value == null) {
            output.writeBytes(NULL_LENGTH.getBytes(StandardCharsets.UTF_8));
            output.write(LENGTH_SEPARATOR);
        } else {
            byte[] bytes = value.getBytes(StandardCharsets.UTF_8);
            output.writeBytes(Integer.toString(bytes.length).getBytes(StandardCharsets.UTF_8));
            output.write(LENGTH_SEPARATOR);
            output.writeBytes(bytes);
        }
        output.write(LINE_SEPARATOR);
    }
}
