# MySQL Fundamentals — Beginner Learning Path

This directory is a hands-on learning path for building a strong foundation in relational database development with MySQL. The lessons progress from querying and filtering data to database design, constraints, transactions, security, reusable database logic, and automated data behavior.

The material is intentionally practice-oriented: most topics include short explanations followed by executable SQL examples, sample tables, test data, and challenge-style queries.

> **Scope:** This directory focuses on foundational and early-intermediate SQL/MySQL concepts. It is designed to be studied sequentially, but each topic can also be used as an independent reference.

## Learning objectives

By completing the lessons in `Begin`, you should be able to:

- Create databases, tables, and realistic sample datasets.
- Retrieve, filter, sort, group, and aggregate relational data.
- Use string, date, time, comparison, logical, set, and join operations.
- Design tables with primary keys, foreign keys, and integrity constraints.
- Normalize data from unstructured designs through 1NF, 2NF, 3NF, BCNF, 4NF, and 5NF concepts.
- Work with advanced numeric, text, binary, JSON, enumerated, set, and spatial data types.
- Use temporary tables and nested queries for intermediate data processing.
- Create views, stored procedures, and triggers for reusable database logic.
- Control transactions with `COMMIT`, `ROLLBACK`, `SAVEPOINT`, and isolation levels.
- Manage database users, roles, and privileges with DCL statements.

## Directory map

| Topic | What it covers | Main practice files |
| --- | --- | --- |
| [Advanced Data types](./Advanced%20Data%20types) | Advanced numeric, text, binary, JSON, enum, set, and spatial types | [`intro`](./Advanced%20Data%20types/intro) |
| [Clauses](./Clauses) | `SELECT`, `WHERE`, `HAVING`, `ORDER BY`, aliases, renaming, and string operations | [`select.sql`](./Clauses/select.sql), [`where.sql`](./Clauses/where.sql), [`having.sql`](./Clauses/having.sql), [`orderBy.sql`](./Clauses/orderBy.sql), [`rename.sql`](./Clauses/rename.sql), [`string.sql`](./Clauses/string.sql) |
| [DATE&TIME](./DATE%26TIME) | `DATE`, `TIME`, `DATETIME`, `TIMESTAMP`, date/time functions, comparisons, and duration analysis | [`DateTimeTBL.sql`](./DATE%26TIME/DateTimeTBL.sql), [`DateTimedemo.sql`](./DATE%26TIME/DateTimedemo.sql), [`dateDemo1.sql`](./DATE%26TIME/dateDemo1.sql), [`timeDemo1.sql`](./DATE%26TIME/timeDemo1.sql), [`functions`](./DATE%26TIME/functions) |
| [DCL](./DCL) | Users, roles, `GRANT`, and `REVOKE` | [`dclDemo.sql`](./DCL/dclDemo.sql), [`intro`](./DCL/intro) |
| [Normalization](./Normalization) | Relational design and normalization from raw data through 5NF | [`NF.sql`](./Normalization/NF.sql), [`intro`](./Normalization/intro) |
| [Operators](./Operators) | `IN`, `ANY`, `ALL`, joins, and set operations | [`inOpe.sql`](./Operators/inOpe.sql), [`ANYoper.sql`](./Operators/ANYoper.sql), [`ALLoper.sql`](./Operators/ALLoper.sql), [Join Operators](./Operators/Join%20Operators), [SET](./Operators/SET) |
| [Refrential IC](./Refrential%20IC) | Entity, domain, and referential integrity; cascading updates and deletes | [`test-demo.sql`](./Refrential%20IC/test-demo.sql), [`intro`](./Refrential%20IC/intro) |
| [Stored Procedures](./Stored%20Procedures) | Reusable server-side routines and procedure-oriented SQL practice | [`demo1.sql`](./Stored%20Procedures/demo1.sql), [`testTable.sql`](./Stored%20Procedures/testTable.sql), [`dummy.sql`](./Stored%20Procedures/dummy.sql) |
| [TCL](./TCL) | Transactions, commits, rollbacks, savepoints, and isolation | [`tcl_demo1.sql`](./TCL/tcl_demo1.sql), [`tclRealtion.sql`](./TCL/tclRealtion.sql), [`intro`](./TCL/intro) |
| [TEMP](./TEMP) | Temporary tables, table cloning, nested queries, duplicate cleanup, and DDL/DML practice | [`temptable.sql`](./TEMP/temptable.sql), [`clonetable.sql`](./TEMP/clonetable.sql), [`nested.sql`](./TEMP/nested.sql), [`deleteduplicates.sql`](./TEMP/deleteduplicates.sql) |
| [Triggers](./Triggers) | Automatic actions before or after data changes, including hashing examples | [`imple_tri_01.sql`](./Triggers/imple_tri_01.sql), [`imple-tri_bef_02.sql`](./Triggers/imple-tri_bef_02.sql), [`imple_tri_03.sql`](./Triggers/imple_tri_03.sql), [`imple_tri_sha256_04.sql`](./Triggers/imple_tri_sha256_04.sql), [`imle_tri_sha256_05.sql`](./Triggers/imle_tri_sha256_05.sql) |
| [Views](./Views) | Virtual tables and reusable query abstractions | [`demo1.sql`](./Views/demo1.sql), [`viewRel.sql`](./Views/viewRel.sql), [`.intro`](./Views/.intro) |

