-- create three different tables
CREATE TABLE reader(
 	reader_id SERIAL PRIMARY KEY,
 	surname VARCHAR(100),
 	name VARCHAR(100),
 	phone VARCHAR(9),
 	address VARCHAR(200),
 	age INTEGER,
 	email VARCHAR(50)
);

CREATE TABLE book(
 book_id SERIAL PRIMARY KEY,
 isbn13 VARCHAR(17),
 name VARCHAR(200),
 author VARCHAR(200)
);

CREATE TABLE borrowed_books(
	reader_id SERIAL REFERENCES reader(reader_id),
	book_id SERIAL REFERENCES book(book_id),
	date_from DATE NOT NULL,
	date_to DATE
);

-- enter values
-- reader
INSERT INTO reader (reader_id, surname, name, phone, address, age, email) VALUES (1, 'Laušman', 'Jakub', '724348286', 'Kohoutových 696/8, P-5',37,'jakub.lausman@seznam.cz');
INSERT INTO reader (reader_id, surname, name, phone, address, age, email) VALUES (2, 'Polcarová', 'Michaela', '603598652', 'Neustupného 1835, P-13',25,'michaela.polcarova@gmail.com');
INSERT INTO reader (reader_id, surname, name, phone, address, age, email) VALUES (3, 'Barták', 'Jaromír', '703524687', 'Anežky Krásnohorské, Praha',50,'jaromir.bartak@base.cz');
INSERT INTO reader (reader_id, surname, name, phone, address, age, email) VALUES (4, 'Barták', 'Jan', '609854325', 'Velká Ohrada 5, Praha',40,'jbartak@atlas.cz');
INSERT INTO reader (reader_id, surname, name, phone, address, age, email) VALUES (5, 'Žišková', 'Martina', '603589621', 'Háje 5, Praha',18,'martina.ziskova@base.cz');

SELECT * FROM reader;

-- book
INSERT INTO book (book_id, isbn13, name, author) VALUES (1, '978-80-7661-137-5', 'Deník malého poseroutky 15 - Samá voda', 'Jeff Kinney');
INSERT INTO book (book_id, isbn13, name, author) VALUES (2, '978-80-7661-137-5', 'Deník malého poseroutky 15 - Samá voda', 'Jeff Kinney');
INSERT INTO book (book_id, isbn13, name, author) VALUES (3, '978-80-7661-137-5', 'Deník malého poseroutky 15 - Samá voda', 'Jeff Kinney');
INSERT INTO book (book_id, isbn13, name, author) VALUES (4, '978-80-247-4484-1', 'Komunikace a prezentace - Umění mluvit, slyšet a rozumět – 2. vydání', 'Jiří Plamínek');
INSERT INTO book (book_id, isbn13, name, author) VALUES (5, '978-80-7662-068-1', 'Království', 'Jo Nesbo');
INSERT INTO book (book_id, isbn13, name, author) VALUES (6, '978-80-7662-068-1', 'Království', 'Jo Nesbo');
INSERT INTO book (book_id, isbn13, name, author) VALUES (7, '978-80-247-4431-5', 'Time management - Mějte svůj čas pod kontrolou', 'Kolektiv autorů');
INSERT INTO book (book_id, isbn13, name, author) VALUES (8, '978-80-247-5620-2', 'Projektový management', 'Jan Doležal');
INSERT INTO book (book_id, isbn13, name, author) VALUES (9, '978-80-247-5620-2', 'Projektový management', 'Jan Doležal');
INSERT INTO book (book_id, isbn13, name, author) VALUES (10, '978-80-7390-235-3', 'Kytice', 'Karel Jaromír Erben');
INSERT INTO book (book_id, isbn13, name, author) VALUES (11, '978-80-7390-235-3', 'Kytice', 'Karel Jaromír Erben');
INSERT INTO book (book_id, isbn13, name, author) VALUES (12, '978-80-7390-235-3', 'Kytice', 'Karel Jaromír Erben');
INSERT INTO book (book_id, isbn13, name, author) VALUES (13, '978-80-7390-235-3', 'Kytice', 'Karel Jaromír Erben');
INSERT INTO book (book_id, isbn13, name, author) VALUES (14, '978-80-7390-235-3', 'Kytice', 'Karel Jaromír Erben');

SELECT * FROM book;

-- borrowed_books
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (1, 5, cast( '2020-06-01' as DATE), NULL);
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (1, 1, cast( '2019-05-12' as DATE), cast('2019-06-02' as DATE));
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (4, 6, cast( '2020-11-28' as DATE), NULL);
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (3, 12, cast( '2020-07-02' as DATE), cast('2020-10-12' as DATE));
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (3, 6, cast( '2019-01-02' as DATE), cast('2019-02-25' as DATE));
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (3, 10, cast( '2020-11-30' as DATE), NULL);
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (1, 9, cast( '2019-05-15' as DATE), cast('2019-05-30' as DATE));
INSERT INTO borrowed_books (reader_id, book_id, date_from, date_to) VALUES (2, 8, cast( '2019-05-15' as DATE), cast('2019-05-30' as DATE));

SELECT * FROM borrowed_books;

CREATE VIEW lib_calendar AS
SELECT CAST('2020-12-01' AS DATE) AS actual_date;

