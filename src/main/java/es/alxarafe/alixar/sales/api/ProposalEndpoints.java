package es.alxarafe.alixar.sales.api;

public final class ProposalEndpoints {
    public static final String BASE_PATH = "/api/proposals";
    public static final String ITEM_RELATIVE_PATH = "/{id}";
    public static final String ITEM_PATH_PATTERN = BASE_PATH + "/*";
    public static final String DRAFT_SUFFIX = "/draft";
    public static final String DRAFT_RELATIVE_PATH = ITEM_RELATIVE_PATH + DRAFT_SUFFIX;
    public static final String DRAFT_PATH_PATTERN = ITEM_PATH_PATTERN + DRAFT_SUFFIX;
    private ProposalEndpoints() { }
}
