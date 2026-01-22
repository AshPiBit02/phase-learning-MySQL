#DDL Commands(defines database structure)
--1. CREATE(creates a new table of database object)
-- Syntax: CREATE TABLE table_name(columns datatypes,....);
--         CREATE DATABASE database_name;
--2. ALTER(modifies table structure)
-- Syntax: ALTER TABLE table_name ADD column_name datatype;(to add new column to the table)
--         ALTER TABLE table_name MODIFY column_name datatype;(to manipulate the datatype of existing column)
--         ALTER TABLE table_name DROP column_name;(to delete a column)
--3. DROP(deletes table and its data permanently)
-- Syntax: DROP TABLE table_name;(delete the table an its data)
--         DROP DATABASE db_name;(deletes the database permanently)
--4. TRUNCATE(deletes the table's data permanently keeping the table structure)
-- Syntax: TRUNCATE TABLE table_name;
--5. RENAME(Renames a table or column)
-- Syntax: RENAME TABLE old_name TO new_name;
--6. COMMENT(adds description to object)
-- Syntax: COMMENT ON TABLE table_name IS 'description';
#DML commans(works on table data)
--1. INSERT(adds new row)
-- Syntax: INSERT INTO table_name VALUES(value1,value2,....);(for this statment the order for must be general)
--         INSERT INTO table_name(col1,col2,......) VALUES(value1,value2,....);
--2. DELETE(deletes specific rows)
-- Syntax: DELETE FROM table_name WHERE condition;
--3. UPDATE(modifies existing data)
-- Syntax: UPDATE table_name SET column=value WHERE condition;
--4. SELECT(retrieves data)
-- Syntax: SELECT column1,columns2,...FROM table_name WHERE condition;
--5. MERGE(insert or update in one command)
-- Syntax: MERGE INTO table T USING source S ON(condition) WHEN MATCHED THEN UPDATE SET.....WHEN NOT MATCHED THEN INSERT...;



