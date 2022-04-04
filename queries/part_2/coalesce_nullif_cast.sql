-- COALESCE, NULLIF, CAST
-- selecting value str as integer64
SELECT CAST('5' AS INTEGER);

-- unable to change the type
SELECT CAST('five' AS INTEGER);

-- change the type and return the length of values
SELECT CHAR_LENGTH(CAST(user_id AS VARCHAR)) FROM account_job;

-- NULLIF example
-- creating a new table
CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);

-- inserting values into the table
INSERT INTO depts(
	first_name,
	department
)
VALUES (
	'Vinton',
	'A'
),
('Lauren', 'A'),
('Claire', 'B');

SELECT * FROM depts;

-- counting the departments ratio
SELECT (
	SUM(
		CASE WHEN department = 'A' THEN 1
		ELSE 0
	   	END
	) / NULLIF(
	SUM(
		CASE WHEN department = 'B' THEN 1
		ELSE 0
		END
	), 0)
	) AS department_ratio
FROM depts;

