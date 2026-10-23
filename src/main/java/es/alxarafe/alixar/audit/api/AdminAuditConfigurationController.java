package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.application.AuditConfigurationMissingException;
import es.alxarafe.alixar.audit.application.AuditConfigurationRepository;
import es.alxarafe.alixar.audit.application.AuditMode;
import es.alxarafe.alixar.audit.application.AuditPolicyConfiguration;
import es.alxarafe.alixar.audit.application.InvalidAuditModeException;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditConfigurationService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AuditEndpoints.CONFIGURATION_PATH)
class AdminAuditConfigurationController {

    private final AuditConfigurationRepository configurationRepository;
    private final TransactionalAuditConfigurationService configurationService;

    AdminAuditConfigurationController(
        AuditConfigurationRepository configurationRepository,
        TransactionalAuditConfigurationService configurationService
    ) {
        this.configurationRepository = configurationRepository;
        this.configurationService = configurationService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    AuditConfigurationResponse get() {
        return toResponse(
            configurationRepository.find()
                .orElseThrow(AuditConfigurationMissingException::new)
        );
    }

    @PutMapping(
        consumes = MediaType.APPLICATION_JSON_VALUE,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AuditConfigurationResponse update(
        @Valid @RequestBody UpdateAuditConfigurationRequest request
    ) {
        return toResponse(configurationService.updateMode(parseMode(request.mode())));
    }

    private AuditMode parseMode(String mode) {
        try {
            return AuditMode.valueOf(mode);
        } catch (IllegalArgumentException exception) {
            throw new InvalidAuditModeException();
        }
    }

    private AuditConfigurationResponse toResponse(AuditPolicyConfiguration configuration) {
        return new AuditConfigurationResponse(
            configuration.id(),
            configuration.mode(),
            configuration.updatedAt()
        );
    }

    record UpdateAuditConfigurationRequest(
        @NotBlank(message = "{validation.required}") String mode
    ) {
    }
}
