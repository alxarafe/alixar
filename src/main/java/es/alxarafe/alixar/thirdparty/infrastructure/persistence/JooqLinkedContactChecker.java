package es.alxarafe.alixar.thirdparty.infrastructure.persistence;

import es.alxarafe.alixar.thirdparty.application.LinkedContactChecker;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqLinkedContactChecker implements LinkedContactChecker {

    private static final Table<Record> CONTACT_TABLE = table(name("contact"));
    private static final Field<Long> THIRD_PARTY_ID =
        field(name("third_party_id"), Long.class);

    private final DSLContext dsl;

    public JooqLinkedContactChecker(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public boolean existsForThirdParty(long thirdPartyId) {
        return dsl.fetchExists(
            dsl.selectOne()
                .from(CONTACT_TABLE)
                .where(THIRD_PARTY_ID.eq(thirdPartyId))
        );
    }
}
