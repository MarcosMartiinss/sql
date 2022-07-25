CREATE DATABASE Legado;
USE LEGADO;

CREATE TABLE Cliente_leg (
CodigoCliente int NOT NULL AUTO_INCREMENT,
NomeCliente varchar(100) NOT NULL,
TelefoneCliente varchar(30) NOT NULL,
CONSTRAINT PK_COD_CLIENTE PRIMARY KEY (CodigoCLiente)
);

CREATE TABLE Pedido_leg (
NumeroPedido int NOT NULL AUTO_INCREMENT,
DataPedido DATE NOT NULL,
DataPagtoPedido DATE,
StatusPedido varchar(100) NOT NULL,
CodigoCLiente int NOT NULL,
CONSTRAINT PK_NUM_PEDIDO PRIMARY KEY (NumeroPedido),
CONSTRAINT FK_COD_CLIENTE FOREIGN KEY (CodigoCliente) REFERENCES Cliente_leg (CodigoCliente)
);

CREATE TABLE Produto_leg(
CodigoProduto varchar(50) NOT NULL,
DescricaoProduto varchar(70) NOT NULL,
QtdeEstoqueProduto int NOT NULL,
PrecoProduto decimal(10, 2) NOT NULL,
CONSTRAINT PK_COD_PRODUTO PRIMARY KEY (CodigoProduto)
);

CREATE TABLE Itens_Pedido_Leg (
NumeroPedido int NOT NULL,
CodigoProduto varchar(50) NOT NULL,
QtdePedido int NOT NULL,
PrecoUnitario decimal (10, 2) NOT NULL,
CONSTRAINT PK_NUM_COD_PEDIDO PRIMARY KEY (NumeroPedido, CodigoProduto),
CONSTRAINT FK_NUM_PEDIDO FOREIGN KEY (NumeroPedido) REFERENCES Pedido_leg (NumeroPedido),
CONSTRAINT FK_COD_PRODUTO FOREIGN KEY (CodigoProduto) REFERENCES Produto_leg (CodigoProduto)
);


-- Inserção dos dados na tabela CLIENTE_LEG
INSERT INTO CLIENTE_LEG (CodigoCLiente, NomeCLiente, TelefoneCLiente) VALUES (11, 'Lucas MArtins', '(44) 84675-4576');
INSERT INTO CLIENTE_LEG (CodigoCliente, NomeCLiente, TelefoneCliente) VALUES (12, 'Paula Silva', '(33) 87567-1123');
INSERT INTO CLIENTE_LEG VALUES (13, 'Marcela Nunes', '(22) 98765-6666');
INSERT INTO CLIENTE_LEG VALUES (14, 'Rodrigo Santos', '(88) 12345-1234');
INSERT INTO CLIENTE_LEG VALUES (15, 'Marta Pires', '(66) 54321-5432');
INSERT INTO CLIENTE_LEG VALUES (16, 'Marcos Martins', '(17) 99150-2298');
INSERT INTO CLIENTE_LEG VALUES (17, 'Pedro Zago', '(17) 99451-1234');
INSERT INTO CLIENTE_LEG VALUES (18, 'Maria Cecilia', '(17) 99702-7662');
INSERT INTO CLIENTE_LEG VALUES (19, 'Leonardo Zago', '(17) 99874-6589');

-- Inserção dos dados na tabela PRODUTO_LEG
INSERT INTO PRODUTO_LEG (CodigoProduto, DescricaoProduto, QtdeEstoqueProduto, PrecoProduto) VALUES ('p001-1', 'Leite Integral', 100, 5.50);
INSERT INTO PRODUTO_LEG VALUES ('p002-f', 'Farinha de Trigo', 200, 3.80);
INSERT INTO PRODUTO_LEG VALUES ('p003-m', 'Macarrão', 80, 6.40);
INSERT INTO PRODUTO_LEG VALUES ('p004-g', 'Arroz', 130, 4.00);
INSERT INTO PRODUTO_LEG VALUES ('p005-g', 'Feijão Preto', 160, 3.90);
INSERT INTO PRODUTO_LEG VALUES ('p006-l', 'Manteiga', 50, 7.30);

-- Inserção dos dados na tabela PEDIDO_LEG
INSERT INTO PEDIDO_LEG (NumeroPedido, DataPedido, DataPagtoPedido, StatusPedido, CodigoCliente) VALUES (1, '2021-04-10', '2021-04-10', 'Pago', 11);
INSERT INTO PEDIDO_LEG VALUES (2, '2021-06-15', '2021-07-10', 'Pago', 11);
INSERT INTO PEDIDO_LEG VALUES (3, '2021-11-22', null, 'Não Pago', 12);
INSERT INTO PEDIDO_LEG VALUES (4, '2021-11-13', '2021-11-13', 'Pago', 12);
INSERT INTO PEDIDO_LEG VALUES (5, '2021-11-18', '2021-11-18', 'Pago', 16);
INSERT INTO PEDIDO_LEG VALUES (6, '2022-01-14', '2022-01-14', 'Pago', 14);
INSERT INTO PEDIDO_LEG VALUES (7, '2022-01-23', null, 'Não Pago', 17);

-- Inserção dos dados na tabela ITENS_PEDIDO_LEG
INSERT INTO ITENS_PEDIDO_LEG (NumeroPEdido, CodigoProduto, QtdePedido, PrecoUnitario) VALUES (1, 'p001-1', 10, 5.50);
INSERT INTO ITENS_PEDIDO_LEG (NumeroPedido, CodigoProduto, QtdePedido, PrecoUnitario) VALUES (1, 'p006-l', 2, 7.30);
INSERT INTO ITENS_PEDIDO_LEG VALUES (1, 'p003-m', 1, 6.40);
INSERT INTO ITENS_PEDIDO_LEG VALUES (2, 'p001-1', 3, 5.50);
INSERT INTO ITENS_PEDIDO_LEG VALUES (2, 'p002-f', 1, 3.80);
INSERT INTO ITENS_PEDIDO_LEG VALUES (3, 'p004-g', 5, 4.00);
INSERT INTO ITENS_PEDIDO_LEG VALUES (3, 'p005-g', 2, 3.90);
INSERT INTO ITENS_PEDIDO_LEG VALUES (4, 'p003-m', 1, 6.40);
INSERT INTO ITENS_PEDIDO_LEG VALUES (4, 'p004-g', 1, 4.00);