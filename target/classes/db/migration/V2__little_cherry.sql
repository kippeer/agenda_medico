/*
  # Add Indexes for Performance

  1. New Indexes
    - Appointments
      - Index on appointment_date_time for faster date-based queries
      - Index on status for status-based filtering
      - Combined index on doctor_id and appointment_date_time for doctor schedule queries
    - Doctors
      - Index on specialization for filtering doctors by specialty
    - Patients
      - Index on email and cpf for faster lookups
*/

-- Add indexes for appointments
CREATE INDEX idx_appointments_date_time 
    ON appointments(appointment_date_time);

CREATE INDEX idx_appointments_status 
    ON appointments(status);

CREATE INDEX idx_doctor_schedule 
    ON appointments(doctor_id, appointment_date_time);

-- Add indexes for doctors
CREATE INDEX idx_doctors_specialization 
    ON doctors(specialization);

-- Add indexes for patients
CREATE INDEX idx_patients_email 
    ON patients(email);

CREATE INDEX idx_patients_cpf 
    ON patients(cpf);