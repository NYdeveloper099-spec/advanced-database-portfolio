-- Portfolio 2: Query Processing and Optimisation
-- Case Study: University Student Result Management System
-- Environment: PostgreSQL 18 / browser-based Postgres Playground

-- =========================================================
-- 1. Retrieve a student by student number
-- =========================================================

SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE student_number = 'STU001';


-- =========================================================
-- 2. Retrieve students in a particular department
-- =========================================================

SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE department_id = 1;


-- =========================================================
-- 3. Retrieve student results with course information
-- =========================================================

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
ORDER BY
    s.student_number,
    c.course_code;


-- =========================================================
-- 4. Count records in the main database tables
-- =========================================================

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


-- =========================================================
-- 5. Examine the student-number lookup BEFORE indexing
-- Run this section before creating the indexes if you need
-- a fresh baseline for comparison.
-- =========================================================

EXPLAIN ANALYZE
SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE student_number = 'STU001';


-- =========================================================
-- 6. Examine the department filter BEFORE indexing
-- =========================================================

EXPLAIN ANALYZE
SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE department_id = 1;


-- =========================================================
-- 7. Create an index for student-number lookups
-- =========================================================

CREATE INDEX IF NOT EXISTS idx_students_student_number
ON students(student_number);


-- =========================================================
-- 8. Create an index for department filtering
-- =========================================================

CREATE INDEX IF NOT EXISTS idx_students_department
ON students(department_id);


-- =========================================================
-- 9. Examine the student-number lookup AFTER indexing
-- =========================================================

EXPLAIN ANALYZE
SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE student_number = 'STU001';


-- =========================================================
-- 10. Examine the department filter AFTER indexing
-- =========================================================

EXPLAIN ANALYZE
SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE department_id = 1;


-- End of Portfolio 2 SQL script
