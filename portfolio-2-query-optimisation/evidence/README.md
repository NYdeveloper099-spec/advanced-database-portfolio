# Portfolio 2 Evidence: Query Processing and Optimisation

## 1. Student Number Index

**Screenshot:** `Screenshot 2026-10-22 at 21.57.27.png`

This screenshot records the SQL statement used to create an index on the `student_number` column of the `students` table:

```sql
CREATE INDEX idx_students_student_number
ON Students(student_number);
```

The index was intended to support student lookups by student number. Indexing can improve retrieval efficiency for suitable queries, although the actual benefit depends on the data volume and the database query planner.

## 2. Execution Plan for Student Lookup

**Screenshot:** `Screenshot 2026-10-22 at 21.58.04.png`

This screenshot records an `EXPLAIN ANALYZE` query that retrieves the student number, first name, and last name for student `STU001`.

The execution plan and timing information can be used to examine how PostgreSQL executes the lookup. The actual plan and timing should be interpreted from the screenshot rather than assuming that an index was used.

## 3. Execution Plan for Full-Row Student Lookup

**Screenshot:** `Screenshot 2026-10-22 at 21.59.16.png`

This screenshot records an `EXPLAIN ANALYZE` query that retrieves all columns for the student whose student number is `STU001`.

Comparing this query with the selected-column lookup helps illustrate how different query projections can affect the query being evaluated. The execution plan and measured timing provide evidence for analysing the database's execution strategy.

## 4. Student Registration, Course, and Result Join

**Screenshot:** `Screenshot 2026-10-22 at 22.30.04.png`

This screenshot contains part of a SQL join query connecting students, registrations, courses, and results through their related identifiers.

The join brings together student and academic information from multiple relational tables. This demonstrates the use of relational joins to retrieve related information for the University Student Result Management System.

## 5. Table Record Counts

**Screenshot:** `Screenshot 2026-10-22 at 22.30.34.png`

This screenshot records part of a `UNION ALL` query that counts records in multiple tables, including lecturers and courses.

The query provides a convenient way to inspect the number of records in the selected tables. These counts help describe the test dataset used during the database exercises.

## Evidence Summary

The screenshots document index creation, query execution-plan analysis, relational joins, and table record-count queries. Together, they support the practical work undertaken for Portfolio 2: Query Processing and Optimisation.

Execution plans and timings should be interpreted using the actual database output. The presence of an index does not by itself prove that a query became faster; the query planner, data volume, and execution plan must also be considered.
