-- how can you retrieve all the information from cd.facatilities table
SELECT *
FROM cd.facilities;

-- how would you retrieve a list of only facility names and costs
SELECT
	name,
	membercost
FROM cd.facilities;

-- how can you produce a list of facilities that charge a fee to members?
SELECT *
FROM cd.facilities
WHERE membercost > 0
LIMIT 5;

-- how can you produce a list of facilites that charge a fee to members
-- and the fee is less than 1/50th of monthly maintenance cost?
SELECT
	facid,
	name,
	membercost,
	monthlymaintenance
FROM cd.facilities
WHERE membercost < monthlymaintenance / 50 AND membercost != 0
LIMIT 2;

-- produce a list of all facilites with the word 'tennis' in their name
SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- retrieve the details of facilities with ID 1 and 5
SELECT *
FROM cd.facilities
WHERE facid IN (1, 5);

-- can you produce a list of members who joined after the start of September 2012?
SELECT 
	memid,
	surname,
	firstname,
	joindate
FROM cd.members
WHERE EXTRACT(MONTH FROM joindate) > 8;

-- how can you produce an ordered list of the first 10 surnames in the members table?
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- how can you get the signup date of your last member
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

-- produce a count of the number of facilities that have a cost to guest of 10 or more
SELECT COUNT(name)
FROM cd.facilities
WHERE guestcost >= 10;

-- produce a list of the total numbers of slots booked per facility in the month
-- of September 2012
SELECT
	facid,
	SUM(slots) as total_number
FROM cd.bookings
WHERE EXTRACT(MONTH FROM starttime) = 9
GROUP BY facid
ORDER BY total_number ASC;

-- produce a list of facilites with more than 1000 slots booked
SELECT
	facid,
	SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid ASC;

-- how can you produce a list of the start times for booking for tennis
-- courts, for the date '2012-09-21'?
SELECT
	TO_CHAR(starttime, 'yyyy-mm-dd')
FROM cd.bookings
WHERE TO_CHAR(starttime, 'yyyy-mm-dd') = '2012-09-21'
LIMIT 10;

SELECT
	starttime,
	name
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.bookings.facid = cd.facilities.facid
WHERE CAST(starttime AS date) = '2012-09-21'
AND name LIKE '%Tennis Court%'
ORDER BY starttime ASC;

-- how can you produce a list of the start times for bookings by members
-- named 'David Farrell'
SELECT
	firstname,
	surname,
	starttime
FROM cd.members
INNER JOIN cd.bookings
ON cd.members.memid = cd.bookings.memid
WHERE firstname = 'David'
AND surname = 'Farrell'
ORDER BY starttime ASC;
