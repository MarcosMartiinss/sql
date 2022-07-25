-- Criação do banco de dados dw
CREATE DATABASE DW;
USE DW;

-- Criação da tabela dimensão "DIM_CLIENTE"
CREATE TABLE DIM_CLIENTE (
sk_cliente int NOT NULL AUTO_INCREMENT,
nk_cliente int NOT NULL,
NomeCLiente varchar(100) NOT NULL,
TelefoneCliente varchar(30) NOT NULL,
DataCarga timestamp NOT NULL,
CONSTRAINT dim_cliente_pk PRIMARY KEY (sk_cliente)
);

-- Criação da tabela dimensão DIM_PRODUTO
CREATE TABLE DIM_PRODUTO (
sk_produto int NOT NULL AUTO_INCREMENT,
nk_produto varchar(50) NOT NULL,
DescricaoProduto varchar(70) NOT NULL,
PrecoProduto decimal (10, 2) NOT NULL,
QtdeEstoqueProduto int NOT NULL,
DataCarga timestamp NOT NULL,
CONSTRAINT dim_produto_pk PRIMARY KEY (sk_produto)
);

drop table dim_tempo;
-- Criação da tabela dimensão DIM_TEMPO
CREATE TABLE DIM_TEMPO (
sk_tempo int NOT NULL,
DataTempo date NOT NULL,
AnoTempo int NOT NULL,
MesTempo int NOT NULL,
DiaTempo int NOT NULL,
FinalSemana char(1) NOT NULL,
DataCarga timestamp NOT NULL,
CONSTRAINT sk_tempo_pk PRIMARY KEY (sk_tempo)
);

drop table fato_venda;
-- Criação da tabela fato FATO_VENDA
CREATE TABLE FATO_VENDA (
sk_tempo int NOT NULL,
sk_cliente integer NOT NULL,
sk_produto integer NOT NULL,
QtdeVenda integer NOT NULL,
VlrVendaUnitario decimal (10, 2) NOT NULL,
VlrVendaTotal decimal (10, 2) NOT NULL,
StatusVenda varchar(100) NOT NULL,
DataCarga timestamp NOT NULL,
CONSTRAINT fato_venda_pk PRIMARY KEY (sk_tempo, sk_cliente, sk_produto),
CONSTRAINT fato_venda_dim_cliente_fk FOREIGN KEY (sk_cliente) REFERENCES DIM_CLIENTE(sk_cliente),
CONSTRAINT fato_venda_dim_produto_fk FOREIGN KEY (sk_produto) REFERENCES DIM_PRODUTO(sk_produto),
CONSTRAINT fato_venda_dim_tempo_fk FOREIGN KEY (sk_tempo) REFERENCES DIM_TEMPO(sk_tempo)
);

-- Inserção dos dados na tabela DIM_CLIENTE
INSERT INTO DIM_CLIENTE (nk_cliente, NomeCLiente, TelefoneCLiente, DataCarga)
SELECT CodigoCliente, NomeCliente, TelefoneCliente, now() FROM STAGING.CLIENTE_ST;

-- Inserção dos dados na tabela DIM_PRODUTO
INSERT INTO DIM_PRODUTO (nk_produto, DescricaoProduto, QtdeEstoqueProduto, PrecoProduto, DataCarga)
SELECT CodigoProduto, DescricaoProduto, QtdeEstoqueProduto, PrecoProduto, now() FROM STAGING.PRODUTO_ST;

-- Inserção dos dados na tabela DIM_TEMPO
INSERT INTO DIM_TEMPO (sk_tempo, DataTempo, AnoTempo, MesTempo, DiaTempo, FinalSemana, DataCarga)
VALUES (20210410, '2021-04-10', 2021, 04, 10, 'N', now());
INSERT INTO DIM_TEMPO (sk_tempo, DataTempo, AnoTempo, MesTempo, DiaTempo, FinalSemana, DataCarga)
VALUES (20210615, '2021-06-15', 2021, 06, 15, 'N', now());
INSERT INTO DIM_TEMPO (sk_tempo, DataTempo, AnoTempo, MesTempo, DiaTempo, FinalSemana, DataCarga)
VALUES (20211122, '2021-11-22', 2021, 11, 22, 'N', now());
INSERT INTO DIM_TEMPO (sk_tempo, DataTempo, AnoTempo, MesTempo, DiaTempo, FinalSemana, DataCarga)
VALUES (20211113, '2021-11-13', 2021, 11, 13, 'N', now());

-- Inserção de dados na tabela FATO_VENDA
INSERT INTO FATO_VENDA
SELECT date_format(VENDA.DataVenda, "%Y%m%d") as sk_tempo, DIM_CLIENTE.sk_cliente, DIM_PRODUTO.sk_produto, 
VENDA.QtdeVenda,
VENDA.ValorVenda,
VENDA.QtdeVenda * VENDA.ValorVenda as ValorTotal,
VENDA.StatusVenda,
now()
FROM STAGING.VENDA_ST AS VENDA
LEFT JOIN DIM_CLIENTE ON VENDA.CodigoCLiente = DIM_CLIENTE.nk_cliente LEFT JOIN DIM_PRODUTO ON VENDA.CodigoProduto = DIM_PRODUTO.nk_produto;