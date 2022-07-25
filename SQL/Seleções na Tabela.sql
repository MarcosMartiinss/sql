# o * é para ver todos os campos.
SELECT * FROM tbcliente;

# mas eu posso selecionar qual campo eu posso ver, caso eu não queira ver todos os campos.
SELECT CPF, NOME FROM tbcliente;

# o LIMIT ele tras o numero de registro que eu especifiquei.
SELECT CPF, NOME FROM tbcliente LIMIT 5;

#você da um nome fantasia para o campo.
SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

# não precisa selecionar na ordem da tabela.
SELECT NOME, CPF, SEXO, IDADE, DATA_NASCIMENTO FROM tbclienteq;