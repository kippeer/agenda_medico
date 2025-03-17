package com.clinic.service;

import com.clinic.model.Appointment;
import com.clinic.model.Doctor;
import com.clinic.model.Patient;
import com.clinic.repository.AppointmentRepository;
import com.clinic.repository.DoctorRepository;
import com.clinic.repository.PatientRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class AppointmentService {
    private final AppointmentRepository appointmentRepository;
    private final DoctorRepository doctorRepository;
    private final PatientRepository patientRepository;
    
    public AppointmentService(
        AppointmentRepository appointmentRepository,
        DoctorRepository doctorRepository,
        PatientRepository patientRepository
    ) {
        this.appointmentRepository = appointmentRepository;
        this.doctorRepository = doctorRepository;
        this.patientRepository = patientRepository;
    }
    
    public Appointment scheduleAppointment(Long doctorId, Long patientId, LocalDateTime dateTime) {
        Doctor doctor = doctorRepository.findById(doctorId)
            .orElseThrow(() -> new RuntimeException("Doctor not found"));
            
        Patient patient = patientRepository.findById(patientId)
            .orElseThrow(() -> new RuntimeException("Patient not found"));
            
        validateDoctorAvailability(doctor, dateTime);
        
        Appointment appointment = new Appointment();
        appointment.setDoctor(doctor);
        appointment.setPatient(patient);
        appointment.setAppointmentDateTime(dateTime);
        appointment.setStatus("SCHEDULED");
        
        return appointmentRepository.save(appointment);
    }
    
    public Appointment getAppointment(Long id) {
        return appointmentRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Appointment not found"));
    }
    
    public List<Appointment> getDoctorAppointments(Long doctorId, LocalDateTime start, LocalDateTime end) {
        Doctor doctor = doctorRepository.findById(doctorId)
            .orElseThrow(() -> new RuntimeException("Doctor not found"));
        return appointmentRepository.findByDoctorAndAppointmentDateTimeBetween(doctor, start, end);
    }
    
    public List<Appointment> getPatientAppointments(Long patientId) {
        Patient patient = patientRepository.findById(patientId)
            .orElseThrow(() -> new RuntimeException("Patient not found"));
        return appointmentRepository.findByPatientAndAppointmentDateTimeAfter(patient, LocalDateTime.now());
    }
    
    public Appointment updateAppointmentStatus(Long id, String status) {
        Appointment appointment = getAppointment(id);
        appointment.setStatus(status);
        return appointmentRepository.save(appointment);
    }
    
    private void validateDoctorAvailability(Doctor doctor, LocalDateTime dateTime) {
        LocalDateTime startTime = dateTime.minusMinutes(30);
        LocalDateTime endTime = dateTime.plusMinutes(30);
        
        List<Appointment> conflictingAppointments = 
            appointmentRepository.findByDoctorAndAppointmentDateTimeBetween(doctor, startTime, endTime);
            
        if (!conflictingAppointments.isEmpty()) {
            throw new RuntimeException("Doctor is not available at this time");
        }
    }
}