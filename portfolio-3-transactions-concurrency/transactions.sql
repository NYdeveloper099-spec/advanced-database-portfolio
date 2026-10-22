-- Portfolio 3: Transactions and Concurrency
-- Case Study: University Student Result Management System
-- Environment: PostgreSQL 18 / browser-based Postgres Playground

-- =========================================================
-- 1. Create an isolated table for transaction demonstrations
-- =========================================================

CREATE TABLE IF NOT EXISTS portfolio3_transaction_test (
    test_id INTEGER PRIMARY KEY,
    description TEXT NOT NULL
);


-- =========================================================
-- 2. COMMIT test
-- Insert a test row and commit the transaction.
-- Expected: test_id 1 remains in the table.
-- =========================================================

BEGIN;

INSERT INTO portfolio3_transaction_test (test_id, description)
VALUES (1, 'Committed transaction test');

COMMIT;

SELECT *
FROM portfolio3_transaction_test
WHERE test_id = 1;


-- =========================================================
-- 3. ROLLBACK test
-- Insert a second row and roll back the transaction.
-- Expected: test_id 2 is absent from the table.
-- =========================================================

BEGIN;

INSERT INTO portfolio3_transaction_test (test_id, description)
VALUES (2, 'This row should be rolled back');

ROLLBACK;

SELECT *
FROM portfolio3_transaction_test
WHERE test_id = 2;


-- =========================================================
-- 4. Transaction isolation test
-- Expected: isolation_level is serializable.
-- =========================================================

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT current_setting('transaction_isolation')
    AS isolation_level;

COMMIT;


-- =========================================================
-- 5. Row-locking demonstration
-- FOR UPDATE requests a row-level lock on the selected row.
-- The lock is released when the transaction ends.
-- =========================================================

BEGIN;

SELECT *
FROM portfolio3_transaction_test
WHERE test_id = 1
FOR UPDATE;

COMMIT;


-- End of Portfolio 3 transaction tests
