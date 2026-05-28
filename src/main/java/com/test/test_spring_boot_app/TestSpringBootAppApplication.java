package com.test.test_spring_boot_app;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Slf4j
@SpringBootApplication
@EnableScheduling
public class TestSpringBootAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(TestSpringBootAppApplication.class, args);
	}

	@Scheduled(fixedRate = 3000L)
	public void testSchedule () {
		log.info("test123");
		log.info("test3211111222");
		log.info("test3211111222");
	}

}
