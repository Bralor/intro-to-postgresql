-- creating new 'account' table
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	create_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

-- creating new 'job' table
CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

-- creating new intermediory table 'account_job'
CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP NOT NULL
)

-- inserting values into the table 'account'
INSERT INTO account(
	username,
	password,
	email,
	create_on
)
VALUES (
	'Jose',
	'password',
	'jose@gmail.com',
	CURRENT_TIMESTAMP
);

-- inserting values into the table 'job'
INSERT INTO job(
	job_name
)
VALUES (
	'Astronaut'
);

INSERT INTO job(
	job_name
)
VALUES (
	'President'
);

-- inserting values into the table 'account_job'
INSERT INTO account_job(
	user_id,
	job_id,
	hire_date
)
VALUES (
	1,
	1,
	CURRENT_TIMESTAMP
);

INSERT INTO account_job(
	user_id,
	job_id,
	hire_date
)
VALUES (
	10,
	10,
	CURRENT_TIMESTAMP
);

-- updating the values in the table 'account'
SELECT * FROM account;

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = create_on;

SELECT * FROM account_job;

UPDATE account_job
SET hire_date = account.create_on
FROM account
WHERE account_job.user_id = account.user_id;

SELECT * FROM account;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING
	email,
	create_on,
	last_login;
	
	
-- deleting values from the table 'job'
INSERT INTO job(
	job_name
)
VALUES (
	'Cowboy'
);

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name;

-- altering values
CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(500) NOT NULL UNIQUE
);

SELECT * FROM new_info;

-- change the name of the table
ALTER TABLE information
RENAME TO new_info;

-- change the name of the column
ALTER TABLE information
RENAME COLUMN person;

-- alter the constrain settings
ALTER TABLE new_info
ALTER COLUMN person
DROP NOT NULL;

INSERT INTO new_info(
	title
)
VALUES (
	'some new title'
);

-- droping the column
ALTER TABLE new_info
DROP COLUMN person;


