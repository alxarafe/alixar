package es.alxarafe.alixar.contact.application;

public record CreateContactCommand(
    String lastName,
    String firstName,
    String email,
    Long thirdPartyId
) {
}