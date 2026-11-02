package es.alxarafe.alixar.contact.api;

public final class ContactEndpoints {

    public static final String BASE_PATH = "/api/contacts";
    public static final String ITEM_RELATIVE_PATH = "/{id}";
    public static final String ITEM_PATH_PATTERN = BASE_PATH + "/**";
    public static final String ID_PATH_VARIABLE = "id";

    private ContactEndpoints() {
    }
}
