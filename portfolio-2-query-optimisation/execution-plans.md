# Execution Plans and Optimisation Analysis

## 1. Purpose

This document records the query-processing and indexing experiments for Portfolio 2 of the University Student Result Management System.

PostgreSQL 18 was used to execute SQL queries, create indexes, and inspect execution plans with `EXPLAIN ANALYZE`.

## 2. Student Lookup by Student Number

**Query condition:** `student_number = 'STU001'`

**Observed result:**

- Rows returned: 1
- Rows removed by filter: 2
- Scan method: Sequential Scan
- Displayed execution time: 0.000 ms in the captured plan

**Analysis:**

The execution plan showed a sequential scan on the `students` table. PostgreSQL examined the table rows and applied the student-number filter to identify the matching record.

Although an index on `student_number` had been created, the captured plan showed a sequential scan rather than an index scan. For a very small table, scanning a few rows can be less expensive than using an index and retrieving the corresponding table row.

## 3. Student Lookup by Department

**Query condition:** `department_id = 1`

**Observed result:**

- Rows returned: 2
- Rows removed by filter: 1
- Scan method: Sequential Scan
- Displayed execution time: 0.000 ms in the captured plan

**Analysis:**

The execution plan showed that PostgreSQL scanned the `students` table and applied the department filter. The query returned two matching student records from the three-student sample dataset.

The captured plan did not demonstrate the use of the department index. This is consistent with the possibility that a sequential scan has a lower estimated cost for a small table.

## 4. Index Creation

Two indexes were created successfully:

1. `idx_students_student_number` on `students(student_number)`
2. `idx_students_department` on `students(department_id)`

The student-number index was intended to support searches by student number. The department index was intended to support queries filtering students by department.

Creating an index makes an additional access path available to the query planner, but it does not guarantee that the planner will select that path for every query.

## 5. Multi-Table Join

A join query was executed across the following tables:

- `students`
- `registrations`
- `courses`
- `results`

The query selected student details, course codes and titles, scores, and grades. The join used the student, course, and registration identifiers to connect related records and ordered the output by student number and course code.

The successful execution was documented with a screenshot. The screenshot should be used as the source for the actual number of rows returned.

## 6. Table Record Counts

A `UNION ALL` query was executed to count records in six tables:

- `departments`
- `students`
- `lecturers`
- `courses`
- `registrations`
- `results`

The query returned the record counts from the current database. The saved screenshot provides the observed totals.

## 7. Performance Discussion

The captured execution plans showed sequential scans for both student queries, even though the relevant indexes had been created. The evidence therefore does not establish that the indexes improved query performance.

The sample `students` table contained only three records. On a table this small, a sequential scan can be an efficient choice. The displayed execution time of `0.000 ms` is also too small to support a meaningful performance comparison.

A more rigorous comparison would use a larger dataset and collect plans before and after index creation under comparable conditions. Repeated measurements and appropriate database statistics would provide stronger evidence of any performance differences.

## 8. Limitations

The experiments used a small sample dataset. The recorded execution times were extremely short, and the captured plans did not show a transition to index scans.

The current evidence is sufficient to demonstrate SQL execution, index creation, and interpretation of query plans. It is not sufficient to quantify an indexing performance improvement.

## 9. Conclusion

The experiments demonstrated query processing through filtering, relational joins, aggregate queries, and execution-plan inspection. They also demonstrated that creating an index does not automatically cause PostgreSQL to use it.

The main finding is that the two tested student queries used sequential scans in the captured plans. Further testing with a larger dataset and controlled measurements would be required to quantify the performance impact of indexing.
