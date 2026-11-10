package es.alxarafe.alixar.sales.application;

import java.math.BigDecimal;
import java.util.List;

public record CreateProposalCommand(Long thirdPartyId, String currency, List<Line> lines) {
    public record Line(String description, BigDecimal quantity, BigDecimal unitNetPrice, BigDecimal vatRate) { }
}
