# Portfolio 2: Query Processing and Optimisation

## Project Documentation

- [SQL Queries and Indexes](queries.sql)
- [Execution Plans and Optimisation Analysis](execution-plans.md)
- [Evidence and Screenshots](evidence/README.md)

## 1. Introduction

This portfolio investigates query processing and optimisation using PostgreSQL. The case study is the University Student Result Management System developed in Portfolio 1. The database supports students, departments, lecturers, courses, registrations, and examination results.

The practical work focuses on SQL queries, relational joins, aggregate queries, indexes, and execution-plan analysis.

## 2. Objectives

The objectives of this portfolio are to:

- Retrieve student records using SQL filtering conditions.
- Join related tables to obtain student results and course information.
- Count records in the main database tables.
- Examine query execution plans using `EXPLAIN ANALYZE`.
- Create indexes on columns used for filtering.
- Interpret the observed execution plans and discuss the limitations of the performance tests.

## 3. Tools and Environment

- PostgreSQL 18
- Browser-based Postgres Playground
- SQL
- GitHub for version control and documentation

## 4. Practical Activities

The following activities were completed:

1. Retrieved a student using a student number.
2. Retrieved students belonging to a particular department.
3. Joined the students, registrations, courses, and results tables.
4. Counted records in the departments, students, lecturers, courses, registrations, and results tables.
5. Created indexes on `students(student_number)` and `students(department_id)`.
6. Examined the execution plans of the student-number lookup and department-filter queries.

## 5. Key Findings

The captured execution plans for the two student queries showed sequential scans. This indicates that PostgreSQL examined rows in the `students` table and applied the relevant filters.

Although the indexes were created successfully, the observed plans did not demonstrate a change to index scans or establish a measurable performance improvement. The dataset is small, and the recorded execution times were extremely short.

The multi-table join demonstrated how related student, registration, course, and result records can be retrieved in one query. The table-count query provided a summary of the number of records in the main tables.

## 6. Evidence

The portfolio includes:

- SQL statements in `queries.sql`.
- Execution-plan interpretation and performance discussion in `execution-plans.md`.
- Screenshots of the join query, table counts, index creation, and execution plans in the `evidence` folder.

## 7. Conclusion

This portfolio provided practical experience in SQL query processing, relational joins, aggregate queries, index creation, and execution-plan interpretation. It demonstrated that creating an index does not guarantee that PostgreSQL will use it for every query.

The observed execution plans and small dataset also showed why performance claims should be based on controlled measurements rather than assumptions.

## 8. Case Study Continuity

This portfolio continues the University Student Result Management System introduced in Portfolio 1. The same case study will be maintained throughout the remaining portfolio activities.