## Recommended study sequence

### 1. Query fundamentals

Start with the [Clauses](./Clauses) directory. The examples introduce the core shape of a query and gradually add filtering, aliases, sorting, grouping, aggregate functions, and string manipulation.

Suggested order:

1. [`select.sql`](./Clauses/select.sql) — selecting columns, expressions, distinct values, and aggregates.
2. [`where.sql`](./Clauses/where.sql) — filtering with comparisons, logical operators, `LIKE`, and `NULL` checks.
3. [`rename.sql`](./Clauses/rename.sql) — temporary aliases and permanent table/column renaming.
4. [`orderBy.sql`](./Clauses/orderBy.sql) — ascending/descending sorting, multiple sort keys, and `LIMIT`.
5. [`having.sql`](./Clauses/having.sql) — filtering grouped results with aggregate conditions.
6. [`string.sql`](./Clauses/string.sql) — `LENGTH`, `CONCAT`, `SUBSTRING`, `LOCATE`, case conversion, and wildcard matching.

The clause examples use practical datasets such as customers, citizens, staff, market trades, harvest records, and orders. This makes it possible to compare the same SQL concepts across different business-like scenarios.

### 2. Operators and relationships

Continue with [Operators](./Operators) to learn how multiple result sets and tables are combined:

- `IN` for membership tests.
- `ANY` and `ALL` for comparisons against subquery results.
- Inner, left, right, full-join patterns, and cross joins.
- `UNION`, `INTERSECT`, and set-difference examples.

The join lessons are especially useful after learning primary and foreign keys because they show how normalized tables are queried together.

### 3. Dates, times, and temporal analysis

The [DATE&TIME](./DATE%26TIME) lessons use event schedules and daily routines to practice:

- Extracting years, months, weekdays, hours, and quarters.
- Comparing dates and finding earliest/latest records.
- Calculating durations with `TIMEDIFF`, `TIME_TO_SEC`, and date differences.
- Filtering records relative to the current date and time.
- Grouping events by weekday, month, or start-time hour.
- Distinguishing `DATE`, `TIME`, `DATETIME`, and `TIMESTAMP` values.

Use [`functions`](./DATE%26TIME/functions) as a reference sheet while working through the demonstrations.

### 4. Data modeling and integrity

Study [Normalization](./Normalization) together with [Refrential IC](./Refrential%20IC). The normalization examples begin with a denormalized student/course structure containing repeating values and then decompose it into related tables. The integrity lessons reinforce why those relationships need primary keys, foreign keys, `NOT NULL`, `CHECK`, `DEFAULT`, and cascading actions.

Important design ideas covered include:

- Atomic values and removal of repeating groups.
- Partial and transitive dependencies.
- Candidate keys and stronger normal forms.
- Separating independent multi-valued relationships.
- Using `ON UPDATE CASCADE` and `ON DELETE CASCADE` deliberately.

### 5. Database behavior and administration

Finish with the database-programming and administration topics:

- [TEMP](./TEMP) for temporary working tables, cloning, nested queries, and cleanup operations.
- [Views](./Views) for hiding query complexity behind reusable virtual tables.
- [Stored Procedures](./Stored%20Procedures) for packaging repeatable operations on the server.
- [Triggers](./Triggers) for automatic validation, transformation, auditing, or hashing behavior.
- [TCL](./TCL) for safe multi-step changes and partial rollback.
- [DCL](./DCL) for controlling who can read or modify database objects.

## Topic details

### Advanced data types

The introductory notes cover data types beyond the basic `INT`, `VARCHAR`, and `DATE` categories:

