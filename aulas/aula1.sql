CREATE DATABASE aula1
GO
USE aula1
GO

--cadastre a tabela categorias e a tabela produtos, sendo que a tabela produtos deve ter uma chave estrangeira para a tabela categorias
CREATE TABLE categorias(
    codCat INT PRIMARY KEY IDENTITY(1,1),
    nomeCat VARCHAR(50)
)

CREATE TABLE produtos(
    codPro INT PRIMARY KEY IDENTITY(1,1),
    descricao VARCHAR(100),
    codBarras VARCHAR(30),
    estoque INT,
    preco MONEY NULL,
    codCat INT FOREIGN KEY REFERENCES categorias(codCat)
)
GO

--cadastre 5 categorias e 8 produtos, preenchendo todos os campos das tabelas
INSERT INTO categorias VALUES 
('Bebidas'),
('Alimentos'),
('Higiene'),
('Limpeza'),
('Eletrônicos')

INSERT INTO produtos (descricao, codBarras, estoque, preco, codCat) VALUES 
('Coca-Cola 2L', '1234567890123', 50, 3.99, 1),
('Pepsi 2L', '1234567890124', 30, 3.49, 1),
('Arroz 5kg', '1234567890125', 100, 2.59, 2),
('Sabão em pó 1kg', '1234567890126', 40, 5.49, 4),
('Shampoo 500ml', '1234567890127', 25, 6.99, 3),
('Detergente 500ml', '1234567890128', 60, 4.29, 4),
('Televisão 32"', '1234567890129', 10, 1599.99, 5),
('Notebook i5', '1234567890130', 5, 2799.99, 5)

--altere o estoque do produto de codigo 4 o estoque deve ser 350

UPDATE produtos 
SET estoque = 350 
WHERE codPro = 4

--liste a descrição e estoque dos produtos que possuem estoque maior que 500

SELECT descricao, estoque 
FROM produtos 
WHERE estoque > 500

--exclua os produtos da categoria de codigo 3

DELETE FROM produtos 
WHERE codCat = 3

--cadastre um novo produto sem preencher o codigo de barras

INSERT INTO produtos (descricao, estoque, codCat) 
VALUES ('celular', 100, 5)

--exclua a coluna codBarras 

ALTER TABLE produtos
DROP COLUMN codBarras
GO

--liste a descrição e os estoques dos produtos em ordem decrescente de estoque

SELECT descricao, estoque 
FROM produtos 
ORDER BY estoque DESC

--crie uma nova coluna para guardar o preço unitario dos produtos

IF COL_LENGTH('produtos','preco') IS NULL
BEGIN
    ALTER TABLE produtos
    ADD preco MONEY NULL
END
GO

--exclua os produtos cujas categorias sejam dos codigos 1, 3 ou 5

DELETE FROM produtos
WHERE codCat IN (1, 3, 5)

--atualize cada preço unitario dos produtos (não deixe todos com o mesmo preço)

UPDATE produtos SET preco = 1.99 WHERE codPro = 1
UPDATE produtos SET preco = 2.49 WHERE codPro = 2
UPDATE produtos SET preco = 3.99 WHERE codPro = 3
UPDATE produtos SET preco = 4.99 WHERE codPro = 4
UPDATE produtos SET preco = 5.99 WHERE codPro = 5

--liste a descrição dos produtos e os nomes das categorias que eles pertencem, faça um inner join entre as tabelas produtos e categorias

SELECT P.descricao, C.nomeCat
FROM produtos AS P INNER JOIN categorias AS C ON P.codCat = C.codCat

--liste as categorias que não possuem produtos vinculados a ele

SELECT *
FROM categorias AS c
LEFT JOIN produtos AS p
    ON p.codCat = c.codCat
WHERE p.codCat IS NULL;

--Reajustar o preço unitário dos produtos com estoque menor que 400
UPDATE produtos
SET preco = preco + preco * 0.05
WHERE estoque < 400

select * from produtos
select * from categorias

--FUNÇÕES DE AGREGAÇÃO:
--MAX = retorna o valor maximo 
SELECT MAX(estoque) AS maiorEstoque
FROM produtos

--MIN = retorna o valor minimo
SELECT MIN(estoque) AS menorEstoque
FROM produtos

--SUM = retorna a soma dos valores
SELECT SUM(preco) AS somaPrecos
FROM produtos

SELECT SUM(estoque * preco) AS valorTotalEstoque
FROM produtos

-- AVG - Calcula a media
select AVG(preco) as PrecoMedio
FROM Produtos;

-- ROUND = Funcao de arredondamento. ROUND(num, numero da casa depois da virgula que vai começar a arredondar dela para a direita). Se colocar 0 no segundo parametro ele arredonda o numero todo.
select ROUND(1235.532, 1) as precoMedio;

select ROUND(AVG(preco), 2) as precoMedio
from Produtos;

--COUNT = retorna a quantidade de registros
SELECT COUNT(codCat) AS contagem
FROM produtos

SELECT COUNT(*) AS contagem
FROM produtos

--SUBTRAÇÃO NO SELECT:
SELECT COUNT(*) - COUNT(codCat) AS totalSemCategoria
FROM produtos

--MULTIPLICAÇÃO PARA CRIAR CAMPO CALCULADO:
--Qual seria o novo preço dos produtos se aplicasse 10% de acréscimo ?
SELECT descricao, preco, preco * 1.10 AS precoReajustado
FROM produtos

--OUTRAS FUNÇÕES IMPORTANTES:
--DISTINCT = selecionar linhas exclusivas

SELECT DISTINCT(codCat) as categoriasProdutos
FROM Produtos;

