CREATE DATABASE REVISAO
USE REVISAO

CREATE TABLE garcom(
codGarcom INT PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(30),
calcularComiisao VARCHAR(10)
)

CREATE TABLE mesa (
nroMesa INT PRIMARY KEY IDENTITY(1,1),
setor VARCHAR(20),
capacidade INT,
situacao VARCHAR(20),
)
CREATE TABLE produto(
CodProduto INT PRIMARY KEY IDENTITY(1,1),
descricao VARCHAR (50),
preco INT 
)
CREATE TABLE atendimento(
CodAtendimento INT PRIMARY KEY IDENTITY(1,1),
situacao VARCHAR(30),
dthrChegada DATE,
nroPessoas INT,
codGarcom INT FOREIGN KEY REFERENCES garcom(codGarcom),
nroMesa INT FOREIGN KEY REFERENCES mesa(nroMesa),
)
CREATE TABLE consumo (
codCons INT PRIMARY KEY IDENTITY(1,1),
qtde INT,
vlUnit INT,
CodProduto INT FOREIGN KEY REFERENCES produto(CodProduto),
CodAtendimento INT FOREIGN KEY REFERENCES atendimento(CodAtendimento)
)

INSERT INTO mesa VALUES
('norte', 7,'cheia'),('sul', 10,'vazia'),('leste',4,'vazia'),('oeste',8,'cheia');

SELECT * FROM mesa

INSERT INTO produto VALUES 
('pinto de borracha helio',13), ('cu de borracha helio',14), ('pinto de borracha letro', 50000);

SELECT * FROM produto

INSERT INTO garcom VALUES
('Helio', 'nada'), ('letrao','100%')

SELECT * FROM garcom

INSERT INTO atendimento VALUES
('Atendendo', GETDATE(), 4,3,1),
('Atendendo', GETDATE(), 9,2,1);

SELECT * FROM atendimento

UPDATE garcom 
SET nome = 'letrao gostoso'
WHERE codGarcom = (
	SELECT MAX(codGarcom)FROM garcom
)

ALTER TABLE garcom ADD salario MONEY;

SELECT * FROM garcom

SELECT descricao, preco 
FROM produto 
ORDER BY preco DESC;

SELECT DISTINCT m.nroMesa, m.setor 
FROM mesa m
INNER JOIN atendimento a ON a.nroMesa = m.nroMesa
WHERE a.situacao = 'ATENDENDO';

UPDATE garcom 
SET salario = 1800 
WHERE codGarcom = 1;
UPDATE garcom 
SET salario = 1900 
WHERE codGarcom = 2;
UPDATE garcom 
SET salario = 2000 
WHERE codGarcom = 3;
UPDATE garcom 
SET salario = 2100 
WHERE codGarcom = 4;

SELECT * FROM garcom

SELECT nome, salario,
		salario * 1.15 AS salarioCom15
FROM garcom 
WHERE codGarcom = 4

INSERT INTO mesa VALUES ('helio beta', 5, 'vazia')

INSERT INTO atendimento VALUES ('ATENDENDO', GETDATE(), 3,4,5),('ATENDENDO', GETDATE(), 2,4,5)

SELECT * FROM atendimento

INSERT INTO consumo VALUES (10, 7, 1, 1), (5,2,1,2), (8,3,1,3)

SELECT * FROM produto 
WHERE CodProduto NOT IN (SELECT CodProduto FROM consumo)

SELECT atendimento.CodAtendimento, atendimento.dthrChegada, garcom.nome
	FROM atendimento 
	INNER JOIN garcom 
	ON garcom.codGarcom = atendimento.codGarcom
		WHERE atendimento.situacao = 'FINALIZADO'
			AND CAST(atendimento.dthrChegada AS DATE) = CAST(GETDATE() AS DATE)