package es.alxarafe.alixar.authentication.api;

import java.util.List;

record AdminUserPageResponse(
    List<AdminUserResponse> items,
    int page,
    int size,
    long total
) {
}
