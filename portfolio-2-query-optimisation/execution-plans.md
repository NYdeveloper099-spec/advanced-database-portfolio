
# Query Processing and Optimisation

## 1. Introduction

This portfolio investigates query processing and optimisation
in the University Student Result Management System. The aim is
to examine SQL query performance, interpret execution plans,
and explore how indexes can support efficient data retrieval.

PostgreSQL was used to execute the queries and inspect their
execution plans with EXPLAIN ANALYZE.

## 2. Queries Tested

The following queries were investigated:

1. Retrieving a student using a student number.
2. Retrieving students belonging to a particular department.
3. Joining students, registrations, courses, and results.
4. Counting records in the main database tables.

The multi-table join combines student details with course
information, scores, and grades. The query was ordered by
student number and course code to make the results easier
to interpret.

## 3. Indexing

Two indexes were created:

- `idx_students_student_number` on `students(student_number)`
- `idx_students_department` on `students(department_id)`

The first index is intended to support searches for individual
students by their student number. The second is intended to
support queries that filter students by department.

Indexes can reduce the amount of data PostgreSQL needs to
examine for suitable queries. However, their effectiveness
depends on factors such as table size, data distribution,
selectivity, and the cost estimated by the query planner.

## 4. Execution Plan Analysis

### 4.1 Student-number lookup

The following query was analysed:

```sql
EXPLAIN ANALYZE
SELECT *
FROM students
WHERE student_number = 'STU001';
```

Observed results:

- Rows returned: 1
- Rows removed by filter: 2
- Scan method: Sequential Scan
- Displayed execution time: 0.000 ms

The execution plan shows that PostgreSQL scanned the students
table and applied a filter to find the matching student.
Although an index on `student_number` had been created,
PostgreSQL did not select it for this query.

This is reasonable for the small sample table because
scanning a few rows can be cheaper than accessing an index
and then retrieving the corresponding table row.

### 4.2 Department filter

The following query was analysed:

```sql
EXPLAIN ANALYZE
SELECT
    student_number,
    first_name,
    last_name
FROM students
WHERE department_id = 1;
```

Observed results:

- Rows returned: 2
- Rows removed by filter: 1
- Scan method: Sequential Scan
- Displayed execution time: 0.000 ms

PostgreSQL used a sequential scan to locate the students
belonging to department 1. The result confirms that the
filter returned two matching records from the three-student
sample dataset.

The department index was available, but the planner chose
to scan the small table instead.

### 4.3 Multi-table join

A join was executed across the students, registrations,
courses, and results tables.

The query returned four rows, combining student details
with course titles, scores, and grades.

This demonstrates how relational joins can retrieve
related information from multiple tables using their
key relationships.

## 5. Performance Discussion

The execution plans show that creating an index does not
guarantee that PostgreSQL will use it for every query.

The sample database contains only three student records.
For a table this small, a sequential scan can be more
economical than an index scan.

The displayed execution time of 0.000 ms is too small
to support a meaningful performance comparison. Therefore,
the results do not establish that the indexes improved
query performance.

A more reliable comparison would use a larger dataset,
collect execution plans before and after indexing, and
compare repeated measurements under equivalent conditions.

## 6. Conclusion

This exercise demonstrated how to execute SQL queries,
create indexes, and interpret PostgreSQL execution plans.

The tests showed that PostgreSQL selected sequential scans
for the two student queries despite the presence of indexes.
The behaviour is consistent with the very small sample
dataset and illustrates that query optimisation depends
on the query planner's cost estimates.

Further testing with a larger dataset would be required
to quantify the performance benefits of the indexes.
