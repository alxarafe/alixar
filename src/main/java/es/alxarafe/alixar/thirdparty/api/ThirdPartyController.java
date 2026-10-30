package es.alxarafe.alixar.thirdparty.api;

import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ACTIVE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.ADDRESS;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.BODY;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.COUNTRY_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.CUSTOMER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.EMAIL;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.INTRA_COMMUNITY_VAT_NUMBER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.NAME;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PAGE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PHONE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.POSTAL_CODE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.PROSPECT;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.SIZE;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.SUPPLIER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TAX_IDENTIFIER;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.TOWN;
import static es.alxarafe.alixar.thirdparty.application.ThirdPartyFieldNames.WEBSITE;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.application.CreateThirdPartyCommand;
import es.alxarafe.alixar.thirdparty.application.GetThirdPartyUseCase;
import es.alxarafe.alixar.thirdparty.application.InvalidThirdPartyDataException;
import es.alxarafe.alixar.thirdparty.application.ListThirdPartiesUseCase;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyListQuery;
import es.alxarafe.alixar.thirdparty.application.ThirdPartyPage;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import es.alxarafe.alixar.thirdparty.infrastructure.TransactionalThirdPartyService;
import java.net.URI;
import java.util.List;
import java.util.Set;
import org.springframework.http.MediaType;
import tools.jackson.databind.JsonNode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(ThirdPartyEndpoints.BASE_PATH)
class ThirdPartyController {

    private static final Set<String> REQUEST_FIELDS = Set.of(
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
    );

    private final GetThirdPartyUseCase getThirdPartyUseCase;
    private final ListThirdPartiesUseCase listThirdPartiesUseCase;
    private final TransactionalThirdPartyService thirdPartyService;

    ThirdPartyController(
        GetThirdPartyUseCase getThirdPartyUseCase,
        ListThirdPartiesUseCase listThirdPartiesUseCase,
        TransactionalThirdPartyService thirdPartyService
    ) {
        this.getThirdPartyUseCase = getThirdPartyUseCase;
        this.listThirdPartiesUseCase = listThirdPartiesUseCase;
        this.thirdPartyService = thirdPartyService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ThirdPartyPageResponse> list(
        @RequestParam(name = PAGE, required = false) Integer page,
        @RequestParam(name = SIZE, required = false) Integer size,
        @RequestParam(name = CUSTOMER, required = false) Boolean customer,
        @RequestParam(name = PROSPECT, required = false) Boolean prospect,
        @RequestParam(name = SUPPLIER, required = false) Boolean supplier,
        @RequestParam(name = ACTIVE, required = false) Boolean active
    ) {
        ThirdPartyPage result = listThirdPartiesUseCase.execute(
            ThirdPartyListQuery.of(page, size, customer, prospect, supplier, active)
        );
        return ResponseEntity.ok(new ThirdPartyPageResponse(
            result.items().stream().map(this::toResponse).toList(),
            result.page(),
            result.size(),
            result.total()
        ));
    }

    @GetMapping(
        value = ThirdPartyEndpoints.ITEM_RELATIVE_PATH,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    ResponseEntity<ThirdPartyResponse> get(
        @PathVariable(ThirdPartyEndpoints.ID_PATH_VARIABLE) long id
    ) {
        ThirdParty thirdParty = getThirdPartyUseCase.execute(id);
        return ResponseEntity.ok(toResponse(thirdParty));
    }

    @PostMapping(
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    ResponseEntity<CreateThirdPartyResponse> create(@RequestBody JsonNode request) {
        long id = thirdPartyService.create(toCommand(request));
        URI location = URI.create(ThirdPartyEndpoints.BASE_PATH + "/" + id);
        return ResponseEntity.created(location).body(new CreateThirdPartyResponse(id));
    }

    private CreateThirdPartyCommand toCommand(JsonNode request) {
        if (request == null || !request.isObject()) {
            throw invalid(BODY);
        }
        rejectUnknownFields(request);

        return new CreateThirdPartyCommand(
            requiredText(request, NAME),
            optionalBoolean(request, CUSTOMER),
            optionalBoolean(request, PROSPECT),
            optionalBoolean(request, SUPPLIER),
            optionalBoolean(request, ACTIVE),
            optionalText(request, TAX_IDENTIFIER),
            optionalText(request, INTRA_COMMUNITY_VAT_NUMBER),
            optionalText(request, ADDRESS),
            optionalText(request, POSTAL_CODE),
            optionalText(request, TOWN),
            optionalText(request, COUNTRY_CODE),
            optionalText(request, EMAIL),
            optionalText(request, PHONE),
            optionalText(request, WEBSITE)
        );
    }

    private void rejectUnknownFields(JsonNode request) {
        request.propertyNames().forEach(field -> {
            if (!REQUEST_FIELDS.contains(field)) {
                throw invalid(field);
            }
        });
    }

    private String requiredText(JsonNode request, String field) {
        JsonNode value = request.get(field);
        if (value == null || value.isNull()) {
            throw required(field);
        }
        if (!value.isTextual()) {
            throw invalid(field);
        }
        return value.textValue();
    }

    private String optionalText(JsonNode request, String field) {
        JsonNode value = request.get(field);
        if (value == null || value.isNull()) {
            return null;
        }
        if (!value.isTextual()) {
            throw invalid(field);
        }
        return value.textValue();
    }

    private Boolean optionalBoolean(JsonNode request, String field) {
        JsonNode value = request.get(field);
        if (value == null || value.isNull()) {
            return null;
        }
        if (!value.isBoolean()) {
            throw invalid(field);
        }
        return value.booleanValue();
    }

    private InvalidThirdPartyDataException required(String field) {
        return new InvalidThirdPartyDataException(ErrorCode.VALIDATION_REQUIRED, field);
    }

    private InvalidThirdPartyDataException invalid(String field) {
        return new InvalidThirdPartyDataException(ErrorCode.VALIDATION_INVALID, field);
    }

    private ThirdPartyResponse toResponse(ThirdParty thirdParty) {
        return new ThirdPartyResponse(
            thirdParty.id(),
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
        );
    }

    record CreateThirdPartyResponse(
        long id
    ) {
    }

    record ThirdPartyPageResponse(
        List<ThirdPartyResponse> items,
        int page,
        int size,
        long total
    ) {
    }

    record ThirdPartyResponse(
        long id,
        String name,
        boolean customer,
        boolean prospect,
        boolean supplier,
        boolean active,
        String taxIdentifier,
        String intraCommunityVatNumber,
        String address,
        String postalCode,
        String town,
        String countryCode,
        String email,
        String phone,
        String website
    ) {
    }
}
