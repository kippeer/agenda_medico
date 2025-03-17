package com.clinic.service;

import com.clinic.model.Patient;
import com.clinic.repository.PatientRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class PatientService {
    private final PatientRepository patientRepository;
    
    public PatientService(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }
    
    public Patient createPatient(Patient patient) {
        return patientRepository.save(patient);
    }
    
    public Patient getPatient(Long id) {
        return patientRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Patient not found"));
    }
    
    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }
    
    public Patient updatePatient(Long id, Patient patientDetails) {
        Patient patient = getPatient(id);
        patient.setName(patientDetails.getName());
        patient.setEmail(patientDetails.getEmail());
        patient.setPhone(patientDetails.getPhone());
        patient.setDateOfBirth(patientDetails.getDateOfBirth());
        patient.setCpf(patientDetails.getCpf());
        return patientRepository.save(patient);
    }
    
    public void deletePatient(Long id) {
        patientRepository.deleteById(id);
    }
}