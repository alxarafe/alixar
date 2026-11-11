package es.alxarafe.alixar.sales.application;

/** A stable business rejection; contains no stored document data. */
public class DraftReplacementRejectedException extends RuntimeException {
    private final SalesErrorCode code;
    public DraftReplacementRejectedException(SalesErrorCode code) { this.code = code; }
    public SalesErrorCode code() { return code; }
}
