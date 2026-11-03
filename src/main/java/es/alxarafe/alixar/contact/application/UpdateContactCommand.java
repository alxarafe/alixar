package es.alxarafe.alixar.contact.application;

public record UpdateContactCommand(
    FieldUpdate<String> lastName,
    FieldUpdate<String> firstName,
    FieldUpdate<String> email,
    FieldUpdate<Long> thirdPartyId
) {
}
