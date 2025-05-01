-- TODO 1
SELECT c.course_ID, c.course_name, o.offering_no, o.classroom, o.no_of_stds 
FROM course c, prof_teach pt, offering o
WHERE c.course_ID = pt.course_ID 
AND pt.course_ID = o.course_ID 
AND pt.offering_no = o.offering_no 
AND pt.staff_id = 3;

-- TODO 2           
SELECT ta.student_ID, ta.first_name, ta.last_name, ta.phone
FROM pref_TA pt, TA ta, prof p
WHERE pt.student_ID = ta.student_ID 
AND pt.staff_ID = p.staff_ID
AND p.staff_ID = 3;

-- TODO 3
SELECT main_course_ID, LISTAGG(prereq_course_ID, ',')
FROM prerequisite
GROUP BY main_course_ID
ORDER BY main_course_ID;

-- TODO 4
SELECT ta.student_ID, CONCAT(CONCAT(ta.first_name, ','), ta.last_name) AS FULLNAME
FROM supervise s, TA ta 
WHERE s.student_ID = ta.student_ID
AND s.staff_ID = 3;

-- TODO 5
SELECT p.staff_ID, CONCAT(CONCAT(p.first_name, ' '), p.last_name) AS STAFF_FULL_NAME,
    LISTAGG(ta.student_ID || ':' || ta.first_name || ' ' || ta.last_name, ',') AS STUDENTS
FROM prof p, supervise s, TA ta 
WHERE p.staff_id = s.staff_id
AND s.student_ID = ta.student_ID
GROUP BY p.staff_ID, p.first_name, p.last_name;

-- TODO 6
INSERT INTO prof_phone (staff_ID, phone_number)
VALUES (3, 11111111); 