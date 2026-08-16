CREATE DATABASE clinicaVet
GO
USE clinicaVet
GO

CREATE TABLE Veterinario(
    codMed INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50),
    DataNasc DATE,
)
CREATE TABLE Animal(
    codPac INT PRIMARY KEY IDENTITY(1,1),
    NomeAnimal VARCHAR(50),
    especie VARCHAR(50),
)
CREATE TABLE Consulta(
    CodConsulta INT PRIMARY KEY IDENTITY(1,1),
    codMed INT FOREIGN KEY REFERENCES Veterinario(codMed),
    codPac INT FOREIGN KEY REFERENCES Animal(codPac),
    DataConsulta DATE,
    Valor MONEY
)

--1. Cadastrar 5 médicos (veterinários) para esta clínica 
INSERT INTO Veterinario VALUES 
('Dr. João', '1980-05-15'),
('Dra. Maria', '1975-08-22'),
('Dr. Carlos', '1990-12-10'),
('Dra. Ana', '1985-03-05'),
('Dr. Pedro', '1978-11-30')

--2. Cadastrar 10 pacientes (animais) para a clínica de pelo menos 3 espécies diferentes
INSERT INTO Animal VALUES
('Rex', 'Cão'),
('Miau', 'Gato'),
('Bolinha', 'Cão'),
('Whiskers', 'Gato'),
('Poli', 'Papagaio'),
('Max', 'Cão'),
('Luna', 'Gato'),
('Tweety', 'Papagaio'),
('Thor', 'Cão'),
('Simba', 'Gato')

---3. Cadastre 20 consultas para estes médicos e pacientes com datas e valores diferentes
INSERT INTO Consulta VALUES
(1, 1, '2026-01-05', 150.00),
(2, 2, '2026-01-08', 200.00),
(3, 3, '2026-01-10', 175.50),
(4, 4, '2026-01-12', 220.00),
(5, 5, '2026-01-15', 180.00),
(1, 6, '2026-01-18', 160.00),
(2, 7, '2026-01-20', 190.00),
(3, 8, '2026-01-22', 210.00),
(4, 9, '2026-01-25', 170.00),
(5, 10, '2026-01-28', 185.00),
(1, 1, '2026-02-02', 150.00),
(2, 2, '2026-02-05', 205.00),
(3, 4, '2026-02-08', 195.00),
(4, 5, '2026-02-10', 225.00),
(5, 6, '2026-02-12', 175.00),
(1, 7, '2026-02-15', 165.00),
(2, 8, '2026-02-18', 215.00),
(3, 9, '2026-02-20', 180.00),
(4, 10, '2026-02-22', 230.00),
(5, 3, '2026-02-25', 190.00) 

--1 Selecione o maior valor pago por uma consulta 
SELECT MAX(valor) AS ConsultaMaisCara 
FROM Consulta

--2 Selecione o valor médio, maior valor e menor valor das consultas realizadas no mês passado 
SELECT AVG(valor), MIN(valor), MAX(valor)
FROM Consulta
WHERE dataConsulta BETWEEN '2026-01-01' AND '2026-01-31'

--3 Cadastre uma nova consulta para um paciente que já está cadastrado 
INSERT INTO Consulta VALUES (3, 7, '2026-03-01', 195.00)

--4 Atualize o nome do médico cujo código é 3 para o seu nome
UPDATE Veterinario 
SET Nome = 'Gabriel' 
WHERE codMed = 3

--5 Selecione as espécies de pacientes que estão cadastrados
SELECT DISTINCT especie 
FROM Animal

--6 Quantas consultas você já realizou nesta clínica?
SELECT COUNT(*) AS MinhasConsultas
FROM Consulta
WHERE codMed = 3

--7 Quantas consultas foram feitas por todos os médicos?
SELECT COUNT(*) AS TotalConsultas
FROM Consulta

--8 Selecione, de forma exclusiva, as espécies de pacientes que estão cadastrados.
SELECT DISTINCT especie
FROM Animal

--9 Liste os nomes dos pacientes em ordem alfabética.
SELECT NomeAnimal
FROM Animal
ORDER BY NomeAnimal

--10 Qual o valor total de todas as consultas feitas por você?
SELECT SUM(Valor) AS TotalMeuFaturamento
FROM Consulta
WHERE codMed = 3

--11 Qual a quantidade de médicos que esta clínica possui?
SELECT COUNT(*) AS QtdMedicos
FROM Veterinario

--12 Quanto seria o total das consultas que você realizou se estas consultas tivessem um aumento de 10%?
SELECT SUM(Valor * 1.10) AS TotalCom10PorCento
FROM Consulta
WHERE codMed = 3

--13 Quantas consultas foram feitas por você entre os dias 01/01/2026 e 31/03/2026?
SELECT COUNT(*) AS ConsultasNoPeriodo
FROM Consulta
WHERE codMed = 3
  AND DataConsulta BETWEEN '2026-01-01' AND '2026-03-31'