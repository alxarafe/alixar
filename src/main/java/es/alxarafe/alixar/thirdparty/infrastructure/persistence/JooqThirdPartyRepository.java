package es.alxarafe.alixar.thirdparty.infrastructure.persistence;

import es.alxarafe.alixar.thirdparty.application.ThirdPartyListQuery;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyPage;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyRepository;
import es.alxarafe.alixar.thirdparty.domain.NewThirdParty;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.List;
import java.util.Optional;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.noCondition;
import static org.jooq.impl.DSL.table;

public class JooqThirdPartyRepository implements ThirdPartyRepository {

    private static final Table<Record> THIRD_PARTY_TABLE = table(name("third_party"));

    private static final Field<Long> ID = field(name("id"), Long.class);
    private static final Field<String> NAME = field(name("name"), String.class);
    private static final Field<Boolean> CUSTOMER = field(name("customer"), Boolean.class);
    private static final Field<Boolean> PROSPECT = field(name("prospect"), Boolean.class);
    private static final Field<Boolean> SUPPLIER = field(name("supplier"), Boolean.class);
    private static final Field<Boolean> ACTIVE = field(name("active"), Boolean.class);
    private static final Field<String> TAX_IDENTIFIER =
        field(name("tax_identifier"), String.class);
    private static final Field<String> INTRA_COMMUNITY_VAT_NUMBER =
        field(name("intra_community_vat_number"), String.class);
    private static final Field<String> ADDRESS = field(name("address"), String.class);
    private static final Field<String> POSTAL_CODE = field(name("postal_code"), String.class);
    private static final Field<String> TOWN = field(name("town"), String.class);
    private static final Field<String> COUNTRY_CODE = field(name("country_code"), String.class);
    private static final Field<String> EMAIL = field(name("email"), String.class);
    private static final Field<String> PHONE = field(name("phone"), String.class);
    private static final Field<String> WEBSITE = field(name("website"), String.class);

    private final DSLContext dsl;

    public JooqThirdPartyRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Optional<ThirdParty> findById(long id) {
        return dsl.select(
                ID,
                NAME,
                CUSTOMER,
                PROSPECT,
                SUPPLIER,
                ACTIVE,
                TAX_IDENTIFIER,
                INTRA_COMMUNITY_VAT_NUMBER,
                ADDRESS,
                POSTAL_CODE,
                TOWN,
                COUNTRY_CODE,
                EMAIL,
                PHONE,
                WEBSITE
            )
            .from(THIRD_PARTY_TABLE)
            .where(ID.eq(id))
            .fetchOptional(this::toThirdParty);
    }

    @Override
    public ThirdPartyPage findPage(ThirdPartyListQuery query) {
        Condition condition = filterCondition(query);
        long total = dsl.selectCount()
            .from(THIRD_PARTY_TABLE)
            .where(condition)
            .fetchOne(0, long.class);
        List<ThirdParty> items = dsl.select(
                ID,
                NAME,
                CUSTOMER,
                PROSPECT,
                SUPPLIER,
                ACTIVE,
                TAX_IDENTIFIER,
                INTRA_COMMUNITY_VAT_NUMBER,
                ADDRESS,
                POSTAL_CODE,
                TOWN,
                COUNTRY_CODE,
                EMAIL,
                PHONE,
                WEBSITE
            )
            .from(THIRD_PARTY_TABLE)
            .where(condition)
            .orderBy(ID.asc())
            .limit(query.size())
            .offset(query.offset())
            .fetch(this::toThirdParty);

        return new ThirdPartyPage(items, query.page(), query.size(), total);
    }

    @Override
    public long create(NewThirdParty thirdParty) {
        return dsl.insertInto(THIRD_PARTY_TABLE)
            .columns(
                NAME,
                CUSTOMER,
                PROSPECT,
                SUPPLIER,
                ACTIVE,
                TAX_IDENTIFIER,
                INTRA_COMMUNITY_VAT_NUMBER,
                ADDRESS,
                POSTAL_CODE,
                TOWN,
                COUNTRY_CODE,
                EMAIL,
                PHONE,
                WEBSITE
            )
            .values(
                thirdParty.name(),
                thirdParty.customer(),
                thirdParty.prospect(),
                thirdParty.supplier(),
                thirdParty.active(),
                thirdParty.taxIdentifier(),
                thirdParty.intraCommunityVatNumber(),
                thirdParty.address(),
                thirdParty.postalCode(),
                thirdParty.town(),
                thirdParty.countryCode(),
                thirdParty.email(),
                thirdParty.phone(),
                thirdParty.website()
            )
            .returning(ID)
            .fetchOne(ID);
    }

    private Condition filterCondition(ThirdPartyListQuery query) {
        Condition condition = noCondition();
        if (query.customer() != null) {
            condition = condition.and(CUSTOMER.eq(query.customer()));
        }
        if (query.prospect() != null) {
            condition = condition.and(PROSPECT.eq(query.prospect()));
        }
        if (query.supplier() != null) {
            condition = condition.and(SUPPLIER.eq(query.supplier()));
        }
        if (query.active() != null) {
            condition = condition.and(ACTIVE.eq(query.active()));
        }
        return condition;
    }

    private ThirdParty toThirdParty(Record record) {
        return new ThirdParty(
            record.get(ID),
            record.get(NAME),
            Boolean.TRUE.equals(record.get(CUSTOMER)),
            Boolean.TRUE.equals(record.get(PROSPECT)),
            Boolean.TRUE.equals(record.get(SUPPLIER)),
            Boolean.TRUE.equals(record.get(ACTIVE)),
            record.get(TAX_IDENTIFIER),
            record.get(INTRA_COMMUNITY_VAT_NUMBER),
            record.get(ADDRESS),
            record.get(POSTAL_CODE),
            record.get(TOWN),
            record.get(COUNTRY_CODE),
            record.get(EMAIL),
            record.get(PHONE),
            record.get(WEBSITE)
        );
    }
}
