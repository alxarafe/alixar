package es.alxarafe.alixar.authentication.api;

import java.util.List;

record AdminRoleResponse(
    String code,
    String name,
    List<String> permissions
) {
}
