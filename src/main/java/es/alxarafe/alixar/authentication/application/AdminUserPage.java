package es.alxarafe.alixar.authentication.application;

import java.util.List;

public record AdminUserPage(
    List<AdminUser> items,
    int page,
    int size,
    long total
) {

    public AdminUserPage {
        items = List.copyOf(items);
    }
}
