package es.alxarafe.alixar.thirdparty.application;

public class ThirdPartyDeleteConflictException extends RuntimeException {

    private final ThirdPartyErrorCode errorCode;

    public ThirdPartyDeleteConflictException() {
        super(ThirdPartyErrorCode.THIRD_PARTY_DELETE_CONFLICT.name());
        this.errorCode = ThirdPartyErrorCode.THIRD_PARTY_DELETE_CONFLICT;
    }

    public ThirdPartyErrorCode errorCode() {
        return errorCode;
    }
}
