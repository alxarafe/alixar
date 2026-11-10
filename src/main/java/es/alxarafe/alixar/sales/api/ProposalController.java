package es.alxarafe.alixar.sales.api;

import es.alxarafe.alixar.sales.application.CreateProposalCommand;
import es.alxarafe.alixar.sales.domain.*;
import es.alxarafe.alixar.sales.infrastructure.TransactionalProposalService;
import java.math.BigDecimal;
import java.net.URI;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tools.jackson.databind.JsonNode;
import tools.jackson.databind.DeserializationFeature;
import tools.jackson.databind.json.JsonMapper;
import tools.jackson.databind.cfg.JsonNodeFeature;
import static es.alxarafe.alixar.sales.domain.ProposalFields.*;

@RestController
@RequestMapping(ProposalEndpoints.BASE_PATH)
class ProposalController {
    private static final Set<String> HEADER_FIELDS = Set.of(THIRD_PARTY_ID, CURRENCY, LINES);
    private static final Set<String> LINE_FIELDS = Set.of(DESCRIPTION, QUANTITY, UNIT_NET_PRICE, VAT_RATE);
    private final TransactionalProposalService service;
    private final JsonMapper mapper;
    ProposalController(TransactionalProposalService service, JsonMapper mapper) {
        this.service = service;
        this.mapper = mapper;
    }
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<Created> create(@RequestBody String body) {
        JsonNode root;
        try { root = mapper.reader().with(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS, DeserializationFeature.FAIL_ON_TRAILING_TOKENS)
            .without(JsonNodeFeature.STRIP_TRAILING_BIGDECIMAL_ZEROES).readTree(body); }
        catch (tools.jackson.core.JacksonException ex) { throw new InvalidProposalException(BODY, false); }
        object(root, HEADER_FIELDS, BODY);
        JsonNode thirdParty = required(root, THIRD_PARTY_ID);
        if (!thirdParty.isIntegralNumber() || !thirdParty.canConvertToLong()) { throw invalid(THIRD_PARTY_ID); }
        String currency = text(root, CURRENCY);
        JsonNode lines = required(root, LINES);
        if (!lines.isArray() || lines.size() > ProposalLimits.MAX_LINES) { throw invalid(LINES); }
        List<CreateProposalCommand.Line> inputs = new ArrayList<>();
        for (JsonNode line : lines) {
            object(line, LINE_FIELDS, LINES);
            inputs.add(new CreateProposalCommand.Line(text(line, DESCRIPTION), decimal(line, QUANTITY),
                decimal(line, UNIT_NET_PRICE), decimal(line, VAT_RATE)));
        }
        long id = service.create(new CreateProposalCommand(thirdParty.longValue(), currency, inputs));
        return ResponseEntity.created(URI.create(ProposalEndpoints.BASE_PATH + "/" + id)).body(new Created(id));
    }
    @GetMapping(value = ProposalEndpoints.ITEM_RELATIVE_PATH, produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ProposalResponse> get(@PathVariable(ID) long id) {
        Proposal proposal = service.get(id);
        return ResponseEntity.ok(new ProposalResponse(proposal.id(), proposal.thirdPartyId(), proposal.currency(),
            proposal.state(), proposal.version(), proposal.lines().stream().map(line -> new LineResponse(line.id(),
                line.position(), line.description(), line.quantity(), line.unitNetPrice(), line.vatRate(),
                line.amounts().netAmount(), line.amounts().taxAmount(), line.amounts().grossAmount(), null)).toList(),
            proposal.totals(), List.of(), proposal.createdAt(), proposal.updatedAt()));
    }
    private void object(JsonNode node, Set<String> fields, String field) {
        if (node == null || !node.isObject()) { throw invalid(field); }
        node.propertyNames().forEach(key -> { if (!fields.contains(key)) { throw invalid(key); } });
    }
    private JsonNode required(JsonNode node, String field) {
        JsonNode value = node.get(field);
        if (value == null || value.isNull()) { throw new InvalidProposalException(field, true); }
        return value;
    }
    private String text(JsonNode node, String field) {
        JsonNode value = required(node, field);
        if (!value.isTextual()) { throw invalid(field); }
        return value.textValue();
    }
    private BigDecimal decimal(JsonNode node, String field) {
        JsonNode value = required(node, field);
        if (!value.isNumber()) { throw invalid(field); }
        return value.decimalValue();
    }
    private InvalidProposalException invalid(String field) { return new InvalidProposalException(field, false); }
    record Created(long id) { }
    record ProposalResponse(long id, long thirdPartyId, String currency, String state, long version,
        List<LineResponse> lines, Amounts totals, List<Long> orderIds, Instant createdAt, Instant updatedAt) { }
    record LineResponse(long id, int position, String description, BigDecimal quantity, BigDecimal unitNetPrice,
        BigDecimal vatRate, BigDecimal netAmount, BigDecimal taxAmount, BigDecimal grossAmount, Long convertedOrderId) { }
}