-- total sum of books
SELECT COUNT(book_id)
FROM book
LIMIT 1;

-- average age of customers
SELECT AVG(age)
FROM reader;

-- youngest customer
SELECT MIN(age)
FROM reader;

-- oldest customer
SELECT MAX(age)
FROM reader;

-- return the list of isbns and titles
SELECT
	isbn13,
	name,
	COUNT(name) AS pocet
FROM book
GROUP BY name, isbn13
ORDER BY name ASC;

-- select all customers with at least single borrowed book
SELECT
	surname,
	reader.name,
	book.name,
	(date_to - date_from) AS pocet_dni
FROM reader
INNER JOIN borrowed_books
ON reader.reader_id = borrowed_books.reader_id
INNER JOIN book
ON book.book_id = borrowed_books.book_id
WHERE date_to IS NOT NULL;

-- jmeno a prijmeni ctenare + delka vypujcky ve dnech
SELECT
	surname,
	name,
	(COALESCE(date_to, (SELECT actual_date FROM lib_calendar)) - date_from) AS diff
FROM borrowed_books
INNER JOIN reader
ON reader.reader_id = borrowed_books.reader_id
WHERE (COALESCE(date_to, (SELECT actual_date FROM lib_calendar)) - date_from) >= 60;

-- dostupne knihy na prodejne
SELECT
	isbn13,
	name,
	COUNT(isbn13) AS celkem
FROM borrowed_books
FULL OUTER JOIN book
ON borrowed_books.book_id = book.book_id
GROUP BY isbn13, name;

SELECT
	isbn13,
	name,
	COUNT(isbn13) AS celkem,
	(
		CASE
		WHEN date_to IS NULL AND reader_id IS NOT NULL THEN 1 ELSE 0 END
	) AS vypujcene,
	(
		CASE
		WHEN (COUNT(isbn13) - (
			CASE
			WHEN date_to IS NULL AND reader_id IS NOT NULL THEN 1 ELSE 0 END
		)) = 0 THEN 'ani jeden kus neni k dispozici'
		ELSE 'zapujcka mozna'
		END
	) AS stav
FROM borrowed_books
FULL OUTER JOIN book
ON borrowed_books.book_id = book.book_id
GROUP BY isbn13, name, date_to, reader_id;

SELECT
	*
FROM book
RIGHT OUTER JOIN borrowed_books
ON book.book_id = borrowed_books.book_id;

-- nikdy nepujcene knihy
SELECT
	book.book_id,
	book.name
FROM book
LEFT OUTER JOIN borrowed_books
ON book.book_id = borrowed_books.book_id
WHERE borrowed_books.reader_id IS NULL
ORDER BY book.book_id ASC;

-- zakaznik, co vypujcil nejvice knihy v roce 2019
SELECT
	reader_id
FROM borrowed_books
WHERE TO_CHAR(date_from, 'YYYY') = '2019'
GROUP BY reader_id
ORDER BY COUNT(reader_id) DESC
LIMIT 1;

-- zakaznici, co si nikdy nic nevypujcili
SELECT surname, name
FROM reader
LEFT OUTER JOIN borrowed_books
ON reader.reader_id = borrowed_books.reader_id
WHERE borrowed_books.reader_id IS NULL;

-- kolik bylo pujceno a kolik vraceno
SELECT
	SUM(
		CASE
		WHEN date_from IS NOT NULL THEN 1 END
	) AS pujcene,
	SUM(
		CASE
		WHEN date_to IS NOT NULL THEN 1 END
	) AS vracene
FROM borrowed_books;

-- kolik titulu bylo pujceno
SELECT 
	COUNT(DISTINCT(name)) AS pujcene_tituly
FROM borrowed_books
INNER JOIN book
ON borrowed_books.book_id = book.book_id;

-- pridej sloupec, jestli kniha byla nebo nebyla vracena
SELECT
	*,
	(
		CASE
			WHEN date_to IS NULL THEN 'N'
			ELSE 'Y'
		END
	) AS je_vracena
FROM borrowed_books;

-- zjisti, od ktereho titulu mam prave 3 kusy
SELECT name, COUNT(name) AS pocet
FROM book
GROUP BY name
HAVING COUNT(name) = 3;

-- zjisti, ktere tituly byly pujcene vice nez dvakrat
SELECT
	name,
	COUNT(name) AS pocet
FROM borrowed_books
INNER JOIN book
ON borrowed_books.book_id = book.book_id
GROUP BY name
HAVING COUNT(name) > 2;

-- zjisti tituly pujcene od 1.1.2020-31.12.2020
SELECT
	DISTINCT(name),
	TO_CHAR(date_from, 'YYYY') AS date_from_year,
	TO_CHAR(COALESCE(date_to, (SELECT actual_date FROM lib_calendar)), 'YYYY') AS date_to_year,
	(
		CASE
			WHEN TO_CHAR(date_from, 'YYYY') = '2020'
			AND TO_CHAR(COALESCE(date_to, (SELECT actual_date FROM lib_calendar)), 'YYYY') = '2020'
			THEN 1
			ELSE 0
		END
	) AS pocet
FROM borrowed_books
INNER JOIN book
ON borrowed_books.book_id = book.book_id
GROUP BY name, borrowed_books.date_from, borrowed_books.date_to;
