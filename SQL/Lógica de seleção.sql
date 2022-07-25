
SELECT * FROM tbcliente;

# = igual a 22
SELECT * FROM tbcliente WHERE IDADE = 22;

# > maior que 22
SELECT * FROM tbcliente WHERE IDADE > 22;

# < menor que 22
SELECT * FROM tbcliente WHERE IDADE < 22;

# <= menor igual a 22
SELECT * FROM tbcliente WHERE IDADE <= 22;

# <> diferente de 22
SELECT * FROM tbcliente WHERE IDADE <> 22;

# no mysql a ordem de texto é o alfabeto, A < B < C < F < ...
SELECT * FROM tbcliente WHERE NOME > 'Fernando Cavalcante';

SELECT * FROM tbproduto;

# não funciona o = 'igual' em numeros float, para funcionar deveria usar os numeros inteiros.
SELECT * FROM tbproduto WHERE PRECO_LISTA = 16.008;

#Com o comando BETWEEN você pega o limite inferior e superior e o comando retorna a informação entre esses dois extremos.
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;