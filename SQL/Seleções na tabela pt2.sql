SELECT * FROM tbproduto WHERE PRODUTO = '544931';

#Se eu rodar esse comando, eu vou ter os cliente só do rio de janeiro.
SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro';

SELECT * FROM tbproduto WHERE SABOR = 'Cítricos';

#No comando where eu posso colocar qualquer campo que tenha na minha tabela, não precisa ser chave primaria.
#Pois com o where conseguimos fazer UPDATE muito mais elaborado.
UPDATE tbproduto SET SABOR = 'Cítricos' WHERE SABOR = 'Limão';