# Medical Appointment System

A Spring Boot application for managing medical appointments, doctors, and patients.

## Features

- Patient Management (CRUD operations)
- Doctor Management (CRUD operations)
- Appointment Scheduling
- Availability Checking
- Appointment Status Updates
- Patient Appointment History

## Technologies

- Java 17
- Spring Boot 2.7.0
- Spring Data JPA
- Spring Security
- PostgreSQL
- Lombok
- Swagger/OpenAPI

## Prerequisites

- Java 17 or higher
- PostgreSQL
- Maven

## Database Configuration

The application uses PostgreSQL. Update the database configuration in `application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/agendamento
spring.datasource.username=postgres
spring.datasource.password=adm
```

## Running the Application

1. Clone the repository
2. Create the PostgreSQL database:
   ```sql
   CREATE DATABASE agendamento;
   ```
3. Build the project:
   ```bash
   mvn clean install
   ```
4. Run the application:
   ```bash
   mvn spring-boot:run
   ```

The application will start on `http://localhost:8080`

## API Documentation

Swagger UI is available at: `http://localhost:8080/swagger-ui.html`

### API Endpoints

#### Patients
- `POST /api/patients` - Create a new patient
- `GET /api/patients` - Get all patients
- `GET /api/patients/{id}` - Get patient by ID
- `PUT /api/patients/{id}` - Update patient
- `DELETE /api/patients/{id}` - Delete patient

#### Doctors
- `POST /api/doctors` - Create a new doctor
- `GET /api/doctors` - Get all doctors
- `GET /api/doctors/{id}` - Get doctor by ID
- `PUT /api/doctors/{id}` - Update doctor
- `DELETE /api/doctors/{id}` - Delete doctor

#### Appointments
- `POST /api/appointments` - Schedule new appointment
- `GET /api/appointments/{id}` - Get appointment by ID
- `GET /api/appointments/doctor/{doctorId}` - Get doctor's appointments
- `GET /api/appointments/patient/{patientId}` - Get patient's appointments
- `PUT /api/appointments/{id}/status` - Update appointment status

## Data Models

### Patient
```json
{
  "id": "long",
  "name": "string",
  "email": "string",
  "phone": "string",
  "dateOfBirth": "date",
  "cpf": "string"
}
```

### Doctor
```json
{
  "id": "long",
  "name": "string",
  "email": "string",
  "crm": "string",
  "specialization": "string"
}
```

### Appointment
```json
{
  "id": "long",
  "patient": "Patient",
  "doctor": "Doctor",
  "appointmentDateTime": "datetime",
  "status": "string",
  "notes": "string"
}
```

## Security

The application uses Spring Security with basic configuration. All endpoints except `/api/auth/**` and Swagger UI endpoints require authentication.

## Error Handling

The application includes global exception handling for:
- Resource not found exceptions
- Validation errors
- General application errors

## Future Improvements

1. Add email notifications for appointments
2. Implement more sophisticated scheduling rules
3. Add support for recurring appointments
4. Implement doctor working hours
5. Add appointment reminders
6. Implement patient medical history
7. Add support for online consultations