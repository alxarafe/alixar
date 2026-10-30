package es.alxarafe.alixar.thirdparty.application;

public record FieldUpdate<T>(boolean present, T value) {

    public static <T> FieldUpdate<T> absent() {
        return new FieldUpdate<>(false, null);
    }

    public static <T> FieldUpdate<T> of(T value) {
        return new FieldUpdate<>(true, value);
    }
}
