-- create a new database 'school' with the tables 'teachers' and 'students'
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT,
	phone VARCHAR(100) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	graduated_on DATE
);

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number SMALLINT,
	department VARCHAR(100) NOT NULL,
	phone VARCHAR(100) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE
);

-- insert student name Mark Watney
ALTER TABLE students
ALTER COLUMN email
DROP NOT NULL;

INSERT INTO students(
	first_name,
	last_name,
	homeroom_number,
	phone,
	graduated_on
)
VALUES (
	'Mark',
	'Watney',
	5,
	'777-555-1234',
	'2035-01-01'
);

SELECT * FROM students;

-- insert a teacher names Jonas Salk
INSERT INTO teachers(
	first_name,
	last_name,
	homeroom_number,
	department,
	phone,
	email
)
VALUES (
	'Jonas',
	'Salk',
	5,
	'biology department',
	'777-555-4321',
	'jsalk@school.org'
);

SELECT * FROM teachers;