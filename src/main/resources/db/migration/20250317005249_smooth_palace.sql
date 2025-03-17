/*
  # Add Automatic Timestamp Updates

  1. New Functions and Triggers
    - Create update_timestamp function
    - Add triggers for all tables to automatically update updated_at timestamp
*/

-- Create function to update timestamp
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for doctors
CREATE TRIGGER update_doctors_timestamp
    BEFORE UPDATE ON doctors
    FOR EACH ROW
    EXECUTE FUNCTION update_timestamp();

-- Create triggers for patients
CREATE TRIGGER update_patients_timestamp
    BEFORE UPDATE ON patients
    FOR EACH ROW
    EXECUTE FUNCTION update_timestamp();

-- Create triggers for appointments
CREATE TRIGGER update_appointments_timestamp
    BEFORE UPDATE ON appointments
    FOR EACH ROW
    EXECUTE FUNCTION update_timestamp();