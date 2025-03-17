/*
  # Add Data Validation Constraints

  1. New Constraints
    - Appointments
      - Check constraint for valid status values
      - Check constraint for future appointments
    - Doctors
      - Check constraint for valid email format
      - Check constraint for CRM format
    - Patients
      - Check constraint for valid email format
      - Check constraint for CPF format
      - Check constraint for valid phone format
*/

-- Add constraints for appointments
ALTER TABLE appointments
    ADD CONSTRAINT check_valid_status 
    CHECK (status IN ('SCHEDULED', 'COMPLETED', 'CANCELLED', 'NO_SHOW'));

ALTER TABLE appointments
    ADD CONSTRAINT check_future_appointment 
    CHECK (appointment_date_time > created_at);

-- Add constraints for doctors
ALTER TABLE doctors
    ADD CONSTRAINT check_doctor_email 
    CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

ALTER TABLE doctors
    ADD CONSTRAINT check_crm_format 
    CHECK (crm ~ '^\d{5,6}$');

-- Add constraints for patients
ALTER TABLE patients
    ADD CONSTRAINT check_patient_email 
    CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

ALTER TABLE patients
    ADD CONSTRAINT check_cpf_format 
    CHECK (cpf ~ '^\d{3}\.\d{3}\.\d{3}-\d{2}$');

ALTER TABLE patients
    ADD CONSTRAINT check_phone_format 
    CHECK (phone ~ '^\(\d{2}\)\s\d{4,5}-\d{4}$');