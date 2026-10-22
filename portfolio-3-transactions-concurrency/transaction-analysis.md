# Transaction Analysis

## 1. Introduction

This document analyses the transaction and concurrency demonstrations performed for Portfolio 3 of the University Student Result Management System.

The practical tests used PostgreSQL 18 to demonstrate transaction control, transaction isolation, and row-level locking. A dedicated test table was used to avoid modifying the system's actual academic records.

## 2. COMMIT Test

**Operation:** A row with `test_id = 1` was inserted into `portfolio3_transaction_test` within a transaction.

**Transaction control:** `BEGIN`, `INSERT`, and `COMMIT`.

**Expected result:** The row remains available after the transaction commits.

**Analysis:** `COMMIT` makes the transaction's changes permanent. This is useful when an operation, such as recording a student's result, has completed successfully and its changes should be retained.

The screenshot of the successful query and returned row provides the practical evidence for this test.

## 3. ROLLBACK Test

**Operation:** A row with `test_id = 2` was inserted into the test table inside a transaction.

**Transaction control:** `BEGIN`, `INSERT`, and `ROLLBACK`.

**Expected result:** A subsequent query returns no row with `test_id = 2`.

**Analysis:** `ROLLBACK` cancels the changes made within the active transaction. In an academic system, this mechanism can help cancel an incomplete operation before its changes are committed.

The screenshot of the rollback test provides evidence of the observed result.

## 4. Transaction Isolation Test

**Operation:** A transaction was started using `SERIALIZABLE` isolation.

**SQL feature:** `BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE`.

**Verification:** `current_setting('transaction_isolation')` was queried.

**Expected result:** The reported isolation level is `serializable`.

**Analysis:** Serializable isolation is designed to provide behaviour equivalent to transactions executing in some serial order. PostgreSQL may abort a transaction when concurrent activity prevents a serializable execution, so applications must be prepared to retry appropriate transactions.

This test verifies the configured isolation level. It does not independently demonstrate a concurrency conflict or a serialization failure.

## 5. Row-Level Locking Test

**Operation:** The committed test row was selected using `SELECT ... FOR UPDATE` inside a transaction.

**Transaction control:** `BEGIN`, `SELECT ... FOR UPDATE`, and `COMMIT`.

**Analysis:** `FOR UPDATE` requests a row-level lock on the selected row. The lock helps coordinate conflicting operations by other transactions and is normally held until the transaction ends.

The test demonstrates the locking syntax. Because the browser playground uses a single connection, it does not measure blocking or conflicts between two independent concurrent sessions.

## 6. Relevance to the Case Study

In the University Student Result Management System, transactions can group related operations so that they either complete successfully or are cancelled.

For example, a registration operation might need to insert a registration record and update related information. If an essential step fails, a rollback can prevent partial changes from being retained.

Similarly, controlled locking and appropriate isolation levels can help protect academic data when multiple users attempt to update related records.

These are applications of the demonstrated concepts; the practical tests used a separate test table rather than modifying live academic records.

## 7. Limitations

The demonstrations were performed in a browser-based PostgreSQL environment using a single connection. As a result, the work did not directly test two concurrent sessions, lock contention, lost updates, or serialization failures.

The tests demonstrate transaction commands and configuration, but a stronger concurrency experiment would require two independent database sessions and coordinated transactions.

## 8. Conclusion

The tests demonstrated `COMMIT`, `ROLLBACK`, the configuration of `SERIALIZABLE` isolation, and the use of `SELECT ... FOR UPDATE`.

The results illustrate how transactions and locking mechanisms support database consistency. They also highlight the distinction between demonstrating transaction syntax and empirically testing concurrency between independent sessions.
