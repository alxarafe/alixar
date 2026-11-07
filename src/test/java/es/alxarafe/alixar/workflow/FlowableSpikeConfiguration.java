package es.alxarafe.alixar.workflow;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import javax.sql.DataSource;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.core.task.SimpleAsyncTaskExecutor;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

@TestConfiguration(proxyBeanMethods = false)
class FlowableSpikeConfiguration {

    @Bean(destroyMethod = "close")
    DataSource flowableDataSource() {
        HikariConfig config = new HikariConfig();
        config.setPoolName("flowable-spike");
        config.setJdbcUrl(WorkflowSpikeDatabase.url());
        config.setUsername(WorkflowSpikeDatabase.user());
        config.setPassword(WorkflowSpikeDatabase.password());
        config.setSchema(WorkflowSpikeDatabase.flowableSchema());
        config.setMaximumPoolSize(4);
        config.setMinimumIdle(1);
        config.setConnectionTimeout(10_000);
        config.setValidationTimeout(5_000);
        return new HikariDataSource(config);
    }

    @Bean
    PlatformTransactionManager flowableTransactionManager(DataSource flowableDataSource) {
        return new DataSourceTransactionManager(flowableDataSource);
    }

    @Bean(name = "applicationTaskExecutor")
    AsyncTaskExecutor applicationTaskExecutor() {
        SimpleAsyncTaskExecutor executor = new SimpleAsyncTaskExecutor("flowable-spike-");
        executor.setConcurrencyLimit(1);
        return executor;
    }
}
