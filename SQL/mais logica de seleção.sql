
SELECT * FROM tbcliente;

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO = '1995-01-13';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > '1995-01-13';

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO < '1995-01-13';

#Com essa seleção eu ó trago os registro do ano que eu especifiquei.
SELECT * FROM tbcliente WHERE YEAR(DATA_NASCIMENTO) = 1995;

SELECT * FROM tbcliente WHERE MONTH(DATA_NASCIMENTO) = 10;