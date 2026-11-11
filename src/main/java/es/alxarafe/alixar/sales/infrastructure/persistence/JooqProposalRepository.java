package es.alxarafe.alixar.sales.infrastructure.persistence;

import es.alxarafe.alixar.sales.application.ProposalNotFoundException;
import es.alxarafe.alixar.sales.application.ProposalRepository;
import es.alxarafe.alixar.sales.application.PrepareProposalDraftReplacement;
import es.alxarafe.alixar.sales.domain.*;
import java.math.BigDecimal;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.List;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Record;
import org.jooq.Table;
import static org.jooq.impl.DSL.*;

public class JooqProposalRepository implements ProposalRepository {
    private static final Table<Record> PROPOSAL = table(name("sales_proposal"));
    private static final Table<Record> LINE = table(name("sales_proposal_line"));
    private static final Field<Long> ID = field(name("id"), Long.class);
    private static final Field<Long> THIRD_PARTY_ID = field(name("third_party_id"), Long.class);
    private static final Field<Long> PROPOSAL_ID = field(name("proposal_id"), Long.class);
    private static final Field<String> CURRENCY = field(name("currency"), String.class);
    private static final Field<String> STATE = field(name("state"), String.class);
    private static final Field<Long> VERSION = field(name("version"), Long.class);
    private static final Field<String> POLICY = field(name("monetary_policy_id"), String.class);
    private static final Field<OffsetDateTime> CREATED = field(name("created_at"), OffsetDateTime.class);
    private static final Field<OffsetDateTime> UPDATED = field(name("updated_at"), OffsetDateTime.class);
    private static final Field<Integer> POSITION = field(name("position"), Integer.class);
    private static final Field<String> DESCRIPTION = field(name("description"), String.class);
    private static final Field<BigDecimal> QUANTITY = field(name("quantity"), BigDecimal.class);
    private static final Field<BigDecimal> PRICE = field(name("unit_net_price"), BigDecimal.class);
    private static final Field<BigDecimal> VAT = field(name("vat_rate"), BigDecimal.class);
    private static final Field<BigDecimal> NET = field(name("net_amount"), BigDecimal.class);
    private static final Field<BigDecimal> TAX = field(name("tax_amount"), BigDecimal.class);
    private static final Field<BigDecimal> GROSS = field(name("gross_amount"), BigDecimal.class);
    private final DSLContext dsl;
    public JooqProposalRepository(DSLContext dsl) { this.dsl = dsl; }
    @Override
    public long create(Proposal draft) {
        long id = dsl.insertInto(PROPOSAL)
            .columns(THIRD_PARTY_ID, CURRENCY, STATE, VERSION, POLICY, CREATED, UPDATED)
            .values(draft.thirdPartyId(), draft.currency(), draft.state(), draft.version(),
                draft.monetaryPolicyId(), draft.createdAt().atOffset(ZoneOffset.UTC), draft.updatedAt().atOffset(ZoneOffset.UTC))
            .returning(ID).fetchOne(ID);
        for (ProposalLine line : draft.lines()) {
            dsl.insertInto(LINE).columns(PROPOSAL_ID, POSITION, DESCRIPTION, QUANTITY, PRICE, VAT, NET, TAX, GROSS)
                .values(id, line.position(), line.description(), line.quantity(), line.unitNetPrice(), line.vatRate(),
                    line.amounts().netAmount(), line.amounts().taxAmount(), line.amounts().grossAmount()).execute();
        }
        return id;
    }
    @Override
    public Proposal findById(long id) {
        Record header = dsl.select(ID, THIRD_PARTY_ID, CURRENCY, STATE, VERSION, POLICY, CREATED, UPDATED)
            .from(PROPOSAL).where(ID.eq(id)).fetchOptional().orElseThrow(ProposalNotFoundException::new);
        return readLines(id, header);
    }
    @Override
    public Proposal lockAndFindById(long id, long expectedVersion) {
        Record header = dsl.select(ID, THIRD_PARTY_ID, CURRENCY, STATE, VERSION, POLICY, CREATED, UPDATED)
            .from(PROPOSAL).where(ID.eq(id)).forUpdate().fetchOptional().orElseThrow(ProposalNotFoundException::new);
        PrepareProposalDraftReplacement.checkVersionAndState(header.get(VERSION), header.get(STATE), expectedVersion);
        return readLines(id, header);
    }
    private Proposal readLines(long id, Record header) {
        List<ProposalLine> lines = dsl.select(ID, POSITION, DESCRIPTION, QUANTITY, PRICE, VAT, NET, TAX, GROSS)
            .from(LINE).where(PROPOSAL_ID.eq(id)).orderBy(POSITION.asc())
            .fetch(row -> new ProposalLine(row.get(ID), row.get(POSITION), row.get(DESCRIPTION), row.get(QUANTITY),
                row.get(PRICE), row.get(VAT), new Amounts(row.get(NET), row.get(TAX), row.get(GROSS))));
        Amounts totals = lines.stream().map(ProposalLine::amounts).reduce(Amounts.zero(), Amounts::plus);
        return new Proposal(id, header.get(THIRD_PARTY_ID), header.get(CURRENCY), header.get(STATE),
            header.get(VERSION), header.get(POLICY), lines, totals,
            header.get(CREATED).toInstant(), header.get(UPDATED).toInstant());
    }
    @Override
    public void replace(PrepareProposalDraftReplacement.Prepared replacement, long expectedVersion, Instant updatedAt) {
        dsl.deleteFrom(LINE).where(PROPOSAL_ID.eq(replacement.id())).execute();
        int position = 1;
        for (var line : replacement.lines()) {
            dsl.insertInto(LINE).columns(PROPOSAL_ID, POSITION, DESCRIPTION, QUANTITY, PRICE, VAT, NET, TAX, GROSS)
                .values(replacement.id(), position++, line.description(), line.quantity(), line.unitNetPrice(), line.vatRate(),
                    line.amounts().netAmount(), line.amounts().taxAmount(), line.amounts().grossAmount()).execute();
        }
        int affected = dsl.update(PROPOSAL).set(THIRD_PARTY_ID, replacement.thirdPartyId())
            .set(VERSION, replacement.version()).set(UPDATED, updatedAt.atOffset(ZoneOffset.UTC))
            .where(ID.eq(replacement.id()).and(VERSION.eq(expectedVersion)).and(STATE.eq(ProposalLimits.DRAFT)))
            .execute();
        if (affected != 1) { throw new IllegalStateException("Guarded proposal replacement must update exactly one row"); }
    }
}
