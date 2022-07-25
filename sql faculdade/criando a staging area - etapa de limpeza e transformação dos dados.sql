CREATE DATABASE staging;
USE staging;

CREATE TABLE CLIENTE_ST (
CodigoCliente int, 
NomeCliente varchar(100),
TelefoneCliente varchar(30),
DataCarga timestamp NOT NULL
);

CREATE TABLE PRODUTO_ST (
CodigoProduto varchar(50),
DescricaoProduto varchar(70),
QtdeEstoqueProduto int,
PrecoProduto decimal (10, 2),
DataCarga timestamp NOT NULL
);

CREATE TABLE VENDA_ST (
DataVenda date,
CodigoVenda int,
CodigoProduto varchar(50),
CodigoCliente int,
QtdeVenda int,
ValorVenda decimal (10, 2),
StatusVenda varchar (100),
DataCarga timestamp NOT NULL
);

-- Eliminação dos dados da tabela CLIENTE_ST
TRUNCATE TABLE CLIENTE_ST;

-- Inserção dos dados na tabela CLIENTE_ST
INSERT INTO CLIENTE_ST 
SELECT CodigoCliente, NomeCliente, TelefoneCLiente, Now() FROM LEGADO.CLIENTE_LEG;

-- Eliminação dos dados da tabela PRODUTO_ST
TRUNCATE TABLE PRODUTO_ST;

-- Inserção dos dados na tabela PRODUTO_ST
INSERT INTO PRODUTO_ST 
SELECT CodigoProduto, DescricaoProduto, QtdeEstoqueProduto, PrecoProduto, Now() FROM LEGADO.PRODUTO_LEG;

-- Eliminação dos dados da tabela VENDA_ST
TRUNCATE TABLE VENDA_ST;

-- Inserção dos dados na tabela VENDA_ST
INSERT INTO VENDA_ST
SELECT PED.DataPedido, PED.NumeroPedido, ITEM.CodigoProduto, PED.CodigoCliente, ITEM.QtdePedido, ITEM.PrecoUnitario, PED.StatusPedido, Now()
FROM LEGADO.PEDIDO_LEG AS PED, LEGADO.ITENS_PEDIDO_LEG AS ITEM WHERE PED.NumeroPedido = ITEM.NumeroPedido;

SELECT * FROM VENDA_ST