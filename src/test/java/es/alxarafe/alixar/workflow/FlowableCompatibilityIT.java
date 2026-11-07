package es.alxarafe.alixar.workflow;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.Connection;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import org.flowable.engine.HistoryService;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.Test;
import org.flowable.spring.boot.ProcessEngineAutoConfiguration;
import org.flowable.spring.boot.ProcessEngineServicesAutoConfiguration;
import org.springframework.boot.autoconfigure.AutoConfigurations;
import org.springframework.boot.jackson.autoconfigure.JacksonAutoConfiguration;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;

class FlowableCompatibilityIT {

    private static final String PROCESS_KEY = "alixarWf001Spike";
    private static final String BPMN_RESOURCE = "bpmn/alixar-wf-001.bpmn20.xml";
    private static final String USER_TASK_NAME = "ALIXAR-WF-001 user task";
    private static final String FLYWAY_SCHEMA_HISTORY = "flyway_schema_history";
    private static final int FLYWAY_MIGRATION_COUNT = 13;

    private static final List<String> ALIXAR_TABLES = List.of(
        "authentication_user",
        "authentication_password_reset",
        "authentication_api_token",
        "authentication_role",
        "authentication_permission",
        "authentication_role_permission",
        "authentication_user_role",
        "audit_chain_head",
        "audit_event",
        "audit_configuration",
        "audit_read_policy",
        "third_party",
        "contact",
        "flyway_schema_history"
    );

    @Test
    void processLifecyclePersistsAcrossEngineRestartAndKeepsAlixarSchemaIntact() throws Exception {
        assertPostgresqlVersion();
        WorkflowSpikeDatabase.resetFlowableSchema();
        migrateAlixarSchema();

        List<String> alixarTablesBefore = WorkflowSpikeDatabase.tableNames(
            WorkflowSpikeDatabase.PUBLIC_SCHEMA
        );
        assertThat(alixarTablesBefore).containsExactlyInAnyOrderElementsOf(ALIXAR_TABLES);
        assertThat(WorkflowSpikeDatabase.hasFlowableTables(WorkflowSpikeDatabase.PUBLIC_SCHEMA)).isFalse();

        AtomicReference<String> processInstanceId = new AtomicReference<>();
        AtomicReference<String> taskId = new AtomicReference<>();

        flowableContextRunner().run(context -> {
            assertThat(context).hasNotFailed();
            ProcessEngine engine = context.getBean(ProcessEngine.class);
            RepositoryService repositoryService = engine.getRepositoryService();
            RuntimeService runtimeService = engine.getRuntimeService();
            TaskService taskService = engine.getTaskService();

            Deployment deployment = repositoryService.createDeployment()
                .name("ALIXAR-WF-001 spike")
                .addClasspathResource(BPMN_RESOURCE)
                .deploy();
            ProcessDefinition definition = repositoryService.createProcessDefinitionQuery()
                .deploymentId(deployment.getId())
                .singleResult();
            assertThat(definition).isNotNull();
            assertThat(definition.getKey()).isEqualTo(PROCESS_KEY);

            ProcessInstance instance = runtimeService.startProcessInstanceByKey(PROCESS_KEY);
            processInstanceId.set(instance.getId());

            Task task = taskService.createTaskQuery()
                .processInstanceId(instance.getId())
                .singleResult();
            assertThat(task).isNotNull();
            assertThat(task.getName()).isEqualTo(USER_TASK_NAME);
            taskId.set(task.getId());

            assertThat(WorkflowSpikeDatabase.hasFlowableTables(WorkflowSpikeDatabase.PUBLIC_SCHEMA))
                .isFalse();
            assertThat(WorkflowSpikeDatabase.hasFlowableTables(schema())).isTrue();
        });

        assertThat(processInstanceId.get()).isNotBlank();
        assertThat(taskId.get()).isNotBlank();
        assertThat(WorkflowSpikeDatabase.count(schema(), "ACT_RU_TASK")).isEqualTo(1);
        assertThat(WorkflowSpikeDatabase.count(schema(), "ACT_HI_TASKINST")).isGreaterThanOrEqualTo(1);

        flowableContextRunner().run(context -> {
            assertThat(context).hasNotFailed();
            ProcessEngine engine = context.getBean(ProcessEngine.class);
            TaskService taskService = engine.getTaskService();
            RuntimeService runtimeService = engine.getRuntimeService();
            HistoryService historyService = engine.getHistoryService();

            Task task = taskService.createTaskQuery()
                .processInstanceId(processInstanceId.get())
                .singleResult();
            assertThat(task).isNotNull();
            assertThat(task.getId()).isEqualTo(taskId.get());

            taskService.complete(task.getId());

            assertThat(runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId.get())
                .count()).isZero();

            HistoricProcessInstance historicProcess = historyService
                .createHistoricProcessInstanceQuery()
                .processInstanceId(processInstanceId.get())
                .singleResult();
            assertThat(historicProcess).isNotNull();
            assertThat(historicProcess.getEndTime()).isNotNull();

            HistoricTaskInstance historicTask = historyService
                .createHistoricTaskInstanceQuery()
                .taskId(taskId.get())
                .singleResult();
            assertThat(historicTask).isNotNull();
            assertThat(historicTask.getEndTime()).isNotNull();
        });

