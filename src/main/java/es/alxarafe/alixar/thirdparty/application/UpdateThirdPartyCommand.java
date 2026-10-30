package es.alxarafe.alixar.thirdparty.application;

public record UpdateThirdPartyCommand(
    FieldUpdate<String> name,
    FieldUpdate<Boolean> customer,
    FieldUpdate<Boolean> prospect,
    FieldUpdate<Boolean> supplier,
    FieldUpdate<Boolean> active,
    FieldUpdate<String> taxIdentifier,
    FieldUpdate<String> intraCommunityVatNumber,
    FieldUpdate<String> address,
    FieldUpdate<String> postalCode,
    FieldUpdate<String> town,
    FieldUpdate<String> countryCode,
    FieldUpdate<String> email,
    FieldUpdate<String> phone,
    FieldUpdate<String> website
) {
}
