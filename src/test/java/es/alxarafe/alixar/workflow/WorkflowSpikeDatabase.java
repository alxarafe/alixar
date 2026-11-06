package es.alxarafe.alixar.workflow;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

final class WorkflowSpikeDatabase {

    static final String URL_ENV = "ALIXAR_WORKFLOW_DB_URL";
    static final String USER_ENV = "ALIXAR_WORKFLOW_DB_USER";
    static final String PASSWORD_ENV = "ALIXAR_WORKFLOW_DB_PASSWORD";
    static final String SCHEMA_ENV = "ALIXAR_WORKFLOW_DB_SCHEMA";
    static final String DEFAULT_SCHEMA = "flowable_spike";
    static final String PUBLIC_SCHEMA = "public";

    private static final Pattern SAFE_IDENTIFIER = Pattern.compile("[a-z][a-z0-9_]*");
    private static final Pattern SAFE_TABLE_IDENTIFIER = Pattern.compile("[A-Za-z][A-Za-z0-9_]*");

    private WorkflowSpikeDatabase() {
    }

    static String url() {
        return required(URL_ENV);
    }

    static String user() {
        return required(USER_ENV);
    }

    static String password() {
        return required(PASSWORD_ENV);
    }

    static String flowableSchema() {
        String schema = System.getenv(SCHEMA_ENV);
        String resolved = schema == null || schema.isBlank() ? DEFAULT_SCHEMA : schema.trim();
        if (PUBLIC_SCHEMA.equals(resolved)) {
            throw new IllegalArgumentException("The workflow spike must not use the public schema");
        }
        requireSafeSchema(resolved);
        return resolved;
    }

    static void resetFlowableSchema() throws SQLException {
        String schema = flowableSchema();
        requireSafeSchema(schema);
        try (Connection connection = connection(); Statement statement = connection.createStatement()) {
            statement.execute("drop schema if exists " + schema + " cascade");
            statement.execute("create schema " + schema);
        }
    }

    static Connection connection() throws SQLException {
        return DriverManager.getConnection(url(), user(), password());
    }

    static List<String> tableNames(String schema) throws SQLException {
        requireSafeSchema(schema);
        String sql = "select tablename from pg_catalog.pg_tables where schemaname = ? order by tablename";
        try (Connection connection = connection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, schema);
            try (ResultSet resultSet = statement.executeQuery()) {
                List<String> tables = new ArrayList<>();
                while (resultSet.next()) {
                    tables.add(resultSet.getString(1));
                }
                return tables;
            }
        }
    }

    static long count(String schema, String table) throws SQLException {
        requireSafeSchema(schema);
        requireSafeTable(table);
        try (Connection connection = connection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(
                 "select count(*) from " + schema + "." + table
             )) {
            resultSet.next();
            return resultSet.getLong(1);
        }
    }

    static boolean hasFlowableTables(String schema) throws SQLException {
        return tableNames(schema).stream()
            .map(name -> name.toUpperCase(Locale.ROOT))
            .anyMatch(name -> name.startsWith("ACT_") || name.startsWith("FLW_"));
    }

    private static String required(String name) {
        String value = System.getenv(name);
        if (value == null || value.isBlank()) {
            throw new IllegalStateException(
                name + " must be set; run this integration test through ./bin/check-workflow"
            );
        }
        return value;
    }

    private static void requireSafeSchema(String value) {
        if (!SAFE_IDENTIFIER.matcher(value).matches()) {
            throw new IllegalArgumentException("Unsafe SQL identifier: " + value);
        }
    }

    private static void requireSafeTable(String value) {
        if (!SAFE_TABLE_IDENTIFIER.matcher(value).matches()) {
            throw new IllegalArgumentException("Unsafe SQL identifier: " + value);
        }
    }
}
