package es.alxarafe.alixar.thirdparty.application;

import es.alxarafe.alixar.core.application.ErrorCode;
import es.alxarafe.alixar.thirdparty.domain.ThirdParty;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class ListThirdPartiesUseCaseTest {

    private final ThirdPartyRepository repository = mock(ThirdPartyRepository.class);
    private final ListThirdPartiesUseCase useCase = new ListThirdPartiesUseCase(repository);

    @Test
    void appliesDefaultPaginationAndForwardsQueryToRepository() {
        ThirdPartyPage page = new ThirdPartyPage(List.of(), 0, 20, 0);
        when(repository.findPage(any())).thenReturn(page);

        ThirdPartyPage result = useCase.execute(
            ThirdPartyListQuery.of(null, null, null, null, null, null)
        );

        assertThat(result).isSameAs(page);
        assertThat(capturedQuery()).isEqualTo(
            new ThirdPartyListQuery(0, 20, null, null, null, null)
        );
    }

    @Test
    void forwardsRequestedPageAndSize() {
        when(repository.findPage(any()))
            .thenReturn(new ThirdPartyPage(List.of(), 2, 5, 0));

        ThirdPartyPage result = useCase.execute(
            ThirdPartyListQuery.of(2, 5, null, null, null, null)
        );

        assertThat(result.page()).isEqualTo(2);
        assertThat(result.size()).isEqualTo(5);
        assertThat(capturedQuery()).isEqualTo(
            new ThirdPartyListQuery(2, 5, null, null, null, null)
        );
    }

    @Test
    void forwardsEachIndividualFilter() {
        when(repository.findPage(any()))
            .thenReturn(new ThirdPartyPage(List.of(), 0, 20, 0));

        useCase.execute(ThirdPartyListQuery.of(null, null, true, null, null, null));
        assertThat(capturedQuery().customer()).isTrue();
        assertThat(capturedQuery().prospect()).isNull();
        assertThat(capturedQuery().supplier()).isNull();
        assertThat(capturedQuery().active()).isNull();

        useCase.execute(ThirdPartyListQuery.of(null, null, null, true, null, null));
        assertThat(capturedQuery().prospect()).isTrue();

        useCase.execute(ThirdPartyListQuery.of(null, null, null, null, true, null));
        assertThat(capturedQuery().supplier()).isTrue();

        useCase.execute(ThirdPartyListQuery.of(null, null, null, null, null, false));
        assertThat(capturedQuery().active()).isFalse();
    }

    @Test
    void forwardsCombinedFilters() {
        when(repository.findPage(any()))
            .thenReturn(new ThirdPartyPage(List.of(), 0, 20, 0));

        useCase.execute(ThirdPartyListQuery.of(null, null, false, false, null, true));

        assertThat(capturedQuery()).isEqualTo(
            new ThirdPartyListQuery(0, 20, false, false, null, true)
        );
    }

    @Test
    void returnsEmptyResultWithoutSynthesizingItems() {
        ThirdPartyPage page = new ThirdPartyPage(List.of(), 0, 20, 0);
        when(repository.findPage(any())).thenReturn(page);

        ThirdPartyPage result = useCase.execute(
            ThirdPartyListQuery.of(null, null, null, null, null, null)
        );

        assertThat(result.items()).isEmpty();
        assertThat(result.total()).isZero();
    }

    @Test
    void preservesTotalIndependentFromPageItemCount() {
        ThirdParty thirdParty = new ThirdParty(
            7L,
            "Acme",
            true,
            false,
            true,
            true,
            null,
            null,
            null,
            null,
            null,
            "ES",
            null,
            null,
            null
        );
        when(repository.findPage(any()))
            .thenReturn(new ThirdPartyPage(List.of(thirdParty), 0, 1, 42));

        ThirdPartyPage result = useCase.execute(
            ThirdPartyListQuery.of(0, 1, null, null, null, null)
        );

        assertThat(result.items()).containsExactly(thirdParty);
        assertThat(result.total()).isEqualTo(42);
    }

    @Test
    void rejectsNegativePage() {
        assertThatThrownBy(() -> ThirdPartyListQuery.of(-1, null, null, null, null, null))
            .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.PAGE);
            });
    }

    @Test
    void rejectsSizeOutsideSupportedRange() {
        for (int size : List.of(0, 101)) {
            assertThatThrownBy(() -> ThirdPartyListQuery.of(null, size, null, null, null, null))
                .isInstanceOfSatisfying(InvalidThirdPartyDataException.class, exception -> {
                    assertThat(exception.errorCode()).isEqualTo(ErrorCode.VALIDATION_INVALID);
                    assertThat(exception.field()).isEqualTo(ThirdPartyFieldNames.SIZE);
                });
        }
    }

    private ThirdPartyListQuery capturedQuery() {
        ArgumentCaptor<ThirdPartyListQuery> captor =
            ArgumentCaptor.forClass(ThirdPartyListQuery.class);
        verify(repository, org.mockito.Mockito.atLeastOnce()).findPage(captor.capture());
        return captor.getValue();
    }
}
