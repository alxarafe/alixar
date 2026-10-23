package es.alxarafe.alixar.authentication.application;

import es.alxarafe.alixar.audit.application.AuditActor;
import es.alxarafe.alixar.audit.application.AuditResourceType;
import es.alxarafe.alixar.audit.application.PreparedReadAudit;
import es.alxarafe.alixar.audit.application.ReadAuditKind;
import es.alxarafe.alixar.audit.application.ReadAuditRecorder;
import es.alxarafe.alixar.audit.domain.AuditAuthenticationType;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.inOrder;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class AuditedAdminReadServiceTest {

    private static final UUID USER_ID = UUID.randomUUID();

    private final ListAdminUsersUseCase listAdminUsers = mock(ListAdminUsersUseCase.class);
    private final GetAdminUserUseCase getAdminUser = mock(GetAdminUserUseCase.class);
    private final ListRolesUseCase listRoles = mock(ListRolesUseCase.class);
    private final GetRoleUseCase getRole = mock(GetRoleUseCase.class);
    private final ReadAuditRecorder recorder = mock(ReadAuditRecorder.class);
    private final AuditedAdminReadService service = new AuditedAdminReadService(
        listAdminUsers,
        getAdminUser,
        listRoles,
        getRole,
        recorder
    );
    private final PreparedReadAudit prepared = new PreparedReadAudit(
        new AuditActor(USER_ID, "actor", AuditAuthenticationType.SESSION),
        AuditResourceType.USER,
        ReadAuditKind.QUERY
    );

    @Test
    void listUsers_preparesBeforeReadingAndRecordsAfterMaterialization() {
        AdminUserSearchQuery query = AdminUserSearchQuery.of(null, null, null, null);
        AdminUserPage page = new AdminUserPage(List.of(), 0, 20, 0);
        when(recorder.prepare(AuditResourceType.USER, ReadAuditKind.QUERY))
            .thenReturn(Optional.of(prepared));
        when(listAdminUsers.execute(query)).thenReturn(page);

        AdminUserPage result = service.listUsers(query);

        assertThat(result).isSameAs(page);
        InOrder order = inOrder(recorder, listAdminUsers);
        order.verify(recorder).prepare(AuditResourceType.USER, ReadAuditKind.QUERY);
        order.verify(listAdminUsers).execute(query);
        order.verify(recorder).record(prepared, null);
    }

    @Test
    void getUser_doesNotRecordWhenReadFails() {
        when(recorder.prepare(AuditResourceType.USER, ReadAuditKind.OBJECT))
            .thenReturn(Optional.of(new PreparedReadAudit(
                prepared.actor(),
                AuditResourceType.USER,
                ReadAuditKind.OBJECT
            )));
        when(getAdminUser.execute(USER_ID)).thenThrow(new UserNotFoundException(USER_ID));

        assertThatThrownBy(() -> service.getUser(USER_ID))
            .isInstanceOf(UserNotFoundException.class);
        verify(recorder, never()).record(any(), any());
    }

    @Test
    void getRole_recordsInternalRoleIdAfterRead() {
        RoleDefinition role = new RoleDefinition(
            UUID.randomUUID(),
            "custom-role",
            "Custom role",
            false,
            List.of()
        );
        PreparedReadAudit roleAudit = new PreparedReadAudit(
            prepared.actor(),
            AuditResourceType.ROLE,
            ReadAuditKind.OBJECT
        );
        when(recorder.prepare(AuditResourceType.ROLE, ReadAuditKind.OBJECT))
            .thenReturn(Optional.of(roleAudit));
        when(getRole.execute("custom-role")).thenReturn(role);

        assertThat(service.getRole("custom-role")).isSameAs(role);
        verify(recorder).record(roleAudit, role.id());
    }

    @Test
    void listRoles_recordsOneQueryEvent() {
        when(recorder.prepare(AuditResourceType.ROLE, ReadAuditKind.QUERY))
            .thenReturn(Optional.of(prepared));
        when(listRoles.execute()).thenReturn(List.of());

        assertThat(service.listRoles()).isEmpty();
        verify(recorder).record(prepared, null);
    }

    @Test
    void auditNotRequired_stillReturnsMaterializedResult() {
        AdminUser user = new AdminUser(
            USER_ID,
            "user",
            "user@example.test",
            true,
            Instant.now(),
            Instant.now(),
            List.of()
        );
        when(recorder.prepare(AuditResourceType.USER, ReadAuditKind.OBJECT))
            .thenReturn(Optional.empty());
        when(getAdminUser.execute(USER_ID)).thenReturn(user);

        assertThat(service.getUser(USER_ID)).isSameAs(user);
        verify(recorder, never()).record(any(), any());
    }
}
