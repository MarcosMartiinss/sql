USE sucos;

#Comando para alterar algum registro na tabela.
UPDATE tbproduto SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46
WHERE PRODUTO = 544931;

UPDATE tbproduto SET EMBALAGEM = 'Garrafa'
WHERE PRODUTO = 1078680;

SELECT * FROM tbproduto;