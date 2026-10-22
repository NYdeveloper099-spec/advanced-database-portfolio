
-- Portfolio 1: University Student Result Management System
-- Database: PostgreSQL

CREATE TABLE departments (
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_number VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    CONSTRAINT fk_student_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE lecturers (
    lecturer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lecturer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_title VARCHAR(100) NOT NULL,
    credit_units INTEGER NOT NULL
        CHECK (credit_units BETWEEN 1 AND 6),
    department_id INTEGER NOT NULL,
    lecturer_id INTEGER,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    FOREIGN KEY (lecturer_id)
        REFERENCES lecturers(lecturer_id)
);

CREATE TABLE registrations (
    registration_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    semester VARCHAR(20) NOT NULL,
    academic_year VARCHAR(9) NOT NULL,
    UNIQUE (student_id, course_id, semester, academic_year),
    FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

CREATE TABLE results (
    result_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    registration_id INTEGER NOT NULL UNIQUE,
    score NUMERIC(5,2) NOT NULL
        CHECK (score BETWEEN 0 AND 100),
    grade VARCHAR(2) NOT NULL
        CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F')),
    FOREIGN KEY (registration_id)
        REFERENCES registrations(registration_id)
);
