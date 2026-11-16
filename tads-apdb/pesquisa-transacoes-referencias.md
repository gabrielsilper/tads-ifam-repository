# Pesquisa: Transações e Níveis de Isolamento — Referências

> Lista de artigos, tutoriais e documentação para leitura e seleção.
> Todos os links foram verificados (abriram com sucesso) em **15/11/2026**.
>
> 🇧🇷 = português · 🇺🇸 = inglês

---

## 1. Conceitos, níveis de isolamento e exemplos práticos

### Artigos e tutoriais

- 🇧🇷 [Transações no SQL: garantindo integridade e consistência dos dados](https://www.alura.com.br/artigos/transacoes-no-sql-mantendo-os-dados-integros) — Alura (Jonilson Silva) · BEGIN/COMMIT/ROLLBACK com exemplos; não cobre níveis de isolamento.
- 🇧🇷 [Entendendo transações em SQL: um guia completo](https://www.datacamp.com/pt/tutorial/sql-transactions) — DataCamp (Oluseye Jeremiah) · exemplos de transferência bancária e atualização de estoque.
- 🇧🇷 [O que são transações ACID? Um guia completo para iniciantes](https://www.datacamp.com/pt/blog/acid-transactions) — DataCamp (Kurtis Pykes) · exemplos de transferência, e-commerce e estoque.
- 🇧🇷 [Entendendo Transações de Banco de Dados](https://blog.openreplay.com/pt/database-transactions/) — OpenReplay · ACID, tabela de níveis de isolamento e MVCC; diferenças entre PostgreSQL e MySQL.
- 🇧🇷 [Transações e Concorrência em Bancos de Dados: ACID, Locks e MVCC na Prática](https://cursa.app/pt/artigo/transacoes-e-concorrencia-em-bancos-de-dados-acid-locks-e-mvcc-na-pratica) — Cursa · cenários reais: transferência, carrinho disputando o último item, filas de jobs.
- 🇧🇷 [Banco de Dados: Propriedade Isolamento](https://www.estrategiaconcursos.com.br/blog/banco-dados-isolamento/) — Estratégia Concursos (Leonardo C. Brüggemann) · isolamento, leitura suja e atualização perdida.
- 🇧🇷 [Controle de Concorrência em DBMS: travamento, MVCC e estratégias otimistas](https://www.databricks.com/br/blog/concurrency-control) — Databricks · locks, 2PL, MVCC, otimista x pessimista, deadlocks (tradução automática).
- 🇧🇷 [Diário fullstack #3: iniciando meus estudos em banco de dados e entendendo ACID](https://www.tabnews.com.br/allangrds/diario-fullstack-3-iniciando-meus-estudos-em-banco-de-dados-e-entendendo-acid) — TabNews (allangrds).
- 🇧🇷 [Banco de Dados I: Transações e Controle de Concorrência (slides, PDF)](https://ads.ifba.edu.br/display551) — IFBA (Grinaldo Lopes de Oliveira).
- 🇧🇷 [Transações: fundamentos (slides, PDF)](https://ic.unicamp.br/~santanch/classic/teaching/db/2019-2/slides/bd10-transacoes-fundamentos-v08.pdf) — Unicamp.
- 🇧🇷 [Transações (slides, PDF)](https://eic.cefet-rj.br/portal/wp-content/uploads/2024/11/7-Transacoes.pdf) — CEFET-RJ.
- 🇧🇷 [FlexMVCC (artigo acadêmico, PDF)](https://sol.sbc.org.br/index.php/sbbd/article/download/22230/22054) — SBBD/SBC · controle de concorrência multiversão.
- 🇺🇸 [Understand isolation levels & read phenomena in MySQL & Postgres](https://dev.to/techschoolguru/understand-isolation-levels-read-phenomena-in-mysql-postgres-c2e) — dev.to (TECH SCHOOL) · exemplos com duas sessões simultâneas.
- 🇺🇸 [Understanding Read Phenomena in Databases: Dirty, Non-Repeatable, and Phantom Reads](https://dev.to/abhivyaktii/understanding-read-phenomena-in-databases-50mk) — dev.to · simulação dos fenômenos com SQL.
- 🇺🇸 [PostgreSQL Isolation Levels: How much money is actually in Piper's bank account?](https://spin.atomicobject.com/postgresql-isolation-levels-how-much-money-is-actually-in-pipers-bank-account/) — Atomic Object · exemplo bancário.
- 🇺🇸 [Hermitage: Testing the "I" in ACID](https://martin.kleppmann.com/2014/11/25/hermitage-testing-the-i-in-acid.html) — Martin Kleppmann · compara níveis entre SGBDs.
- 🇺🇸 [Hermitage (repositório GitHub)](https://github.com/ept/hermitage) — roteiros de teste por SGBD (MySQL, Oracle, SQL Server etc.).
- 🇺🇸 [Jepsen: MySQL 8.0.34](https://jepsen.io/analyses/mysql-8.0.34) — análise de anomalias no REPEATABLE READ do MySQL.
- 🇺🇸 [Transaction Isolation Levels in DBMS](https://www.geeksforgeeks.org/dbms/transaction-isolation-levels-dbms/) — GeeksforGeeks.
- 🇺🇸 [A Critique of ANSI SQL Isolation Levels](https://www.microsoft.com/en-us/research/publication/a-critique-of-ansi-sql-isolation-levels/) — Berenson, Bernstein, Gray et al. (SIGMOD 1995) · artigo acadêmico clássico. Cópia: [arXiv](https://arxiv.org/abs/cs/0701157).

### Documentação

- 🇧🇷 [Definição de níveis de isolamento](https://docs.aws.amazon.com/pt_br/neptune/latest/userguide/transactions-isolation-levels.html) — AWS · tabela de anomalias por nível.
- 🇺🇸 [PostgreSQL: Transaction Isolation](https://www.postgresql.org/docs/current/transaction-iso.html)

---

## 2. Transações por SGBD

### MySQL

**Artigos**
- 🇺🇸 [MySQL Transaction Isolation Levels Explained With Real Examples](https://hackernoon.com/mysql-transaction-isolation-levels-explained-with-real-examples) — HackerNoon.
- 🇺🇸 [How to Deal with MySQL Deadlocks](https://www.percona.com/blog/how-to-deal-with-mysql-deadlocks/) — Percona.

**Documentação** (manual MySQL 8.0 — mesma versão do `docker-compose.yml`)
- 🇧🇷 [Níveis de isolamento do Aurora MySQL](https://docs.aws.amazon.com/pt_br/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Reference.IsolationLevels.html) — AWS.
- 🇺🇸 [Transaction Isolation Levels](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/innodb-transaction-isolation-levels.html)
- 🇺🇸 [START TRANSACTION, COMMIT e ROLLBACK](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/commit.html)
- 🇺🇸 [SAVEPOINT, ROLLBACK TO SAVEPOINT, RELEASE SAVEPOINT](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/savepoint.html)
- 🇺🇸 [SET TRANSACTION](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/set-transaction.html)
- 🇺🇸 [Locking Reads (SELECT ... FOR UPDATE / FOR SHARE)](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/innodb-locking-reads.html)
- 🇺🇸 [Consistent Nonlocking Reads](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/innodb-consistent-read.html)
- 🇺🇸 [Statements That Cause an Implicit Commit](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/implicit-commit.html)
- 🇺🇸 [InnoDB and the ACID Model](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/mysql-acid.html)
- 🇺🇸 [Deadlocks in InnoDB](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/innodb-deadlocks.html)

### MariaDB

> Não encontrei artigo autoral específico de MariaDB com link verificável. O artigo da Alura (seção 1) cobre `START TRANSACTION`, que funciona igual no MariaDB.

**Documentação**
- 🇺🇸 [START TRANSACTION](https://mariadb.com/docs/server/reference/sql-statements/transactions/start-transaction)
- 🇺🇸 [SET TRANSACTION](https://mariadb.com/docs/server/reference/sql-statements/transactions/set-transaction)
- 🇺🇸 [READ COMMITTED](https://mariadb.com/docs/server/reference/sql-statements/transactions/transactions-read-committed)
- 🇺🇸 [REPEATABLE READ](https://mariadb.com/docs/server-1/reference/sql-statements/transactions/transactions-repeatable-read)
- 🇺🇸 [SERIALIZABLE](https://mariadb.com/docs/server-1/reference/sql-statements/transactions/transactions-serializable)

### Oracle

**Artigos**
- 🇧🇷 [ORA-08177: can't serialize access for this transaction](https://www.profissionaloracle.com.br/forums/topic/ora-08177-cant-serialize-access-transaction/) — Fórum Profissional Oracle · caso real com SERIALIZABLE (é fórum, não artigo).
- 🇺🇸 [PL/SQL 101: Defining and Managing Transactions](https://stevenfeuersteinonplsql.blogspot.com/2018/12/plsql-101-defining-and-managing.html) — Steven Feuerstein · exemplos de COMMIT, ROLLBACK e SAVEPOINT.

**Documentação**
- 🇺🇸 [Data Concurrency and Consistency (Oracle 19c)](https://docs.oracle.com/en/database/oracle/oracle-database/19/cncpt/data-concurrency-and-consistency.html) — READ COMMITTED, SERIALIZABLE, READ ONLY e multiversão.
- 🇺🇸 [Transactions (Oracle 19c)](https://docs.oracle.com/en/database/oracle/oracle-database/19/cncpt/transactions.html)
- 🇺🇸 [SET TRANSACTION](https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/SET-TRANSACTION.html)
- 🇺🇸 [PL/SQL: Transaction Processing and Control](https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/transaction-processing-and-control.html)

### SQL Server

**Artigos**
- 🇧🇷 [Faça CRUD em SQL Server com segurança usando as transações](https://www.dio.me/articles/faca-crud-em-sql-server-com-seguranca-usando-as-transacoes) — DIO (Felipe Gonçalves) · BEGIN TRAN/COMMIT/ROLLBACK (exemplos parciais).
- 🇺🇸 [Demonstrations of Transaction Isolation Levels in SQL Server](https://www.mssqltips.com/sqlservertip/2977/demonstrations-of-transaction-isolation-levels-in-sql-server/) — MSSQLTips (Derek Colley) · demonstração de cada nível.
- 🇺🇸 [SQL Server NOLOCK Anomalies, Issues and Inconsistencies](https://www.mssqltips.com/sqlservertip/6072/sql-server-nolock-anomalies-issues-and-inconsistencies/) — MSSQLTips · riscos do READ UNCOMMITTED/NOLOCK.
- 🇺🇸 [SQL Server Isolation Levels By Example](https://www.sqlservercentral.com/blogs/sql-server-isolation-levels-by-example) — SQLServerCentral.
- 🇺🇸 [Row Versioning Concurrency in SQL Server](https://www.red-gate.com/simple-talk/databases/sql-server/t-sql-programming-sql-server/row-versioning-concurrency-in-sql-server/) — Redgate Simple Talk.
- 🇺🇸 [Snapshot Isolation in SQL Server](https://www.sqlshack.com/snapshot-isolation-in-sql-server/) — SQLShack.

**Documentação**
- 🇧🇷 [Guia de bloqueio de transações e controle de versão de linha](https://learn.microsoft.com/pt-br/sql/relational-databases/sql-server-transaction-locking-and-row-versioning-guide) — Microsoft.
- 🇧🇷 [SET TRANSACTION ISOLATION LEVEL](https://learn.microsoft.com/pt-br/sql/t-sql/statements/set-transaction-isolation-level-transact-sql) — Microsoft.
- 🇺🇸 [BEGIN TRANSACTION](https://learn.microsoft.com/en-us/sql/t-sql/language-elements/begin-transaction-transact-sql)
- 🇺🇸 [Snapshot Isolation in SQL Server (ADO.NET)](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/sql/snapshot-isolation-in-sql-server)

---

## 3. SGBDs NoSQL possuem controle de transações?

### Artigos e tutoriais

- 🇧🇷 [Qual é a diferença entre ACID e BASE?](https://aws.amazon.com/pt/compare/the-difference-between-acid-and-base-database/) — AWS.
- 🇧🇷 [O que são transações ACID?](https://www.mongodb.com/pt-br/resources/basics/databases/acid-transactions) — MongoDB · exemplo de transferência entre contas.
- 🇧🇷 [Jepsen avalia o MongoDB 4.2.6](https://www.infoq.com/br/news/2020/06/Jepsen-MongoDB-4-2-6/) — InfoQ Brasil · crítica ao uso do termo "ACID".
- 🇧🇷 [O estado do NoSQL](https://www.infoq.com/br/articles/State-of-NoSQL/) — InfoQ Brasil.
- 🇧🇷 [Como executar transações no Redis](https://www.digitalocean.com/community/cheatsheets/how-to-run-transactions-in-redis-pt) — DigitalOcean · MULTI, EXEC, DISCARD.
- 🇧🇷 [Transações Redis (laboratório prático)](https://labex.io/pt/tutorials/redis-redis-transactions-552106) — LabEx.
- 🇺🇸 [New features in Cassandra 2.0 – More on Lightweight Transactions](https://opencredo.com/blogs/new-features-in-cassandra-2-0-more-on-lightweight-transactions/) — OpenCredo.
- 🇺🇸 [ACID vs. BASE: Consistency Models Explained](https://neo4j.com/blog/graph-database/acid-vs-base-consistency-models-explained/) — Neo4j.

### Documentação

- 🇧🇷 [MongoDB: Transações](https://www.mongodb.com/pt-br/docs/manual/core/transactions/)
- 🇺🇸 [MongoDB: Production Considerations](https://www.mongodb.com/docs/manual/core/transactions-production-consideration/)
- 🇺🇸 [Redis: Transactions (MULTI/EXEC/WATCH)](https://redis.io/docs/latest/develop/using-commands/transactions/)
- 🇺🇸 [Apache Cassandra: CQL DML (lightweight transactions)](https://cassandra.apache.org/doc/latest/cassandra/developing/cql/dml.html)
- 🇺🇸 [DataStax: Lightweight transactions](https://docs.datastax.com/en/cassandra-oss/3.x/cassandra/dml/dmlLtwtTransactions.html)
- 🇺🇸 [Amazon DynamoDB: Transactions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/transactions.html)
- 🇺🇸 [Amazon DynamoDB: Transactions — How it works](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/transaction-apis.html)
- 🇺🇸 [Neo4j: Database internals and transactional behavior](https://neo4j.com/docs/operations-manual/current/database-internals/)

---

## 4. Referências

Cada link acima é a referência do tópico onde aparece. Depois de ler, escolher quais citar no trabalho (e formatar no padrão exigido, ex.: ABNT).
