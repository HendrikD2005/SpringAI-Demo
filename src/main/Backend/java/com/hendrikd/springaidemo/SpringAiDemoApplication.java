package com.hendrikd.springaidemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringAiDemoApplication {

    public static void main(String[] args) {
        System.out.println("Starting Backend ...");
        SpringApplication.run(SpringAiDemoApplication.class, args);
        System.out.println("Backend started!");

    }

}
