package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import com.fasterxml.jackson.annotation.JsonProperty;

public record DolibarrContactDto(
    @JsonProperty("id") long id,
    @JsonProperty("lastname") String lastname,
    @JsonProperty("firstname") String firstname,
    @JsonProperty("email") String email,
    @JsonProperty("fk_soc") Long fkSoc,
    @JsonProperty("socid") Long socid
) {

    Long thirdPartyId() {
        if (fkSoc != null) {
            return fkSoc;
        }
        return socid;
    }

}