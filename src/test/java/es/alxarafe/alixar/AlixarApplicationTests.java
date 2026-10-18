package es.alxarafe.alixar;

import es.alxarafe.alixar.authentication.AuthenticationTestConfig;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;

@ActiveProfiles("test")
@Import(AuthenticationTestConfig.class)
@SpringBootTest
class AlixarApplicationTests {

    @Test
    void contextLoads() {
    }

}
