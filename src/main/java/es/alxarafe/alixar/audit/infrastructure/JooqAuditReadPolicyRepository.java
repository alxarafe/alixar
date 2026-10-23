package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.EnumMap;
import java.util.Map;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqAuditReadPolicyRepository implements AuditReadPolicyRepository {

    private static final Table<Record> TABLE = table(name("audit_read_policy"));
    private static final Field<UUID> CONFIGURATION_ID =
        field(name("audit_read_policy", "audit_configuration_id"), UUID.class);
    private static final Field<String> RESOURCE_TYPE =
        field(name("audit_read_policy", "resource_type"), String.class);
    private static final Field<String> READ_LEVEL =
        field(name("audit_read_policy", "read_level"), String.class);
    private static final Field<OffsetDateTime> UPDATED_AT =
        field(name("audit_read_policy", "updated_at"), OffsetDateTime.class);

    private final DSLContext dsl;

    public JooqAuditReadPolicyRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Map<AuditResourceType, AuditReadLevel> findRules(UUID configurationId) {
        EnumMap<AuditResourceType, AuditReadLevel> rules =
            new EnumMap<>(AuditResourceType.class);
        dsl.select(RESOURCE_TYPE, READ_LEVEL)
            .from(TABLE)
            .where(CONFIGURATION_ID.eq(configurationId))
            .fetch()
            .forEach(record -> rules.put(
                AuditResourceType.valueOf(record.get(RESOURCE_TYPE)),
                AuditReadLevel.valueOf(record.get(READ_LEVEL))
            ));
        return rules;
    }

    @Override
    public void replaceRules(
        UUID configurationId,
        Map<AuditResourceType, AuditReadLevel> rules,
        Instant updatedAt
    ) {
        dsl.deleteFrom(TABLE)
            .where(CONFIGURATION_ID.eq(configurationId))
            .execute();
        OffsetDateTime updated = OffsetDateTime.ofInstant(updatedAt, ZoneOffset.UTC);
        rules.forEach((resourceType, readLevel) -> dsl.insertInto(TABLE)
            .set(CONFIGURATION_ID, configurationId)
            .set(RESOURCE_TYPE, resourceType.name())
            .set(READ_LEVEL, readLevel.name())
            .set(UPDATED_AT, updated)
            .execute());
    }
}
