-- Postgres syntax for ENUM
CREATE TYPE employment_status AS ENUM('employed', 'self-employed', 'unemployed');
CREATE TABLE users (
  full_name VARCHAR(25),
  yearly_salary INT,
  -- My SQL syntax for ENUM
  -- current_status ENUM('employed', 'self-employed', 'unemployed')
  current_status employment_status
);