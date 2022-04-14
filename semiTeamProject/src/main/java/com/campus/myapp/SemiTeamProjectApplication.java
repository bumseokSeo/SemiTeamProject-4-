package com.campus.myapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;

@SpringBootApplication(exclude={MultipartAutoConfiguration.class})

public class SemiTeamProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SemiTeamProjectApplication.class, args);
	}

}
