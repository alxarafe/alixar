package es.alxarafe.alixar.thirdparty.application;

public record CreateThirdPartyCommand(
    String name,
    Boolean customer,
    Boolean prospect,
    Boolean supplier,
    Boolean active,
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
