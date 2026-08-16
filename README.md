# Data_Base

Repositório de estudos de banco de dados. Scripts em **T-SQL (SQL Server)** feitos
durante as aulas e os exercícios de revisão.

## Estrutura

```
aulas/       -> scripts acompanhados em aula
exercicios/  -> exercícios e revisões para prova
```

| Arquivo | Banco | O que tem |
|---|---|---|
| `aulas/aula1.sql` | `REVISAO2026` | Tabelas `categoria` e `produto` com chave estrangeira. Pratica INSERT, UPDATE, DELETE, ALTER TABLE (ADD/DROP COLUMN), ORDER BY, INNER JOIN e LEFT JOIN. |
| `exercicios/Revisao.sql` | `REVISAO` | Modelo de restaurante (garçom, mesa, produto, atendimento, consumo). Pratica subconsultas, DISTINCT, colunas calculadas, `NOT IN` e filtro por data com `GETDATE()`. |
| `exercicios/restaurante(revisão prova).sql` | `restaurante` | Só a modelagem do restaurante: criação das 5 tabelas e seus relacionamentos. |

## Conteúdo praticado

- DDL: `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE`, chaves primárias com `IDENTITY` e chaves estrangeiras
- DML: `INSERT`, `UPDATE`, `DELETE`
- Consultas: `SELECT`, `WHERE`, `IN` / `NOT IN`, `ORDER BY`, `DISTINCT`, campos calculados
- Junções: `INNER JOIN` e `LEFT JOIN` (incluindo achar registros sem correspondência)
- Subconsultas e funções: `MAX()`, `GETDATE()`, `CAST()`
