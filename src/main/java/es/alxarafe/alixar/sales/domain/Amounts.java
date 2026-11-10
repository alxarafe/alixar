package es.alxarafe.alixar.sales.domain;

import java.math.BigDecimal;

public record Amounts(BigDecimal netAmount, BigDecimal taxAmount, BigDecimal grossAmount) {
    public static Amounts zero() {
        BigDecimal zero = BigDecimal.ZERO.setScale(MonetaryPolicy.AMOUNT_SCALE);
        return new Amounts(zero, zero, zero);
    }
    public Amounts plus(Amounts other) {
        return new Amounts(netAmount.add(other.netAmount), taxAmount.add(other.taxAmount),
            grossAmount.add(other.grossAmount));
    }
}
