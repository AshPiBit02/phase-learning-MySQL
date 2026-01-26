# A temporary table stores data temporarily during quer execution
# It holds intermediate results without affecting permanent tables
# are stored in system's temporary database and get automatically deleted when the session or transaction ends
# useful for calculations or data processing without changing permanent data
# Syntax: CREATE TEMPORARY TABLE #temp_table_name(.....);
CREATE TEMPORARY TABLE EmpDetails (id INT, name VARCHAR(20));
INSERT INTO EmpDetails VALUES (1,'LOl'), (2,'Lolx');
SELECT * FROM EmpDetails;
--Types of temporary tables;
-- 1# Local Temporary Table(visible only to the current session/user and is automatically dropped when the session ends)
-- 2# Global Temporary Table(visible to all sessions/users and is dropped when the last session using it ends)