- `DECIMAL`/`NUMERIC` for precise financial values.
- `BIGINT`, `BIT`, and `BOOLEAN` for large identifiers, flags, and Boolean-style values.
- `TINYTEXT` through `LONGTEXT` for increasingly large text values.
- `BLOB` families for binary content.
- `ENUM` for one value from a fixed list and `SET` for multiple values from a predefined list.
- `JSON` for semi-structured attributes, arrays, and API-oriented data.
- Spatial types such as `POINT`, `LINESTRING`, `POLYGON`, `GEOMETRY`, and `GEOMETRYCOLLECTION`.

### Transactions and TCL

The transaction examples use a banking ledger to demonstrate realistic units of work:

- Insert and permanently save data with `COMMIT`.
- Cancel inserts, updates, and deletes with `ROLLBACK`.
- Create intermediate recovery points with `SAVEPOINT`.
- Roll back only part of a transaction with `ROLLBACK TO SAVEPOINT`.
- Experiment with transaction isolation settings.

Always run transaction examples in a controlled practice database and verify the result after each `COMMIT` or rollback operation.

### DCL and access control

The DCL examples create users and roles for a library database, then grant or revoke table-level and column-level permissions. They demonstrate separate responsibilities for students, librarians, administrators, guests, readers, editors, and super administrators.

> **Security note:** The sample passwords are educational placeholders. Do not reuse them in a real environment. Avoid committing production credentials to a repository.

### Triggers and hashing

The trigger examples explore automatic behavior around inserts and updates, including before/after trigger patterns and SHA-256-related demonstrations. These are useful for understanding validation and derived values, but sensitive data should be handled with a complete password-management design rather than a database trigger alone.

## Running the examples

### Prerequisites

- MySQL Server 8.0 or a compatible MySQL environment.
- MySQL Shell, MySQL Workbench, or the `mysql` command-line client.
- A dedicated practice schema where tables can be created, altered, and dropped safely.

### Create a practice database

```sql
CREATE DATABASE IF NOT EXISTS mysql_learning_begin;
USE mysql_learning_begin;
```

### Execute a lesson from the command line

```bash
mysql -u <username> -p mysql_learning_begin < Begin/Clauses/select.sql
```

For paths containing spaces or special characters, quote the file path in your shell:

```bash
mysql -u <username> -p mysql_learning_begin < "Begin/DATE&TIME/DateTimeTBL.sql"
```

Alternatively, open a lesson in MySQL Workbench and execute it section by section. Running examples incrementally makes it easier to inspect intermediate results and understand how each statement changes the database.

## Practical workflow

1. Create or select a disposable learning schema.
2. Read the introductory notes for the topic.
3. Run the setup statements that create tables and sample rows.
4. Execute each query independently.
5. Compare the output with the comment describing the expected goal.
6. Modify one condition, column, sort direction, or aggregate at a time.
7. Write a variation using a new filter or dataset.
8. Reset the tables before rerunning destructive examples.

## Compatibility and quality notes

This directory is a learning workspace, so some files intentionally contain exploratory naming, abbreviated filenames, comments, and challenge data. Before using any example in production, review it for:

- MySQL-version compatibility.
- Correct spelling of table and column names.
- Consistent use of `DEPOSIT`/`WITHDRAW` and other enumerated values.
- Transaction boundaries and storage-engine behavior.
- User privileges and credential handling.
- Whether a trigger, procedure, view, or cascade is appropriate for the application.

Some advanced SQL concepts—especially full joins, set operations, transaction syntax, and procedural examples—may require adaptation depending on the exact MySQL version or another SQL database system. Treat the examples as study material and verify behavior in the target database engine.

## Suggested exercises

After completing the examples, try to:

- Add pagination and additional sorting to the clause exercises.
- Rewrite `IN` queries using joins and compare the results.
- Create a report that joins event, city, and schedule data.
- Add indexes to columns frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses.
- Normalize a small order-management table from an intentionally denormalized design.
- Create a view for monthly sales or event summaries.
- Write a stored procedure that accepts a customer or date parameter.
- Add an audit trigger that records changes in a separate history table.
- Run a multi-step banking transaction and test both commit and rollback paths.
- Create a least-privilege role for read-only reporting.

## Repository

This learning path is part of [`AshPiBit02/phase-learning-MySQL`](https://github.com/AshPiBit02/phase-learning-MySQL), a structured repository for practicing MySQL database design, queries, joins, and CRUD operations.

## License and usage

Unless the repository root specifies otherwise, treat these scripts as educational material intended for personal study, experimentation, and extension. Review the repository license before redistributing or incorporating the examples into another project.
