package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.AuditReadLevel;
import es.alxarafe.alixar.audit.application.AuditReadPolicy;
import es.alxarafe.alixar.audit.application.AuditReadPolicyRepository;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.InvalidAuditReadPolicyException;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditReadPolicyService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AuditEndpoints.READ_POLICY_PATH)
class AdminAuditReadPolicyController {

    private final AuditConfigurationRepository configurationRepository;
    private final AuditReadPolicyRepository readPolicyRepository;
    private final TransactionalAuditReadPolicyService readPolicyService;

    AdminAuditReadPolicyController(
        AuditConfigurationRepository configurationRepository,
        AuditReadPolicyRepository readPolicyRepository,
        TransactionalAuditReadPolicyService readPolicyService
    ) {
        this.configurationRepository = configurationRepository;
        this.readPolicyRepository = readPolicyRepository;
        this.readPolicyService = readPolicyService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    AuditReadPolicyResponse get() {
        AuditPolicyConfiguration configuration = configurationRepository.find()
            .orElseThrow(AuditConfigurationMissingException::new);
        return toResponse(new AuditReadPolicy(
            configuration.id(),
            readPolicyRepository.findRules(configuration.id())
        ));
    }

    @PutMapping(
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AuditReadPolicyResponse update(
        @Valid @RequestBody UpdateAuditReadPolicyRequest request
    ) {
        return toResponse(readPolicyService.replaceRules(parseRules(request.rules())));
    }

    private Map<AuditResourceType, AuditReadLevel> parseRules(
        List<ReadPolicyRuleRequest> requestedRules
    ) {
        EnumMap<AuditResourceType, AuditReadLevel> rules =
            new EnumMap<>(AuditResourceType.class);
        EnumSet<AuditResourceType> seen = EnumSet.noneOf(AuditResourceType.class);
        for (ReadPolicyRuleRequest requestedRule : requestedRules) {
            if (requestedRule == null) {
                throw new InvalidAuditReadPolicyException("rules");
            }
            AuditResourceType resourceType = parseResourceType(requestedRule.resourceType());
            AuditReadLevel readLevel = parseReadLevel(requestedRule.readLevel());
            if (!seen.add(resourceType)) {
                throw new InvalidAuditReadPolicyException("resourceType");
            }
            if (readLevel != AuditReadLevel.NONE) {
                rules.put(resourceType, readLevel);
            }
        }
        return rules;
    }

    private AuditResourceType parseResourceType(String resourceType) {
        if (resourceType == null || resourceType.isBlank()) {
            throw new InvalidAuditReadPolicyException("resourceType");
        }
        try {
            AuditResourceType parsed = AuditResourceType.valueOf(resourceType);
            if (!AuditReadPolicy.CONFIGURABLE_RESOURCE_TYPES.contains(parsed)) {
                throw new InvalidAuditReadPolicyException("resourceType");
            }
            return parsed;
        } catch (IllegalArgumentException exception) {
            throw new InvalidAuditReadPolicyException("resourceType");
        }
    }

    private AuditReadLevel parseReadLevel(String readLevel) {
        if (readLevel == null || readLevel.isBlank()) {
            throw new InvalidAuditReadPolicyException("readLevel");
        }
        try {
            return AuditReadLevel.valueOf(readLevel);
        } catch (IllegalArgumentException exception) {
            throw new InvalidAuditReadPolicyException("readLevel");
        }
    }

    private AuditReadPolicyResponse toResponse(AuditReadPolicy policy) {
        List<ReadPolicyRuleResponse> rules = new ArrayList<>();
        policy.rules().entrySet().stream()
            .sorted(Map.Entry.comparingByKey(Comparator.comparing(AuditResourceType::name)))
            .forEach(entry -> rules.add(new ReadPolicyRuleResponse(
                entry.getKey(),
                entry.getValue()
            )));
        return new AuditReadPolicyResponse(policy.configurationId(), List.copyOf(rules));
    }

    record UpdateAuditReadPolicyRequest(
        @NotNull(message = "{validation.required}") @Valid
        List<ReadPolicyRuleRequest> rules
    ) {
    }

    record ReadPolicyRuleRequest(
        @NotBlank(message = "{validation.required}") String resourceType,
        @NotBlank(message = "{validation.required}") String readLevel
    ) {
    }

    record AuditReadPolicyResponse(
        UUID configurationId,
        List<ReadPolicyRuleResponse> rules
    ) {
    }

    record ReadPolicyRuleResponse(
        AuditResourceType resourceType,
        AuditReadLevel readLevel
    ) {
    }
}
