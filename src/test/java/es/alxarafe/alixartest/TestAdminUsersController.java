package es.alxarafe.alixartest;

import es.alxarafe.alixar.authentication.api.AdminUserEndpoints;
import es.alxarafe.alixar.authentication.application.PermissionCodes;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(AdminUserEndpoints.BASE_PATH)
public class TestAdminUsersController {

    @GetMapping("/probe")
    @PreAuthorize("hasAuthority('" + PermissionCodes.USERS_MANAGE + "')")
    public String probe() {
        return "ok";
    }
}
