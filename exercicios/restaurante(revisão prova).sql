CREATE DATABASE restaurante;

USE restaurante

CREATE TABLE atendimento(
	codAtendimento INT PRIMARY KEY IDENTITY(1,1),
	situacao VARCHAR(30),
	DtHrChegada DATE,
	NroPessoas INT,
	NroMesa INT FOREIGN KEY REFERENCES mesa(NroMesa),
	CodGarcom INT FOREIGN KEY REFERENCES garcom(CodGarcom)
)

CREATE TABLE garcom(
	CodGarcom INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(30),
	CalcularComissao VARCHAR(10)
)

CREATE TABLE mesa(
	NroMesa INT PRIMARY KEY IDENTITY(1,1),
	Setor VARCHAR(10),
	Capacidade INT,
	Situacao VARCHAR(10)
)

CREATE TABLE produto(
	CodPro INT PRIMARY KEY IDENTITY(1,1),
	Descricao VARCHAR(30),
	Preco INT
)

CREATE TABLE consumo(
	CodCons INT PRIMARY KEY IDENTITY(1,1),
	Qtde INT,
	VlUnit INT,
	CodPro INT FOREIGN KEY REFERENCES produto(CodPro),
	CodAtendimento INT FOREIGN KEY REFERENCES atendimento(CodAtendimento)
)

SELECT * FROM atendimento
SELECT * FROM produto
SELECT * FROM garcom
SELECT * FROM mesa
SELECT * FROM consumo