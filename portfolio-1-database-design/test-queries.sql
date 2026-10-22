
-- Portfolio 1: Database verification queries

-- Test 1: Verify the number of records in each table
SELECT 'departments' AS table_name, COUNT(*) AS total
FROM departments
UNION ALL
SELECT 'students', COUNT(*) FROM students
UNION ALL
SELECT 'lecturers', COUNT(*) FROM lecturers
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL
SELECT 'registrations', COUNT(*) FROM registrations
UNION ALL
SELECT 'results', COUNT(*) FROM results;

-- Test 2: Retrieve student course registrations and results
SELECT
    s.student_number,
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_title,
    r.score,
    r.grade
FROM students AS s
JOIN registrations AS reg
    ON s.student_id = reg.student_id
JOIN courses AS c
    ON reg.course_id = c.course_id
JOIN results AS r
    ON reg.registration_id = r.registration_id
ORDER BY s.student_number, c.course_code;
