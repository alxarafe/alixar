package es.alxarafe.alixar.persistence;

import javax.sql.DataSource;
import org.flywaydb.core.Flyway;
import org.jooq.DSLContext;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

// Runs explicitly in bin/check against its isolated Compose database.
@SpringBootTest(properties = "spring.autoconfigure.exclude=")
class PersistenceIT {

    private static final String POSTGRESQL_VERSION = "18.6";
    private static final String HISTORY_TABLE = "flyway_schema_history";

    @Autowired
    private DataSource dataSource;

    @Autowired
    private Flyway flyway;

    @Autowired
    private DSLContext dsl;

    @Test
    void bootIntegratesPostgresqlFlywayAndJooqWithoutBusinessMigrations() throws Exception {
        try (var connection = dataSource.getConnection()) {
            assertThat(connection.getMetaData().getDatabaseProductVersion())
                .startsWith(POSTGRESQL_VERSION);
        }
        assertThat(flyway.getConfiguration().getDataSource()).isSameAs(dataSource);
        assertThat(flyway.info().all()).isEmpty();
        assertThat(dsl.selectOne().fetchSingle().value1()).isEqualTo(1);
        assertThat(dsl.fetch("select tablename from pg_catalog.pg_tables where schemaname = current_schema()")
            .getValues(0, String.class)).containsExactly(HISTORY_TABLE);
        assertThat(dsl.fetchCount(org.jooq.impl.DSL.table(org.jooq.impl.DSL.name(HISTORY_TABLE))))
            .isZero();
    }
}
