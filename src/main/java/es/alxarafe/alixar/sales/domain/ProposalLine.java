package es.alxarafe.alixar.sales.domain;

import java.math.BigDecimal;

public record ProposalLine(long id, int position, String description, BigDecimal quantity,
    BigDecimal unitNetPrice, BigDecimal vatRate, Amounts amounts) { }
