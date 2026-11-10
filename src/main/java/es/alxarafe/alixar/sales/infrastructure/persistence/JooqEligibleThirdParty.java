package es.alxarafe.alixar.sales.infrastructure.persistence;

import es.alxarafe.alixar.sales.application.EligibleThirdParty;
import org.jooq.DSLContext;
import org.jooq.Field;
import static org.jooq.impl.DSL.*;

public class JooqEligibleThirdParty implements EligibleThirdParty {
    private static final org.jooq.Table<org.jooq.Record> THIRD_PARTY = table(name("third_party"));
    private static final Field<Long> ID = field(name("id"), Long.class);
    private static final Field<Boolean> ACTIVE = field(name("active"), Boolean.class);
    private static final Field<Boolean> CUSTOMER = field(name("customer"), Boolean.class);
    private static final Field<Boolean> PROSPECT = field(name("prospect"), Boolean.class);
    private final DSLContext dsl;
    public JooqEligibleThirdParty(DSLContext dsl) { this.dsl = dsl; }
    @Override
    public boolean lockAndCheck(long id) {
        return dsl.select(ACTIVE, CUSTOMER, PROSPECT).from(THIRD_PARTY).where(ID.eq(id))
            .forShare().fetchOptional(row -> Boolean.TRUE.equals(row.get(ACTIVE))
                && (Boolean.TRUE.equals(row.get(CUSTOMER)) || Boolean.TRUE.equals(row.get(PROSPECT))))
            .orElse(false);
    }
}
