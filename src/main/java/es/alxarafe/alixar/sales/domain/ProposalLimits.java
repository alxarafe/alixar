package es.alxarafe.alixar.sales.domain;

public final class ProposalLimits {
    public static final int MAX_LINES = 1_000;
    public static final int MAX_DESCRIPTION_CODE_POINTS = 2_000;
    public static final long INITIAL_VERSION = 1;
    public static final String DRAFT = "DRAFT";
    private ProposalLimits() { }
}
