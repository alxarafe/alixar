package es.alxarafe.alixar.sales.domain;

import java.math.BigDecimal;
import java.math.RoundingMode;

/** Immutable calculation rules; changing rules requires a new historical identifier. */
public final class MonetaryPolicy {
    public static final MonetaryPolicy EUR_V1 = new MonetaryPolicy();
    public static final String IDENTIFIER = "EUR-LINE-NET-TAX-HALF-UP-v1";
    public static final String CURRENCY = "EUR";
    public static final int INPUT_PRECISION = 19;
    public static final int INPUT_SCALE = 6;
    public static final int VAT_PRECISION = 7;
    public static final int VAT_SCALE = 4;
    public static final int AMOUNT_PRECISION = 19;
    public static final int AMOUNT_SCALE = 2;
    public static final RoundingMode ROUNDING = RoundingMode.HALF_UP;
    private static final BigDecimal PERCENT_BASE = new BigDecimal("100");

    private MonetaryPolicy() { }
    public String identifier() { return IDENTIFIER; }
    public void checkCurrency(String currency) {
        if (!CURRENCY.equals(currency)) { throw new UnsupportedCurrencyException(); }
    }
    public Amounts calculate(BigDecimal quantity, BigDecimal price, BigDecimal vat) {
        checkInputs(quantity, price, vat);
        BigDecimal net = quantity.multiply(price).setScale(AMOUNT_SCALE, ROUNDING);
        BigDecimal tax = net.multiply(vat).divide(PERCENT_BASE).setScale(AMOUNT_SCALE, ROUNDING);
        Amounts result = new Amounts(net, tax, net.add(tax));
        checkAmounts(result);
        return result;
    }
    /** Structural bounds shared by creation and replacement; performs no calculation. */
    public static void checkInputs(BigDecimal quantity, BigDecimal price, BigDecimal vat) {
        checkDecimal(quantity, INPUT_PRECISION, INPUT_SCALE, ProposalFields.QUANTITY);
        checkDecimal(price, INPUT_PRECISION, INPUT_SCALE, ProposalFields.UNIT_NET_PRICE);
        checkDecimal(vat, VAT_PRECISION, VAT_SCALE, ProposalFields.VAT_RATE);
        if (quantity.signum() <= 0) { throw new InvalidProposalException(ProposalFields.QUANTITY, false); }
        if (vat.compareTo(PERCENT_BASE) > 0) { throw new InvalidProposalException(ProposalFields.VAT_RATE, false); }
    }
    public void checkAmounts(Amounts amounts) {
        checkDecimal(amounts.netAmount(), AMOUNT_PRECISION, AMOUNT_SCALE, ProposalFields.TOTALS);
        checkDecimal(amounts.taxAmount(), AMOUNT_PRECISION, AMOUNT_SCALE, ProposalFields.TOTALS);
        checkDecimal(amounts.grossAmount(), AMOUNT_PRECISION, AMOUNT_SCALE, ProposalFields.TOTALS);
    }
    private static void checkDecimal(BigDecimal value, int precision, int scale, String field) {
        if (value == null) { throw new InvalidProposalException(field, true); }
        // Count integer digits without expanding exponents or rounding input.
        if (value.signum() < 0 || value.scale() > scale
            || (long) value.precision() - value.scale() > precision - scale) {
            throw new InvalidProposalException(field, false);
        }
    }
}
