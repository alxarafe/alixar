package es.alxarafe.alixar.thirdparty.application;

public class ThirdPartyNotFoundException extends RuntimeException {

    private final ThirdPartyErrorCode errorCode;
    private final long id;

    public ThirdPartyNotFoundException(long id) {
        super(ThirdPartyErrorCode.THIRD_PARTY_NOT_FOUND.name() + ":" + id);
        this.errorCode = ThirdPartyErrorCode.THIRD_PARTY_NOT_FOUND;
        this.id = id;
    }

    public ThirdPartyErrorCode errorCode() {
        return errorCode;
    }

    public long id() {
        return id;
    }
}
