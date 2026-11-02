package es.alxarafe.alixar.contact.infrastructure.persistence;

import es.alxarafe.alixar.contact.application.ContactListQuery;
import es.alxarafe.alixar.contact.application.ContactNotFoundException;
import es.alxarafe.alixar.contact.application.ContactPage;
import es.alxarafe.alixar.contact.application.ContactRepository;
import es.alxarafe.alixar.contact.application.CreateContactCommand;
import es.alxarafe.alixar.contact.application.InvalidThirdPartyReferenceException;
import es.alxarafe.alixar.contact.domain.Contact;
import java.util.List;
import org.jooq.Condition;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import org.springframework.dao.DataIntegrityViolationException;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.name;
import static org.jooq.impl.DSL.noCondition;
import static org.jooq.impl.DSL.table;

public class JooqContactRepository implements ContactRepository {

    private static final Table<Record> CONTACT_TABLE = table(name("contact"));

    private static final Field<Long> ID = field(name("id"), Long.class);
    private static final Field<String> LAST_NAME = field(name("last_name"), String.class);
    private static final Field<String> FIRST_NAME = field(name("first_name"), String.class);
    private static final Field<String> EMAIL = field(name("email"), String.class);
    private static final Field<Long> THIRD_PARTY_ID =
        field(name("third_party_id"), Long.class);

    private final DSLContext dsl;

    public JooqContactRepository(DSLContext dsl) {
        this.dsl = dsl;
    }

    @Override
    public Contact findById(long id) {
        return dsl.select(ID, LAST_NAME, FIRST_NAME, EMAIL, THIRD_PARTY_ID)
            .from(CONTACT_TABLE)
            .where(ID.eq(id))
            .fetchOptional(this::toContact)
            .orElseThrow(() -> new ContactNotFoundException(id));
    }

    @Override
    public ContactPage findPage(ContactListQuery query) {
        Condition condition = filterCondition(query);
        long total = dsl.selectCount()
            .from(CONTACT_TABLE)
            .where(condition)
            .fetchOne(0, long.class);
        List<Contact> items = dsl.select(ID, LAST_NAME, FIRST_NAME, EMAIL, THIRD_PARTY_ID)
            .from(CONTACT_TABLE)
            .where(condition)
            .orderBy(ID.asc())
            .limit(query.size())
            .offset(query.offset())
            .fetch(this::toContact);

        return new ContactPage(items, query.page(), query.size(), total);
    }

    @Override
    public long create(CreateContactCommand command) {
        try {
            return dsl.insertInto(CONTACT_TABLE)
                .columns(LAST_NAME, FIRST_NAME, EMAIL, THIRD_PARTY_ID)
                .values(
                    command.lastName(),
                    command.firstName(),
                    command.email(),
                    command.thirdPartyId()
                )
                .returning(ID)
                .fetchOne(ID);
        } catch (DataIntegrityViolationException exception) {
            if (command.thirdPartyId() != null) {
                throw new InvalidThirdPartyReferenceException();
            }
            throw exception;
        }
    }

    private Condition filterCondition(ContactListQuery query) {
        Condition condition = noCondition();
        if (query.thirdPartyId() != null) {
            condition = condition.and(THIRD_PARTY_ID.eq(query.thirdPartyId()));
        }
        return condition;
    }

    private Contact toContact(Record record) {
        return new Contact(
            record.get(ID),
            record.get(LAST_NAME),
            record.get(FIRST_NAME),
            record.get(EMAIL),
            record.get(THIRD_PARTY_ID)
        );
    }
}
