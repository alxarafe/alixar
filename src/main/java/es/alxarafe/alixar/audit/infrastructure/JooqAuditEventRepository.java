package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditEventQuery;
import es.alxarafe.alixar.audit.application.AuditEventRepository;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqAuditEventRepository implements AuditEventRepository {

    private static final Table<Record> CHAIN_HEAD_TABLE = table(name("audit_chain_head"));
    private static final Table<Record> EVENT_TABLE = table(name("audit_event"));

    private static final Field<UUID> CHAIN_ID =
        field(name("audit_chain_head", "chain_id"), UUID.class);
    private static final Field<Long> LAST_SEQUENCE =
        field(name("audit_chain_head", "last_sequence"), Long.class);
    private static final Field<String> LAST_HASH =
        field(name("audit_chain_head", "last_hash"), String.class);
    private static final Field<OffsetDateTime> HEAD_UPDATED_AT =
        field(name("audit_chain_head", "updated_at"), OffsetDateTime.class);

    private static final Field<UUID> EVENT_ID = field(name("audit_event", "id"), UUID.class);
    private static final Field<UUID> EVENT_CHAIN_ID =
        field(name("audit_event", "chain_id"), UUID.class);
    private static final Field<Long> EVENT_SEQUENCE =
        field(name("audit_event", "sequence"), Long.class);
    private static final Field<OffsetDateTime> OCCURRED_AT =
        field(name("audit_event", "occurred_at"), OffsetDateTime.class);
    private static final Field<UUID> ACTOR_USER_ID =
        field(name("audit_event", "actor_user_id"), UUID.class);
    private static final Field<String> ACTOR_USERNAME =
        field(name("audit_event", "actor_username"), String.class);
    private static final Field<String> AUTHENTICATION_TYPE =
        field(name("audit_event", "authentication_type"), String.class);
    private static final Field<String> ACTION =
        field(name("audit_event", "action"), String.class);
    private static final Field<String> RESOURCE_TYPE =
        field(name("audit_event", "resource_type"), String.class);
    private static final Field<String> RESOURCE_ID =
        field(name("audit_event", "resource_id"), String.class);
    private static final Field<String> RESULT =
        field(name("audit_event", "result"), String.class);
    private static final Field<String> REQUEST_ID =
        field(name("audit_event", "request_id"), String.class);
    private static final Field<Short> INTEGRITY_FORMAT_VERSION =
        field(name("audit_event", "integrity_format_version"), Short.class);
    private static final Field<String> PREVIOUS_HASH =
        field(name("audit_event", "previous_hash"), String.class);
    private static final Field<String> EVENT_HASH =
        field(name("audit_event", "event_hash"), String.class);

    private static final Field<?>[] EVENT_FIELDS = {
        EVENT_ID,
        EVENT_CHAIN_ID,
        EVENT_SEQUENCE,
        OCCURRED_AT,
        ACTOR_USER_ID,
        ACTOR_USERNAME,
        AUTHENTICATION_TYPE,
        ACTION,
        RESOURCE_TYPE,
        RESOURCE_ID,
        RESULT,
        REQUEST_ID,
        INTEGRITY_FORMAT_VERSION,
        PREVIOUS_HASH,
        EVENT_HASH
    };

    private final DSLContext dsl;

    public JooqAuditEventRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Optional<AuditChainHead> lockChainHead(UUID chainId) {
        return dsl.select(CHAIN_ID, LAST_SEQUENCE, LAST_HASH)
            .from(CHAIN_HEAD_TABLE)
            .where(CHAIN_ID.eq(chainId))
            .forUpdate()
            .fetchOptional(this::toChainHead);
    }

    @Override
    public Optional<AuditChainHead> findChainHead(UUID chainId) {
        return dsl.select(CHAIN_ID, LAST_SEQUENCE, LAST_HASH)
            .from(CHAIN_HEAD_TABLE)
            .where(CHAIN_ID.eq(chainId))
            .fetchOptional(this::toChainHead);
    }

    @Override
    public void insert(AuditEvent event) {
        dsl.insertInto(EVENT_TABLE)
            .set(EVENT_ID, event.id())
            .set(EVENT_CHAIN_ID, event.chainId())
            .set(EVENT_SEQUENCE, event.sequence())
            .set(OCCURRED_AT, OffsetDateTime.ofInstant(event.occurredAt(), ZoneOffset.UTC))
            .set(ACTOR_USER_ID, event.actorUserId())
            .set(ACTOR_USERNAME, event.actorUsername())
            .set(
                AUTHENTICATION_TYPE,
                event.authenticationType() == null ? null : event.authenticationType().name()
            )
            .set(ACTION, event.action())
            .set(RESOURCE_TYPE, event.resourceType())
            .set(RESOURCE_ID, event.resourceId())
            .set(RESULT, event.result().name())
            .set(REQUEST_ID, event.requestId())
            .set(INTEGRITY_FORMAT_VERSION, (short) event.integrityFormatVersion())
            .set(PREVIOUS_HASH, event.previousHash())
            .set(EVENT_HASH, event.eventHash())
            .execute();
    }

    @Override
    public void updateChainHead(AuditChainHead head) {
        int updatedRows = dsl.update(CHAIN_HEAD_TABLE)
            .set(LAST_SEQUENCE, head.lastSequence())
            .set(LAST_HASH, head.lastHash())
            .set(HEAD_UPDATED_AT, OffsetDateTime.now(ZoneOffset.UTC))
            .where(CHAIN_ID.eq(head.chainId()))
            .execute();
        if (updatedRows != 1) {
            throw new IllegalStateException("Audit chain head not found: " + head.chainId());
        }
    }

    @Override
    public List<AuditEvent> readEvents(UUID chainId, long afterSequence, int limit) {
        return dsl.select(EVENT_FIELDS)
            .from(EVENT_TABLE)
            .where(EVENT_CHAIN_ID.eq(chainId))
            .and(EVENT_SEQUENCE.gt(afterSequence))
            .orderBy(EVENT_SEQUENCE)
            .limit(limit)
            .fetch(this::toAuditEvent);
    }

    @Override
    public List<AuditEvent> findEvents(AuditEventQuery query) {
        Condition condition = EVENT_CHAIN_ID.eq(query.chainId())
            .and(EVENT_SEQUENCE.gt(query.afterSequence()));
        if (query.action() != null) {
            condition = condition.and(ACTION.eq(query.action().name()));
        }
        if (query.resourceType() != null) {
            condition = condition.and(RESOURCE_TYPE.eq(query.resourceType().name()));
        }
        if (query.resourceId() != null) {
            condition = condition.and(RESOURCE_ID.eq(query.resourceId()));
        }
        if (query.actorUserId() != null) {
            condition = condition.and(ACTOR_USER_ID.eq(query.actorUserId()));
        }
        if (query.result() != null) {
            condition = condition.and(RESULT.eq(query.result().name()));
        }

        return dsl.select(EVENT_FIELDS)
            .from(EVENT_TABLE)
            .where(condition)
            .orderBy(EVENT_SEQUENCE)
            .limit(query.limit())
            .fetch(this::toAuditEvent);
    }

    private AuditChainHead toChainHead(Record record) {
        return new AuditChainHead(
            record.get(CHAIN_ID),
            record.get(LAST_SEQUENCE),
            record.get(LAST_HASH)
        );
    }

    private AuditEvent toAuditEvent(Record record) {
        Short formatVersion = record.get(INTEGRITY_FORMAT_VERSION);
        return new AuditEvent(
            record.get(EVENT_ID),
            record.get(EVENT_CHAIN_ID),
            record.get(EVENT_SEQUENCE),
            record.get(OCCURRED_AT).toInstant(),
            record.get(ACTOR_USER_ID),
            record.get(ACTOR_USERNAME),
            toAuthenticationType(record.get(AUTHENTICATION_TYPE)),
            record.get(ACTION),
            record.get(RESOURCE_TYPE),
            record.get(RESOURCE_ID),
            AuditResult.valueOf(record.get(RESULT)),
            record.get(REQUEST_ID),
            formatVersion == null ? 0 : formatVersion.intValue(),
            record.get(PREVIOUS_HASH),
            record.get(EVENT_HASH)
        );
    }

    private AuditAuthenticationType toAuthenticationType(String value) {
        return value == null ? null : AuditAuthenticationType.valueOf(value);
    }
}
