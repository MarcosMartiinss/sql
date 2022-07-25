
-- INSERINDO DADOS COM NOMES DOS ATRIBUTOS E SEM OS NOMES.
INSERT INTO Departamento (NumeroDepto, NomeDepto) VALUES (10, "Ciências Tecnológicas");
INSERT INTO Departamento VALUES (20, "Ciências da Saúde");
INSERT INTO Departamento VALUES (30, "Ciências Sociais");
INSERT INTO Departamento VALUES (40, "Ciências Exatas");
INSERT INTO Departamento VALUES (50, "Ciências Humanas");

INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Calors Silva", "carlos.silva@univ.br", 30);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Paula Ferreira", "paula.ferreira@univ.br", 10);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Antônio Branco", "antonio.branco@univ.br", 30);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Vânia Souza", "vania.souza@gmail.com", 20);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Lucas Pires", "lucas.pires@univ.br", 10);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Maria Rocha", "maria,rocha@gmail.com", 30);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Roberto Pacheco", "roberto.pacheco@univ.br", 40);
INSERT INTO Professor (NomeProfessor, EmailProfessor, NumeroDepto)
VALUES ("Daniel Cardoso", "daniel.cardoso@univ.br", 20);

INSERT INTO Telefone (NumeroTelefone, CodigoProfessor, TipoTelefone)
VALUES ("(11) 88670-5454", 1, "Celular");
INSERT INTO Telefone (NumeroTelefone, COdigoProfessor, TipoTelefone)
VALUES ("(11) 88345-3333", 1, "Residencial");
INSERT INTO Telefone (NumeroTelefone, CodigoProfessor, TipoTelefone)
VALUES ("(36) 88888-7888", 2, "Celular");
INSERT INTO Telefone (NumeroTelefone, COdigoPRofessor, TipoTelefone)
VALUES ("(22) 99999-9090", 5, "Celular");

INSERT INTO Projeto
VALUES (100, "O Ensino das Ciências Sociais no Brasil", "2021-05-22", NULL, 1000.00, 30);
INSERT INTO Projeto
VALUES (110, "Cultura e Gestão Financeira", "2020-01-10", "2021-02-05", 30000.00, 30);
INSERT INTO Projeto
VALUES (120, "Digitalização de Documentos Jurídicos", "2020-11-20", "2021-11-30", 15000.00, 10);
INSERT INTO Projeto
VALUES (130, "Aproveitamento Tecnológico de Produtos Vegetais", "2021-03-10", NULL, 20000.00, 10);
INSERT INTO Projeto
VALUES (140, "Atividade Física e Aspectos Fisiológicos", "2021-04-20", NULL, 12000.00, 20);
INSERT INTO Projeto
VALUES (150, "Biomecânica aplicada à Saúde", "2020-05-15", "2021-05-15", 20000.00, 20);
INSERT INTO Projeto
VALUES (160, "Modelagem Computacional para Engenharia", "2021-04-20", null, 15000.00, 40);
INSERT INTO Projeto
VALUES (170, "Modelos Estatísticos para Séries Temporais", "2021-06-10", NULL, 10000.00, 40); 

-- VISUALISANDO ATRIBUTOS SELECIONADOS
SELECT NumeroDepto, NomeDepto FROM Departamento;
SELECT CodigoProfessor, NomeProfessor, EmailProfessor, NumeroDepto FROM Professor;

-- VISUALISANDO TODOS OS ATRIBUTOS DE UMA SÓ VEZ
SELECT * FROM Departamento;
SELECT * FROM Professor;
SELECT * FROM Telefone;
SELECT * FROM Projeto;

-- VISUALIZANDO DATA NO FORMATO BRASILEIRO
SELECT NomeProjeto, DATE_FORMAT(DataInicioProjeto, "%d/%m/%Y") As Inicio FROM Projeto;

-- VIZUALIZANDO DADOS DE FORMA MAIS ESPECIFICA 
SELECT * FROM Professor WHERE NumeroDepto = 30;
SELECT * FROM professor WHERE NumeroDepto = 30 OR NumeroDepto = 10;
SELECT * FROM Projeto WHERE (NumeroDepto = 10 OR NumeroDepto = 30) AND ValorProjeto >= 15000.00;

