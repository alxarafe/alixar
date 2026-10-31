package es.alxarafe.alixar.contact.infrastructure.persistence;

import es.alxarafe.alixar.contact.application.ThirdPartyReferenceChecker;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.table;

public class JooqThirdPartyReferenceChecker implements ThirdPartyReferenceChecker {

    private static final Table<Record> THIRD_PARTY_TABLE = table(name("third_party"));
    private static final Field<Long> ID = field(name("id"), Long.class);

    private final DSLContext dsl;

    public JooqThirdPartyReferenceChecker(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public boolean existsById(long id) {
        return dsl.fetchExists(
            dsl.selectOne()
                .from(THIRD_PARTY_TABLE)
                .where(ID.eq(id))
        );
    }
}
