package es.alxarafe.alixar.sales.application;

public interface EligibleThirdParty {
    /** Check under a shared lock held by the creation transaction until commit. */
    boolean lockAndCheck(long id);
}
