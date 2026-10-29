package es.alxarafe.alixar.thirdparty.domain;

public record NewThirdParty(
    String name,
    boolean customer,
    boolean prospect,
    boolean supplier,
    boolean active,
    String taxIdentifier,
    String intraCommunityVatNumber,
    String address,
    String postalCode,
    String town,
    String countryCode,
    String email,
    String phone,
    String website
) {
}