        assertThat(WorkflowSpikeDatabase.count(schema(), "ACT_RU_TASK")).isZero();
        assertThat(WorkflowSpikeDatabase.count(schema(), "ACT_RU_EXECUTION")).isZero();
        assertThat(WorkflowSpikeDatabase.count(schema(), "ACT_HI_PROCINST")).isGreaterThanOrEqualTo(1);
        assertThat(WorkflowSpikeDatabase.count(schema(), "ACT_HI_TASKINST")).isGreaterThanOrEqualTo(1);

        assertThat(WorkflowSpikeDatabase.tableNames(WorkflowSpikeDatabase.PUBLIC_SCHEMA))
            .containsExactlyInAnyOrderElementsOf(alixarTablesBefore);
        assertThat(WorkflowSpikeDatabase.hasFlowableTables(WorkflowSpikeDatabase.PUBLIC_SCHEMA)).isFalse();
        assertThat(WorkflowSpikeDatabase.count(
            WorkflowSpikeDatabase.PUBLIC_SCHEMA,
            FLYWAY_SCHEMA_HISTORY
        )).isEqualTo(FLYWAY_MIGRATION_COUNT);
    }

    private ApplicationContextRunner flowableContextRunner() {
        return new ApplicationContextRunner()
            .withUserConfiguration(FlowableSpikeConfiguration.class)
            .withConfiguration(AutoConfigurations.of(
                JacksonAutoConfiguration.class,
                ProcessEngineAutoConfiguration.class,
                ProcessEngineServicesAutoConfiguration.class
            ))
            .withPropertyValues(
                "spring.main.web-application-type=none",
                "flowable.process.enabled=true",
                "flowable.app.enabled=false",
                "flowable.cmmn.enabled=false",
                "flowable.dmn.enabled=false",
                "flowable.idm.enabled=false",
                "flowable.db-identity-used=false",
                "flowable.eventregistry.enabled=false",
                "flowable.rest-api-enabled=false",
                "flowable.database-schema=" + schema(),
                "flowable.database-schema-update=true",
                "flowable.history-level=full",
                "flowable.async-executor-activate=false",
                "flowable.async-history-executor-activate=false",
                "flowable.check-process-definitions=false",
                "flowable.process-definition-location-prefix=classpath:/flowable-spike/no-auto-deploy/"
            );
    }

    private void migrateAlixarSchema() {
        Flyway flyway = Flyway.configure()
            .dataSource(
                WorkflowSpikeDatabase.url(),
                WorkflowSpikeDatabase.user(),
                WorkflowSpikeDatabase.password()
            )
            .locations("classpath:db/migration")
            .load();
        flyway.migrate();
        assertThat(flyway.info().all()).hasSize(FLYWAY_MIGRATION_COUNT);
        assertThat(flyway.info().current()).isNotNull();
        assertThat(flyway.info().current().getVersion().getVersion())
            .isEqualTo(String.valueOf(FLYWAY_MIGRATION_COUNT));
    }

    private void assertPostgresqlVersion() throws Exception {
        try (Connection connection = WorkflowSpikeDatabase.connection()) {
            assertThat(connection.getMetaData().getDatabaseProductVersion()).startsWith("18.6");
        }
    }

    private String schema() {
        return WorkflowSpikeDatabase.flowableSchema();
    }
}
