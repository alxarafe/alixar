package es.alxarafe.alixar.audit.api;

import es.alxarafe.alixar.audit.application.AuditAction;
import es.alxarafe.alixar.audit.application.AuditEventQuery;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.AuditVerificationResult;
import es.alxarafe.alixar.audit.application.ListAuditEventsUseCase;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import es.alxarafe.alixar.audit.domain.AuditResult;
import es.alxarafe.alixar.audit.infrastructure.TransactionalAuditService;
import java.util.List;
import java.util.UUID;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AuditEndpoints.BASE_PATH)
class AdminAuditEventController {

    private final ListAuditEventsUseCase listAuditEvents;
    private final TransactionalAuditService transactionalAuditService;

    AdminAuditEventController(
        ListAuditEventsUseCase listAuditEvents,
        TransactionalAuditService transactionalAuditService
    ) {
        this.listAuditEvents = listAuditEvents;
        this.transactionalAuditService = transactionalAuditService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    List<AuditEventResponse> list(
        @RequestParam(name = AuditEventQuery.AFTER_SEQUENCE_PARAM, required = false)
        Long afterSequence,
        @RequestParam(name = AuditEventQuery.LIMIT_PARAM, required = false)
        Integer limit,
        @RequestParam(name = AuditEventQuery.ACTION_PARAM, required = false)
        AuditAction action,
        @RequestParam(name = AuditEventQuery.RESOURCE_TYPE_PARAM, required = false)
        AuditResourceType resourceType,
        @RequestParam(name = AuditEventQuery.RESOURCE_ID_PARAM, required = false)
        String resourceId,
        @RequestParam(name = AuditEventQuery.ACTOR_USER_ID_PARAM, required = false)
        UUID actorUserId,
        @RequestParam(name = AuditEventQuery.RESULT_PARAM, required = false)
        AuditResult result
    ) {
        AuditEventQuery query = AuditEventQuery.forDefaultChain(
            afterSequence,
            limit,
            action,
            resourceType,
            resourceId,
            actorUserId,
            result
        );
        return listAuditEvents.execute(query).stream()
            .map(this::toResponse)
            .toList();
    }

    @GetMapping(
        value = AuditEndpoints.VERIFICATION_RELATIVE_PATH,
        produces = MediaType.APPLICATION_JSON_VALUE
    )
    AuditVerificationResponse verify() {
        AuditVerificationResult result =
            transactionalAuditService.verify(AuditChain.DEFAULT_CHAIN_ID);
        return new AuditVerificationResponse(
            AuditChain.DEFAULT_CHAIN_ID,
            result.valid(),
            result.checkedEvents(),
            result.failure() == null ? null : result.failure().name(),
            result.failedSequence()
        );
    }

    private AuditEventResponse toResponse(AuditEvent event) {
        return new AuditEventResponse(
            event.id(),
            event.chainId(),
            event.sequence(),
            event.occurredAt(),
            event.actorUserId(),
            event.actorUsername(),
            event.authenticationType() == null ? null : event.authenticationType().name(),
            event.action(),
            event.resourceType(),
            event.resourceId(),
            event.result().name(),
            event.requestId(),
            event.integrityFormatVersion(),
            event.previousHash(),
            event.eventHash()
        );
    }
}
