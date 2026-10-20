package es.alxarafe.alixar.authentication.application;

import java.util.Locale;

public record AdminUserSearchQuery(
    int page,
    int size,
    String query,
    Boolean enabled
) {

    public static final int DEFAULT_PAGE = 0;
    public static final int DEFAULT_SIZE = 20;
    public static final int MAX_SIZE = 100;

    public AdminUserSearchQuery {
        if (page < DEFAULT_PAGE) {
            throw new InvalidPaginationException("page");
        }
        if (size < 1 || size > MAX_SIZE) {
            throw new InvalidPaginationException("size");
        }
        query = normalizeQuery(query);
    }

    public static AdminUserSearchQuery of(Integer page, Integer size, String query, Boolean enabled) {
        return new AdminUserSearchQuery(
            page != null ? page : DEFAULT_PAGE,
            size != null ? size : DEFAULT_SIZE,
            query,
            enabled
        );
    }

    public long offset() {
        return (long) page * size;
    }

    private static String normalizeQuery(String query) {
        return query == null || query.isBlank() ? null : query.strip().toLowerCase(Locale.ROOT);
    }
}
