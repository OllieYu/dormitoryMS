package com.ollie;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ollie.mapper")
public class DormitorymsSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(DormitorymsSpringbootApplication.class, args);
    }

}
