CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(50) UNIQUE NOT NULL,
	user_password VARCHAR(50) NOT NULL,
	user_email VARCHAR(250) UNIQUE NOT NULL,
	created_at TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);

SELECT * FROM account;

INSERT INTO account(user_name, user_password, user_email, created_at) 
VALUES
-- ('jose', 'password', 'jose@mail.com', CURRENT_TIMESTAMP);
('portilla', 'anotherpassword', 'portilla@mail.com', CURRENT_TIMESTAMP);

SELECT * FROM job;
INSERT INTO job(job_name)
VALUES
('lawyer');

SELECT * FROM account_job;
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(9,18,CURRENT_TIMESTAMP);

UPDATE account
SET last_login = CURRENT_TIMESTAMP
WHERE user_id = 2;

UPDATE account_job
SET hire_date = account.created_at
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING created_at, user_email, last_login;

SELECT * FROM job;

INSERT INTO job(job_name)
VALUES
('watchman')
RETURNING job_id, job_name;

DELETE FROM job
WHERE job_name = 'lawyer'
RETURNING job_id, job_name;

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information;

ALTER TABLE information
RENAME TO in_formation;

SELECT * FROM in_formation;

ALTER TABLE in_formation
RENAME TO information;

ALTER TABLE information
RENAME COLUMN person TO people;

ALTER TABLE information
ALTER COLUMN people DROP NOT NULL;

INSERT INTO information(title)
VALUES
('some new title');


SELECT * FROM information;

ALTER TABLE information
DROP COLUMN IF EXISTS people;


CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
);

INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
('Sammy','Smith','1990-12-04','2010-01-01',20000);
-- ('Jose','Portilla','1990-11-03','2010-01-01',100);

SELECT * FROM employees;


-- Assessment - 3

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	homeroom_number INTEGER,
	department VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(50) UNIQUE,
	phone VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	homeroom_number INTEGER,
	phone VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(50) UNIQUE,
	graduation_year VARCHAR(4)
);

SELECT * from teachers;
SELECT * from students;

INSERT INTO students(first_name, last_name,homeroom_number, phone, graduation_year )
VALUES
('Mark', 'Watney','5', '7777-555-1234', '2035');

INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone )
VALUES
('Jonas', 'Salk', 5,'Biology', 'jsalk@school.org', '777-555-4312');