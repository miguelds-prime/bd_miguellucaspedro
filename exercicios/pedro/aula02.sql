-- Aula 02 - Criando as tabelas
-- Enunciado: exercicios/enunciados/aula02-ddl.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador dele.
-- Nao apague os marcadores, nao troque a ordem.
-- Cada bloco roda num banco em branco: crie o que voce for usar.

-- ex1
CREATE TABLE LIVRO (
    id INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano INT,
    exemplares INT NOT NULL DEFAULT 1
);

INSERT INTO LIVRO (id, titulo, autor, ano, exemplares) 
VALUES (1, 'Dom Casmurro', 'diego', 1667, 3);

INSERT INTO LIVRO (id, titulo, autor, ano) 
VALUES (2, 'O Pequeno Príncipe', 'homer', 5697);

SELECT * FROM LIVRO;


-- ex2
CREATE TABLE LEITOR (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO LEITOR (id, nome) VALUES (1, 'Ana');
INSERT INTO LEITOR (id, nome) VALUES (2, 'Renato');
INSERT INTO LEITOR (id, nome) VALUES (3, 'Carla');

ALTER TABLE LEITOR ADD COLUMN telefone VARCHAR(30);

SELECT * FROM LEITOR;


-- ex3
CREATE TABLE EMPRESTIMO (
    id INT PRIMARY KEY,
    id_livro INT NOT NULL
);

INSERT INTO EMPRESTIMO (id, id_livro) VALUES (1, 1);
INSERT INTO EMPRESTIMO (id, id_livro) VALUES (2, 2);

ALTER TABLE EMPRESTIMO ADD COLUMN situacao VARCHAR(20) NOT NULL DEFAULT 'ativo';

SELECT * FROM EMPRESTIMO;


-- ex4
CREATE TABLE EDITORA (
    id INT PRIMARY KEY,
    nm VARCHAR(100) NOT NULL
);

INSERT INTO EDITORA (id, nm) VALUES (1, 'fazedora de livros');

ALTER TABLE EDITORA RENAME COLUMN nm TO nome;

SELECT * FROM EDITORA;


-- ex5
CREATE TABLE RASCUNHO (
    id INT PRIMARY KEY,
    texto VARCHAR(255)
);

INSERT INTO RASCUNHO (id, texto) VALUES (1, 'Primeira linha');
INSERT INTO RASCUNHO (id, texto) VALUES (2, 'Segunda linha');
INSERT INTO RASCUNHO (id, texto) VALUES (3, 'Terceira linha');

DELETE FROM RASCUNHO;

SELECT * FROM RASCUNHO;

DROP TABLE RASCUNHO;


-- ex6
CREATE TABLE LIVRO (
    id INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL
);

CREATE TABLE LEITOR (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE EMPRESTIMO (
    id_livro INT NOT NULL,
    id_leitor INT NOT NULL,
    data_saida VARCHAR(10) NOT NULL,
    data_volta VARCHAR(10),
    PRIMARY KEY (id_livro, id_leitor, data_saida),
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id),
    FOREIGN KEY (id_leitor) REFERENCES LEITOR(id)
);

INSERT INTO LIVRO (id, titulo) VALUES (1, '1945');
INSERT INTO LEITOR (id, nome) VALUES (1, 'Marina');

INSERT INTO EMPRESTIMO (id_livro, id_leitor, data_saida) 
VALUES (1, 1, '2026-05-10');

INSERT INTO EMPRESTIMO (id_livro, id_leitor, data_saida) 
VALUES (1, 1, '2026-05-15');

/* 
   INSERT INTO EMPRESTIMO (id_livro, id_leitor, data_saida) 
   VALUES (1, 1, '2026-05-10');

   Porque ele está repetindo exatamente o livro, leitor
   e data do primeiro empréstimo que já está salvo ali em cima.
   A chave primária composta proíbe 
   exatamente que a mesma pessoa pegue o mesmo livro duas vezes no mesmo dia.

*/