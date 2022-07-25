
SELECT * FROM tbproduto;

SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;
SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007;
SELECT * FROM tbproduto WHERE PRECO_LISTA <= 16.009;

#esse comando é praticamente o BETWEEN, mas da para aplicar esse comando em varias situações.
SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

SELECT * FROM tbcliente;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';

#OR em ingles significa OU, é como na programação, mas nesse caso o sql vai mostrar os dois valores que você espeficicar, o comando a baixo ilustra muito bem isso.
SELECT * FROM tbcliente WHERE cidade = 'rio de Janeiro' OR BAIRRO = 'Jardins';


SELECT * FROM tbcliente WHERE (IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M') OR (CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins');

#Essas condições de filtro, eu posso estar usando no DELETE E NO UPDATE.