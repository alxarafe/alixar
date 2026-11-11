package es.alxarafe.alixar.sales.application;

public interface EligibleThirdParty {
    /** Check under a shared lock held by the creation transaction until commit. */
    boolean lockAndCheck(long id);
    /** Lock only the target identifier, retaining its observed existence for this transaction. */
    boolean lockIdentifier(long id);
    /** Read commercial flags only after this transaction has locked the existing identifier. */
    boolean isEligible(long id);
}
