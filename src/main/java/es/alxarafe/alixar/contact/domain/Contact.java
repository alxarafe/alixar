package es.alxarafe.alixar.contact.domain;

public record Contact(
    long id,
    String lastName,
    String firstName,
    String email,
    Long thirdPartyId
) {
}