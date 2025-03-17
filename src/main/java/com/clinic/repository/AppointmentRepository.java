package com.clinic.repository;

import com.clinic.model.Appointment;
import com.clinic.model.Doctor;
import com.clinic.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    List<Appointment> findByDoctorAndAppointmentDateTimeBetween(
        Doctor doctor, 
        LocalDateTime start, 
        LocalDateTime end
    );
    
    List<Appointment> findByPatientAndAppointmentDateTimeAfter(
        Patient patient, 
        LocalDateTime date
    );
}