-- QUANDO MEXEMOS COM VALORES NULOS, NÃO USAMOS O ATRIBUTO DE IGUALDADE "="
-- USAMOS O "IS NULL" PARA VALORES NULOS OU "IS NOT NULL" PARA VALORES NÃO NULOS
-- NESSE CASO QUEREMOS OS VALORES NÃO NULOS.
SELECT * FROM Projeto WHERE DataFimProjeto IS NOT NULL;

-- SOMANDO VALORES DOS PROJETOS QUE JA TERMINARAM
SELECT SUM(ValorProjeto) AS TOTAL FROM Projeto
WHERE DataFimProjeto IS NOT NULL;
-- CONTANDO O NUMERO DE PROJETOS QUE FALTA TERMINAR
SELECT COUNT(*) AS PROJETOS FROM Projeto WHERE DataFimProjeto IS NULL;
-- AGRUPANDO OS VALORES POR DEPARTAMENTO E DEPOIS FAZER AS SOMA DOS VALORES DE CADA GRUPO
-- Pág 95 a 97 Livro de banco de dados
SELECT SUM(ValorProjeto) AS TOTAL FROM Projeto GROUP BY NumeroDepto;
SELECT NumeroDepto, NomeProjeto, SUM(ValorProjeto) AS TOTAL FROM Projeto GROUP BY NumeroDepto;
-- ORDENANDO DE FORMA DECRESCENTE O VALOR DO PROJETO
-- O ORDER BY ORDENA COM BANE NUM ATRIBUTO COMO REFERENCIA 
SELECT NumeroDepto, NomeProjeto, SUM(ValorProjeto) AS TOTAL FROM Projeto GROUP BY NumeroDepto ORDER BY TOTAL DESC;

-- UTILIZANDO O COMANDO JOIN PARA FAZER JUNÇÃO DE TABELAS
-- AS TABELAS SERÃO PROJETO E DEPARTAMENTO
-- VAMOS FAZER UMA SELEÇÃO MOSTRANDO O ATRIBUTO NumeroDepto, NomeDepto e o VALOR SOMADO DOS PROJETOS POR DEPARTAMENTO
-- EXPLICAÇÃO Pág 101 do Livro de Banco de dados
SELECT P.NumeroDepto, D.NomeDepto, SUM(ValorProjeto) AS TOTAL
FROM Projeto P JOIN Departamento D ON D.NumeroDepto = P.NumeroDepto
GROUP BY NumeroDepto ORDER BY TOTAL DESC;

-- JUNTANDO 3 TABELAS DE UMA SÓ VEZ
SELECT  P.NomeProfessor, 
		P.EmailProfessor, 
		P.NumeroDepto, 
		D.NomeDepto, 
		T.NumeroTelefone, 
		T.TipoTelefone
FROM Professor P
JOIN Departamento D ON P.NumeroDepto = D.NumeroDepto
JOIN Telefone T ON P.CodigoProfessor = T.CodigoProfessor;

-- BUSCANDO DADOS DE TODOS OR PROFESSORES E OS TELEFONES CORRESPONDENTE
-- EXPLICAÇÃO Pág 105 do Livro De banco de dados
SELECT P.NomeProfessor,
		P.EmailProfessor,
		P.NumeroDepto,
		D.NomeDepto,
		T.NumeroTelefone,
		T.TipoTelefone
FROM Professor p
JOIN Departamento D ON P.NumeroDepto = D.NumeroDepto
LEFT JOIN Telefone T ON P.CodigoProfessor = T.CodigoProfessor
ORDER BY TipoTelefone DESC;

-- ALTERANDO REGISTRO DE UMA TABELA
UPDATE Professor SET EmailProfessor = "maria.rocha@gmail.com" WHERE CodigoProfessor = 7;
UPDATE Projeto SET NomeProjeto = "Biomecânica aplicada a Ciência da Saúde" WHERE NumeroProjeto = 150;
UPDATE Projeto SET DataFimProjeto = "2021-11-05" WHERE NumeroProjeto = 170;

-- DELETANDO REGISTRO DE UMA TABELA3
DELETE FROM Telefone WHERE IdTelefone =2;