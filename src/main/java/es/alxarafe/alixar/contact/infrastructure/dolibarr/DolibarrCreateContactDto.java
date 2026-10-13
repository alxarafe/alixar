package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record DolibarrCreateContactDto(
    @JsonProperty("lastname") String lastname,
    @JsonProperty("firstname") String firstname,
    @JsonProperty("email") String email,
    @JsonProperty("socid") Long socid
) {
}