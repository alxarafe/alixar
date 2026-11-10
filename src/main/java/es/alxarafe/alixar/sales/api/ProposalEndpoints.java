package es.alxarafe.alixar.sales.api;

public final class ProposalEndpoints {
    public static final String BASE_PATH = "/api/proposals";
    public static final String ITEM_RELATIVE_PATH = "/{id}";
    public static final String ITEM_PATH_PATTERN = BASE_PATH + "/*";
    private ProposalEndpoints() { }
}
