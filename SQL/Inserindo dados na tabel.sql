USE SUCOS;

#COMANDO PARA INSERIR DADOS NA TABELA
INSERT INTO tbproduto (
	PRODUTO,
	NOME,
	EMBALAGEM,
	TAMANHO,
	SABOR,
    #A ordem da coluna Insert into, não tem importancia
    #Mas a ordem do comando VALUES têm, a ordem te que ser a mesma do comando
    #Insert into.
	PRECO_LISTA) VALUES ('1037797', 'Clean - 2 Litros - Laranja',
    'PET', '2 Litros', 'Laranja', 16.01);
INSERT INTO tbproduto (
	PRODUTO,
	NOME,
	EMBALAGEM,
	TAMANHO,
	SABOR,
	PRECO_LISTA) VALUES ('1000889', 'Sabor da Montanha - 700 ml - Uva',
    'Garrafa', '700 ml', 'Uva', 6.31);
INSERT INTO tbproduto (
	PRODUTO,
	NOME,
	EMBALAGEM,
	TAMANHO,
	SABOR,
	PRECO_LISTA) VALUES ('1004327', 'Videira do Campo - 1,5 Litros - Melância',
    'PET', '1,5 Litros', 'Melância', 19.51);

#para verificar se os dados foram inseridos, use o comando a baixo e NÃO ESQUECA DE 
#SELECIONAR A LINHA. pois se você não selecionar, vai rodar todos os códigos da pagina.
SELECT * FROM tbproduto;

