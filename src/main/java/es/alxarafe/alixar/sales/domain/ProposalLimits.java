package es.alxarafe.alixar.sales.domain;

public final class ProposalLimits {
    public static final int MAX_LINES = 1_000;
    public static final int MAX_DESCRIPTION_CODE_POINTS = 2_000;
    public static final long INITIAL_VERSION = 1;
    public static final String DRAFT = "DRAFT";
    public static String normalizeDescription(String value) {
        if (value == null || value.isBlank()) {
            throw new InvalidProposalException(ProposalFields.DESCRIPTION, true);
        }
        String description = value.strip();
        if (description.codePointCount(0, description.length()) > MAX_DESCRIPTION_CODE_POINTS) {
            throw new InvalidProposalException(ProposalFields.DESCRIPTION, false);
        }
        return description;
    }
    private ProposalLimits() { }
}
