
SELECT u.full_name,
       e.title,
       e.city,
       e.start_date
FROM Users u
JOIN Registrations r
ON u.user_id = r.user_id
JOIN Events e
ON r.event_id = e.event_id
WHERE e.status='upcoming'
AND u.city=e.city
ORDER BY e.start_date;

SELECT e.title,
       AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f
ON e.event_id=f.event_id
GROUP BY e.event_id
HAVING COUNT(*)>=1
ORDER BY avg_rating DESC;

SELECT *
FROM Users
WHERE user_id NOT IN
(
SELECT DISTINCT user_id
FROM Registrations
WHERE registration_date >= CURDATE()-INTERVAL 90 DAY
);

SELECT e.title,
       COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s
ON e.event_id = s.event_id
WHERE TIME(s.start_time)
BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id;

SELECT u.city,
       COUNT(DISTINCT r.registration_id)
       AS total_registrations
FROM Users u
JOIN Registrations r
ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY total_registrations DESC
LIMIT 5;

SELECT e.title,
       COUNT(r.resource_id)
       AS total_resources
FROM Events e
LEFT JOIN Resources r
ON e.event_id = r.event_id
GROUP BY e.event_id;

SELECT u.full_name,
       e.title,
       f.rating,
       f.comments
FROM Feedback f
JOIN Users u
ON f.user_id = u.user_id
JOIN Events e
ON f.event_id = e.event_id
WHERE f.rating < 3;

SELECT e.title,
       COUNT(s.session_id)
       AS session_count
FROM Events e
LEFT JOIN Sessions s
ON e.event_id = s.event_id
WHERE e.status='upcoming'
GROUP BY e.event_id;

SELECT u.full_name,
       e.status,
       COUNT(e.event_id)
       AS total_events
FROM Users u
JOIN Events e
ON u.user_id=e.organizer_id
GROUP BY u.full_name,e.status;

SELECT e.title
FROM Events e
JOIN Registrations r
ON e.event_id=r.event_id
LEFT JOIN Feedback f
ON e.event_id=f.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id;

SELECT registration_date,
       COUNT(*) AS new_users
FROM Users
GROUP BY registration_date
ORDER BY registration_date;

SELECT e.title,
       COUNT(s.session_id) AS total_sessions
FROM Events e
JOIN Sessions s
ON e.event_id=s.event_id
GROUP BY e.event_id
ORDER BY total_sessions DESC
LIMIT 1;

SELECT e.city,
       AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f
ON e.event_id=f.event_id
GROUP BY e.city;

SELECT e.title,
       COUNT(r.registration_id)
       AS total_registrations
FROM Events e
JOIN Registrations r
ON e.event_id=r.event_id
GROUP BY e.event_id
ORDER BY total_registrations DESC
LIMIT 3;

SELECT s1.event_id,
       s1.title AS session1,
       s2.title AS session2
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id=s2.event_id
AND s1.session_id < s2.session_id
AND s1.end_time > s2.start_time;

SELECT *
FROM Users
WHERE registration_date >=
CURDATE()-INTERVAL 30 DAY
AND user_id NOT IN
(
SELECT user_id
FROM Registrations
);

SELECT speaker_name,
       COUNT(*) AS total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

SELECT e.title
FROM Events e
LEFT JOIN Resources r
ON e.event_id=r.event_id
WHERE r.resource_id IS NULL;

SELECT e.title,
       COUNT(r.registration_id) AS total_registrations
FROM Events e
JOIN Registrations r
ON e.event_id = r.event_id
GROUP BY e.event_id
HAVING COUNT(r.registration_id) >
(
    SELECT AVG(reg_count)
    FROM
    (
        SELECT COUNT(*) AS reg_count
        FROM Registrations
        GROUP BY event_id
    ) AS temp
);

SELECT e.title,
       MAX(r.uploaded_at) AS latest_upload
FROM Events e
JOIN Resources r
ON e.event_id = r.event_id
GROUP BY e.event_id;

SELECT u.full_name,
       COUNT(r.event_id) AS total_events
FROM Users u
JOIN Registrations r
ON u.user_id = r.user_id
GROUP BY u.user_id
HAVING COUNT(r.event_id) > 1;

SELECT title,
       TIMESTAMPDIFF(HOUR,
                     start_date,
                     end_date) AS duration_hours
FROM Events;

SELECT e.title,
       AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f
ON e.event_id = f.event_id
GROUP BY e.event_id
ORDER BY avg_rating DESC
LIMIT 1;

SELECT registration_date,
       COUNT(*) AS total_registrations
FROM Registrations
GROUP BY registration_date
ORDER BY registration_date;

SELECT
e.title,
e.city,
e.status,
COUNT(DISTINCT r.registration_id)
AS total_registrations,
COUNT(DISTINCT s.session_id)
AS total_sessions,
COUNT(DISTINCT res.resource_id)
AS total_resources,
ROUND(AVG(f.rating),2)
AS average_rating
FROM Events e
LEFT JOIN Registrations r
ON e.event_id=r.event_id
LEFT JOIN Sessions s
ON e.event_id=s.event_id
LEFT JOIN Resources res
ON e.event_id=res.event_id
LEFT JOIN Feedback f
ON e.event_id=f.event_id
GROUP BY e.event_id;