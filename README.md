# Phase Learning MySQL

`phase-learning-MySQL` is a hands-on collection of MySQL lessons, SQL examples, and database-design exercises. The material is organized as a beginner learning path and progresses from basic queries to joins, normalization, transactions, access control, stored procedures, triggers, and views.

The repository is practice-oriented: most lessons contain explanatory notes, table definitions, sample data, and queries that can be run and modified while learning.

## Topics

All learning material is located in [`Begin/`](./Begin/).

| Topic | What it covers |
| --- | --- |
| [Advanced Data types](./Begin/Advanced%20Data%20types) | Numeric, text, binary, JSON, `ENUM`, `SET`, and spatial data types |
| [Clauses](./Begin/Clauses) | `SELECT`, `WHERE`, `HAVING`, `ORDER BY`, aliases, renaming, and string functions |
| [DATE&TIME](./Begin/DATE%26TIME) | `DATE`, `TIME`, `DATETIME`, `TIMESTAMP`, date functions, and duration calculations |
| [DCL](./Begin/DCL) | Users, roles, `GRANT`, and `REVOKE` |
| [Normalization](./Begin/Normalization) | Relational design and normalization through advanced normal forms |
| [Operators](./Begin/Operators) | `IN`, `ANY`, `ALL`, joins, and set operations |
| [Refrential IC](./Begin/Refrential%20IC) | Primary keys, foreign keys, constraints, and cascading actions |
| [Stored Procedures](./Begin/Stored%20Procedures) | Reusable server-side routines with input parameters and queries |
| [TCL](./Begin/TCL) | Transactions, `COMMIT`, `ROLLBACK`, `SAVEPOINT`, and isolation |
| [TEMP](./Begin/TEMP) | Temporary tables, table cloning, nested queries, and duplicate cleanup |
| [Triggers](./Begin/Triggers) | Automatic actions before or after inserts and updates |
| [Views](./Begin/Views) | Virtual tables and reusable query abstractions |

The [Operators](./Begin/Operators) section also contains dedicated examples for [join operators](./Begin/Operators/Join%20Operators) and [set operators](./Begin/Operators/SET).

## Repository structure

```text
phase-learning-MySQL/
├── Begin/
│   ├── Advanced Data types/
│   ├── Clauses/
│   ├── DATE&TIME/
│   ├── DCL/
│   ├── Normalization/
│   ├── Operators/
│   ├── Refrential IC/
│   ├── Stored Procedures/
│   ├── TCL/
│   ├── TEMP/
│   ├── Triggers/
│   └── Views/
├── LICENSE
└── README.md
```

## Requirements

- MySQL Server 8.0 or a compatible MySQL installation
- MySQL Workbench, MySQL Shell, or the `mysql` command-line client
- A disposable practice database where tables can safely be created, changed, and removed

## Getting started

Clone the repository:

```bash
git clone https://github.com/AshPiBit02/phase-learning-MySQL.git
cd phase-learning-MySQL
```

Create a dedicated learning database:

```sql
CREATE DATABASE IF NOT EXISTS mysql_learning_begin;
USE mysql_learning_begin;
```

Run a lesson from the command line:

```bash
mysql -u <username> -p mysql_learning_begin < Begin/Clauses/select.sql
```

Paths containing spaces or special characters should be quoted by the shell:

```bash
mysql -u <username> -p mysql_learning_begin < "Begin/DATE&TIME/DateTimeTBL.sql"
```

You can also open the files in MySQL Workbench and execute them section by section. This is recommended for lessons that create multiple tables or demonstrate transactions, procedures, triggers, and privileges.

## Suggested learning order

1. Start with [Clauses](./Begin/Clauses) to learn selection, filtering, sorting, grouping, and string operations.
2. Continue with [Operators](./Begin/Operators) and its join and set-operation examples.
3. Study [DATE&TIME](./Begin/DATE%26TIME) for temporal values and date calculations.
4. Review [Normalization](./Begin/Normalization) and [Refrential IC](./Begin/Refrential%20IC) together to connect data modeling with constraints.
5. Finish with [TEMP](./Begin/TEMP), [Views](./Begin/Views), [Stored Procedures](./Begin/Stored%20Procedures), [Triggers](./Begin/Triggers), [TCL](./Begin/TCL), and [DCL](./Begin/DCL).

## Safe practice

These scripts are intended for learning and may create, alter, or delete database objects. Before running them:

- Use a dedicated practice schema rather than a production database.
- Read setup and cleanup statements before executing a file.
- Run transaction examples incrementally and verify the result after each `COMMIT` or rollback.
- Review user and privilege examples before creating accounts or granting permissions.
- Treat sample passwords as placeholders and never reuse them in real systems.
- Check procedure, trigger, and view names before rerunning a lesson to avoid conflicts.

## Compatibility notes

The examples target MySQL syntax, but individual scripts may require small adjustments for a specific MySQL version or another database engine. In particular, join behavior, set operations, transaction settings, procedural syntax, and privilege management can vary between systems. Treat each file as study material and verify its behavior in your own environment.

## License

This project is released under the [MIT License](./LICENSE).
