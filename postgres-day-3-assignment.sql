-- Assessment - 2
SELECT *
FROM cd.facilities;
SELECT name,
  membercost
FROM cd.facilities;
SELECT *
FROM cd.facilities
WHERE membercost > 0;
SELECT facid,
  name,
  membercost,
  monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
  AND membercost < (monthlymaintenance / 50);
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';
SELECT *
FROM cd.facilities
WHERE facid IN (1, 5);
SELECT memid,
  surname,
  firstname,
  joindate
FROM cd.members
WHERE joindate >= '2012-09-01';
SELECT *
FROM cd.members
WHERE TO_CHAR(joindate, 'Month YYYY') >= 'September 2012';
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname
LIMIT 10;
SELECT *
FROM cd.members;
SELECT MAX(joindate) AS latest_signup
FROM cd.members;
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost > 10;
SELECT *
FROM cd.facilities;
SELECT *
FROM cd.members;
SELECT *
FROM cd.bookings;
SELECT facid,
  SUM(slots) AS 'Total Slots'
FROM cd.bookings
WHERE TO_CHAR(starttime, 'Month YYYY') = 'September 2012'
GROUP BY facid
ORDER BY SUM(slots);
SELECT facid,
  SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;
SELECT starttime AS start,
  name
FROM cd.bookings
  INNER JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
  AND TO_CHAR(starttime, 'YYYY-MM-DD') = '2012-09-21'
WHERE name LIKE 'Tennis%'
ORDER BY starttime;
SELECT COUNT(*)
FROM cd.bookings
  INNER JOIN cd.members ON cd.bookings.memid = cd.members.memid
WHERE firstname || ' ' || surname LIKE 'David Farrell';