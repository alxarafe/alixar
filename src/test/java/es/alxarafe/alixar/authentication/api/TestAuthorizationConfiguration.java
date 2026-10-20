package es.alxarafe.alixar.authentication.api;

import es.alxarafe.alixar.authentication.application.PermissionCodes;
import es.alxarafe.alixartest.TestAdminUsersController;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.security.access.prepost.PreAuthorize;

@TestConfiguration
public class TestAuthorizationConfiguration {

    @Bean
    public TestAdminUsersController testAdminUsersController() {
        return new TestAdminUsersController();
    }

    @Bean
    public TestProtectedOperation testProtectedOperation() {
        return new TestProtectedOperation();
    }

    public static class TestProtectedOperation {

        @PreAuthorize("hasAuthority('" + PermissionCodes.USERS_MANAGE + "')")
        public String execute() {
            return "ok";
        }
    }
}
