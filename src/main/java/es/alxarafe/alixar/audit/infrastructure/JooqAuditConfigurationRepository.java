package es.alxarafe.alixar.audit.infrastructure;

import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.Optional;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqAuditConfigurationRepository implements AuditConfigurationRepository {

    private static final Table<Record> TABLE = table(name("audit_configuration"));
    private static final Field<UUID> ID = field(name("audit_configuration", "id"), UUID.class);
    private static final Field<Boolean> SINGLETON =
        field(name("audit_configuration", "singleton"), Boolean.class);
    private static final Field<String> MODE =
        field(name("audit_configuration", "mode"), String.class);
    private static final Field<OffsetDateTime> UPDATED_AT =
        field(name("audit_configuration", "updated_at"), OffsetDateTime.class);

    private final DSLContext dsl;

    public JooqAuditConfigurationRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Optional<AuditPolicyConfiguration> find() {
        return dsl.select(ID, MODE, UPDATED_AT)
            .from(TABLE)
            .fetchOptional(this::toConfiguration);
    }

    @Override
    public Optional<AuditPolicyConfiguration> findForUpdate() {
        return dsl.select(ID, MODE, UPDATED_AT)
            .from(TABLE)
            .forUpdate()
            .fetchOptional(this::toConfiguration);
    }

    @Override
    public void insertIfAbsent(AuditPolicyConfiguration configuration) {
        dsl.insertInto(TABLE)
            .set(ID, configuration.id())
            .set(SINGLETON, true)
            .set(MODE, configuration.mode().name())
            .set(UPDATED_AT, OffsetDateTime.ofInstant(configuration.updatedAt(), ZoneOffset.UTC))
            .onConflictDoNothing()
            .execute();
    }

    @Override
    public void updateMode(UUID id, AuditMode mode, Instant updatedAt) {
        int updated = dsl.update(TABLE)
            .set(MODE, mode.name())
            .set(UPDATED_AT, OffsetDateTime.ofInstant(updatedAt, ZoneOffset.UTC))
            .where(ID.eq(id))
            .execute();
        if (updated != 1) {
            throw new IllegalStateException("Persisted audit configuration was not updated");
        }
    }

    private AuditPolicyConfiguration toConfiguration(Record record) {
        return new AuditPolicyConfiguration(
            record.get(ID),
            AuditMode.valueOf(record.get(MODE)),
            record.get(UPDATED_AT).toInstant()
        );
    }
}
