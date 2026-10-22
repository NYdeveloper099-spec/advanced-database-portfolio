# Portfolio 2: Query Processing and Optimisation

## 1. Introduction

This portfolio investigates how PostgreSQL processes SQL queries and how indexes can improve data retrieval. The University Student Result Management System from Portfolio 1 will be used as the case study.

## 2. Objectives

- Analyse SQL execution plans using `EXPLAIN` and `EXPLAIN ANALYZE`.
- Identify opportunities to improve query performance.
- Create indexes on suitable columns.
- Compare query plans before and after indexing.
- Explain the results and limitations of the performance tests.

## 3. Tools and Environment

- PostgreSQL 18 browser-based playground
- SQL
- GitHub for version control and documentation

## 4. Planned Experiments

The experiments will use student records, course registrations, and examination results.

1. Run a query and inspect its execution plan.
2. Create an index on a column used for filtering or joining.
3. Run the query again and inspect the plan.
4. Compare execution plans, execution time, and scan methods.
5. Document the results without assuming that an index always improves performance.

## 5. Evidence

The portfolio will contain SQL scripts, execution plans, screenshots, and a brief performance analysis.

## 6. Conclusion

This activity will demonstrate how query planning, indexing, and measurement can help improve database performance.
