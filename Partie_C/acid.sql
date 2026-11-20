--Read Committed

--Session 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT solde FROM comptes_bancaires WHERE id = 1;

--Session 2
START TRANSACTION;

UPDATE comptes_bancaires SET solde = 12000 WHERE id = 1;

COMMIT;

--Session 1
SELECT solde FROM comptes_bancaires WHERE id = 1;

COMMIT;

--Repeatable Read

--Session 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT solde FROM comptes_bancaires WHERE id = 1;

--Session 2
START TRANSACTION;

UPDATE comptes_bancaires SET solde = 12000 WHERE id = 1;

COMMIT;

--Session 1
SELECT solde FROM comptes_bancaires WHERE id = 1;

COMMIT;

--Wal
-- Le WAL écrit toujours les opérations sur disque avant la mémoire