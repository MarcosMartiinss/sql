CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;

CREATE TABLE Departamento (
NumeroDepto int,
NomeDepto varchar(40)
);

CREATE TABLE Projeto (
NumeroProjeto int,
NomeProjeto varchar(50),
DataInicioProjeto date,
DataFimProjeto date,
ValorProjeto decimal(10, 2),
NumeroDepto int
);

-- COLOCANDO CHAVE PRIMARIA NO NumeroDepto
-- CONSTRAINT SIGNIFICA RESTRIÇÕES, MAS O PROPRIO ATO DE COLOCAR UMA DEFINIÇÃO EM UM ATRIBUTO, JA CAUSA UMA RESTRIÇÃO.
ALTER TABLE universidade.departamento
ADD CONSTRAINT PK_DEPTO PRIMARY KEY (NumeroDepto);

-- Colocando restrições em outros atributos (colunas)
ALTER TABLE universidade.departamento MODIFY NomeDepto VARCHAR(40) NOT NULL;

-- DESCREVENDO A TABELA, MOSTRANDO TIPOS DE DADOS, VALROES ETC.
DESC universidade.departamento;

-- EXCLUINDO TABELA
DROP TABLE universidade.telefone;

-- Criando uma tabela com as restrições
-- REFERENCES SIGNIFICA REFERENCIAR UM ATRIBUTO DA TABELA PARA OUTRA TABELA, EX: REFERENCIANDO NumeroDepto da TABELA PROJETO com A TABELA Departamento
CREATE TABLE universidade.Projeto (
NumeroProjeto int NOT NULL,
NomeProjeto varchar(50) NOT NULL,
DataInicioProjeto date NOT NULL,
DataFimProjeto date,
ValorProjeto decimal(10, 2) NOT NULL,
NumeroDepto int NOT NULL,
CONSTRAINT PK_PROJ PRIMARY KEY (NumeroProjeto),
CONSTRAINT FK_PROJ_DEPTO FOREIGN KEY (NumeroDepto) REFERENCES Departamento (NumeroDepto)
);

-- MOSTRANDO AS TABELAS DO BANCO DE DADOS
SHOW TABLES;

-- CRIANDO UMA PK AUTOINCREMENTADA 
-- AUTO_INCREMENT serve para o SGBD auto inumerar a coluna
-- isso serve no caso se o projeto não tiver um padrão de numeração
CREATE TABLE CURSO (
NumeroCurso int NOT NULL AUTO_INCREMENT,
NomeCurso varchar(50) NOT NULL,
CargaHorariaCurso int NOT NULL,
CreditosCurso int NOT NULL,
CONSTRAINT PK_CURSO PRIMARY KEY (NumeroCurso)
);

CREATE TABLE professor (
CodigoProfessor int NOT NULL AUTO_INCREMENT,
NomeProfessor varchar(100) NOT NULL,
EmailProfessor varchar(150) NOT NULL,
NumeroDepto int NOT NULL,
CONSTRAINT PK_PROF PRIMARY KEY (CodigoProfessor),
CONSTRAINT FK_PROF_DEPTO FOREIGN KEY (NumeroDepto) REFERENCES Departamento (NumeroDepto)
);

-- CRIANDO UMA TABELA SEM UM ATRIBUTO E DPS VAMOS USAR O ALTER TABLE PARA ADICIONAR ESSE ATRIBUTO
CREATE TABLE Telefone (
IdTelefone int NOT NULL AUTO_INCREMENT,
NumeroTelefone varchar(30) NOT NULL,
CodigoProfessor int NOT NULL,
TipoTelefone varchar(100) NOT NULL,
CONSTRAINT PK_FONE PRIMARY KEY (IdTelefone),
CONSTRAINT FK_FONE_PROF FOREIGN KEY (CodigoProfessor) REFERENCES Professor (CodigoProfessor)
);

ALTER TABLE Telefone ADD TipoTelefone varchar(20) NOT NULL;
DESC universidade.Telefone;
-- EXCLUINDO UM ATRIBUTO
ALTER TABLE Telefone DROP COLUMN TipoTelefone;

CREATE TABLE Disciplina (
CodigoDisciplina int NOT NULL AUTO_INCREMENT,
NomeDisciplina varchar(100) NOT NULL,
CreditosDisciplina int NOT NULL, 
NumeroDepto int NOT NULL,
CONSTRAINT PK_DISCI PRIMARY KEY (CodigoDisciplina),
CONSTRAINT FK_DISCI_DEPTO FOREIGN KEY (NumeroDepto) REFERENCES Departamento (NumeroDepto)
);

CREATE TABLE curriculo (
CodigoDisciplina int NOT NULL,
NumeroCurso int NOT NULL,
CONSTRAINT PFK_DISCI FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplina (CodigoDisciplina),
CONSTRAINT PFK_CURSO FOREIGN KEY (NumeroCurso) REFERENCES Curso (NumeroCurso)
);

CREATE TABLE Turma (
SemestreTurma int NOT NULL,
CodigoDisciplina int NOT NULL,
HorarioTurma varchar(50) NOT NULL,
SalaTurma int NOT NULL,
CodigoProfessor int NOT NULL,
CONSTRAINT PK_TURMA PRIMARY KEY (SemestreTurma),
CONSTRAINT PFK_DISCIPLINA FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplina (CodigoDisciplina),
CONSTRAINT FK_PROF FOREIGN KEY (CodigoProfessor) REFERENCES Professor (CodigoProfessor)
);

CREATE TABLE Aluno (
MatriculaAluno int NOT NULL,
NomeAluno varchar(150) NOT NULL,
EnderecoAluno varchar(150) NOT NULL,
NumeroEndAluno int NOT NULL,
CEPAluno int NOT NULL,
ComplementoEndAluno varchar(150) NOT NULL,
EmailAluno varchar(150) NOT NULL,
TelefoneAluno varchar(20) NOT NULL,
NumeroAluno int NOT NULL,
CONSTRAINT PK_ALUNO PRIMARY KEY (MatriculaAluno)
);

CREATE TABLE Matricula (
MatriculaAluno int NOT NULL,
SemestreTurma int NOT NULL,
CodigoDisciplina int NOT NULL,
CONSTRAINT FK_MATRI_ALUNO FOREIGN KEY (MatriculaAluno) REFERENCES Aluno (MatriculaAluno),
CONSTRAINT FK_SEMES_TURMA FOREIGN KEY (SemestreTurma) REFERENCES Turma (SemestreTurma),
CONSTRAINT FK_CODIGO_DISCI FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplina (CodigoDisciplina)
);