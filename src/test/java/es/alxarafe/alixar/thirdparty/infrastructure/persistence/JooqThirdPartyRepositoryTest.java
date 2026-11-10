package es.alxarafe.alixar.thirdparty.infrastructure.persistence;

import org.junit.jupiter.api.Test;
import org.postgresql.util.PSQLException;
import org.postgresql.util.ServerErrorMessage;
import org.springframework.dao.DataIntegrityViolationException;

import static org.assertj.core.api.Assertions.assertThat;

class JooqThirdPartyRepositoryTest {

    private static final String CONTACT_FK = "contact_third_party_id_fkey";

    @Test
    void restrictViolationOnContactForeignKeyIsTranslated() {
        assertThat(isKnownThirdPartyReferenceViolation("23001", CONTACT_FK)).isTrue();
    }

    @Test
    void foreignKeyViolationOnContactForeignKeyIsTranslated() {
        assertThat(isKnownThirdPartyReferenceViolation("23503", CONTACT_FK)).isTrue();
    }

    @Test
    void proposalReferenceViolationsUseTheExistingDeleteConflict() {
        String proposalFk = "sales_proposal_third_party_id_fkey";
        assertThat(isKnownThirdPartyReferenceViolation("23001", proposalFk)).isTrue();
        assertThat(isKnownThirdPartyReferenceViolation("23503", proposalFk)).isTrue();
        assertThat(isKnownThirdPartyReferenceViolation("23514", proposalFk)).isFalse();
    }

    @Test
    void referentialViolationOnAnotherConstraintIsNotTranslated() {
        assertThat(isKnownThirdPartyReferenceViolation("23001", "another_table_contact_fkey"))
            .isFalse();
        assertThat(isKnownThirdPartyReferenceViolation("23503", "another_table_contact_fkey"))
            .isFalse();
    }

    @Test
    void referentialViolationWithoutConstraintIsNotTranslated() {
        assertThat(isKnownThirdPartyReferenceViolation("23001", null)).isFalse();
        assertThat(isKnownThirdPartyReferenceViolation("23503", null)).isFalse();
    }

    private static boolean isKnownThirdPartyReferenceViolation(
        String sqlState,
        String constraint
    ) {
        String serverMessage = "SERROR\0C" + sqlState + "\0Mforeign key violation\0";
        if (constraint != null) {
            serverMessage += "n" + constraint + "\0";
        }
        PSQLException postgresException =
            new PSQLException(new ServerErrorMessage(serverMessage));
        DataIntegrityViolationException exception =
            new DataIntegrityViolationException("violation", postgresException);
        return JooqThirdPartyRepository.isKnownThirdPartyReferenceViolation(exception);
    }
}
