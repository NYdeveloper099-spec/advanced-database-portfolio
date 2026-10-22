# Portfolio 3: Transactions and Concurrency

## Project Documentation

- [Transaction SQL Scripts](transactions.sql)
- [Transaction Analysis](transaction-analysis.md)
- [Evidence and Screenshots](evidence/README.md)

## 1. Case Study

This portfolio continues the University Student Result Management System developed in Portfolio 1. The system stores student details, departments, courses, registrations, and academic results. Database transactions help maintain the consistency of these records when changes are made.

## 2. Objectives

The objectives of this activity are to:

- Demonstrate transaction control using `BEGIN`, `COMMIT`, and `ROLLBACK`.
- Explain how transactions help protect data integrity.
- Set and inspect a transaction isolation level.
- Demonstrate a row-level locking mechanism.
- Record practical results and identify limitations in the testing environment.

## 3. Tools and Environment

- PostgreSQL 18
- Browser-based Postgres Playground
- SQL
- GitHub for version control and evidence storage

## 4. Practical Activities

Four transaction-related tests were performed:

1. **Commit test:** Inserted a test record within a transaction and committed the change.
2. **Rollback test:** Inserted a separate test record and rolled back the transaction.
3. **Isolation test:** Set the transaction isolation level to `SERIALIZABLE` and queried the current setting.
4. **Row-locking test:** Used `SELECT ... FOR UPDATE` to request a row-level lock within a transaction.

The tests used a dedicated `portfolio3_transaction_test` table so that the demonstrations would not modify actual student records.

## 5. Summary of Findings

The commit test demonstrated how a transaction can make a change permanent. The rollback test demonstrated how an uncommitted change can be cancelled. The isolation test showed how to configure and inspect a transaction isolation level, while the row-locking test demonstrated the SQL syntax for requesting a row-level lock.

The practical work was performed in a browser-based PostgreSQL environment. The evidence and analysis distinguish between demonstrating transaction commands and testing interactions between independent concurrent sessions.

## 6. Evidence

Screenshots of the transaction tests are stored in the `evidence` folder. The SQL statements are documented in `transactions.sql`, and their purpose and interpretation are explained in `transaction-analysis.md`.

## 7. Conclusion

This portfolio provided practical experience with transaction control, rollback, transaction isolation, and row-level locking. It demonstrated how transaction mechanisms can support database consistency and how test results should be interpreted in the context of the execution environment.

## 8. Case Study Continuity

This activity continues the University Student Result Management System from Portfolio 1 and Portfolio 2. The same case study will be used in the remaining portfolio activities.
