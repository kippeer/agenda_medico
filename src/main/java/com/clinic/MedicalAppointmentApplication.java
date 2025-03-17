package com.clinic;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@SpringBootApplication
@OpenAPIDefinition(
    info = @Info(
        title = "Medical Appointment API",
        version = "1.0",
        description = "API for managing medical appointments"
    )
)
public class MedicalAppointmentApplication {
    public static void main(String[] args) {
        SpringApplication.run(MedicalAppointmentApplication.class, args);
    }
}