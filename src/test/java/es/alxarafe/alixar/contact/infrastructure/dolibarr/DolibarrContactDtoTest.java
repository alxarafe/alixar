package es.alxarafe.alixar.contact.infrastructure.dolibarr;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class DolibarrContactDtoTest {

    @Test
    void thirdPartyId_usesFkSocWhenPresent() {
        DolibarrContactDto dto = new DolibarrContactDto(1L, "Doe", "John", "john@example.test", 42L, null);

        assertThat(dto.thirdPartyId()).isEqualTo(42L);
    }

    @Test
    void thirdPartyId_fallsBackToSocidWhenFkSocNull() {
        DolibarrContactDto dto = new DolibarrContactDto(1L, "Doe", "John", "john@example.test", null, 42L);

        assertThat(dto.thirdPartyId()).isEqualTo(42L);
    }

    @Test
    void thirdPartyId_returnsNullWhenBothNull() {
        DolibarrContactDto dto = new DolibarrContactDto(1L, "Doe", "John", "john@example.test", null, null);

        assertThat(dto.thirdPartyId()).isNull();
    }

    @Test
    void thirdPartyId_prefersFkSocOverSocid() {
        DolibarrContactDto dto = new DolibarrContactDto(1L, "Doe", "John", "john@example.test", 42L, 99L);

        assertThat(dto.thirdPartyId()).isEqualTo(42L);
    }

}