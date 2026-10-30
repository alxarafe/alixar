package es.alxarafe.alixar.thirdparty.api;

public final class ThirdPartyEndpoints {

    public static final String BASE_PATH = "/api/thirdparties";
    public static final String ITEM_RELATIVE_PATH = "/{id}";
    public static final String ITEM_PATH_PATTERN = BASE_PATH + "/**";
    public static final String ID_PATH_VARIABLE = "id";
    public static final String MERGE_PATCH_MEDIA_TYPE = "application/merge-patch+json";

    private ThirdPartyEndpoints() {
    }
}
