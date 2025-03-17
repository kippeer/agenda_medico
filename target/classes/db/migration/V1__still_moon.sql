/*
  # Initial Database Schema Setup

  1. New Tables
    - `doctors`
      - `id` (bigserial, primary key)
      - `name` (varchar)
      - `email` (varchar, unique)
      - `crm` (varchar, unique)
      - `specialization` (varchar)
    - `patients`
      - `id` (bigserial, primary key)
      - `name` (varchar)
      - `email` (varchar, unique)
      - `phone` (varchar)
      - `date_of_birth` (date)
      - `cpf` (varchar, unique)
    - `appointments`
      - `id` (bigserial, primary key)
      - `patient_id` (bigint, foreign key)
      - `doctor_id` (bigint, foreign key)
      - `appointment_date_time` (timestamp)
      - `status` (varchar)
      - `notes` (text)
*/

-- Create doctors table
CREATE TABLE IF NOT EXISTS doctors (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    crm VARCHAR(50) NOT NULL UNIQUE,
    specialization VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create patients table
CREATE TABLE IF NOT EXISTS patients (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create appointments table
CREATE TABLE IF NOT EXISTS appointments (
    id BIGSERIAL PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    doctor_id BIGINT NOT NULL,
    appointment_date_time TIMESTAMP WITH TIME ZONE NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'SCHEDULED',
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients(id),
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);