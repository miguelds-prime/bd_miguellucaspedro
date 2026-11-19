-- Aula 03 - O dado entra, e o banco discute
-- Enunciado: exercicios/enunciados/aula03-dml.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador.
-- Comece CADA bloco com: PRAGMA foreign_keys = ON;
-- Os blocos rodam sobre o banco da secretaria ja carregado.

-- ex1
PRAGMA foreign_keys = ON;

INSERT INTO TURMA (id, nome, turno) VALUES (4, '1J', 'noite');
INSERT INTO ALUNO (id, nome, id_turma)VALUES (11, 'Lucas Pereira', 4);
INSERT INTO ALUNO (id, nome, id_turma) VALUES (12, 'Mariana Costa', 4);


-- ex2
PRAGMA foreign_keys = ON;

-- INSERT INTO ALUNO (id, nome, id_turma) VALUES (13, 'Pedro Henrique', 99);
-- Mensagem devolvida pelo banco: Runtime error: FOREIGN KEY constraint failed (19)

INSERT INTO ALUNO (id, nome, id_turma) VALUES (13, 'Pedro Henrique', 4);


-- ex3
PRAGMA foreign_keys = ON;

SELECT * FROM INSCRICAO WHERE id_aluno = 3 AND id_modalidade = 2;
UPDATE INSCRICAO SET situacao = 'ativa' WHERE id_aluno = 3 AND id_modalidade = 2;


-- ex4
PRAGMA foreign_keys = ON;

SELECT * FROM ALUNO WHERE id = 10;
UPDATE ALUNO SET id_turma = 2 WHERE id = 10;

-- UPDATE errado: UPDATE ALUNO SET id_turma = 2;
-- Pegaria todas as linhas da tabela ALUNO.


-- ex5
PRAGMA foreign_keys = ON;

-- apagar a turma 1: DELETE FROM TURMA WHERE id = 1;
-- O banco recusou o comando com erro de chave estrangeira (FOREIGN KEY constraint failed) porque existem alunos vinculados à turma 1.

-- Apagando o aluno 10: DELETE FROM ALUNO WHERE id = 10;
-- O banco permite apagar o aluno 10 porque não existe nenhum registro em outras tabelas (como INSCRICAO) apontando para ele.


-- ex6
PRAGMA foreign_keys = ON;

-- Par A: ON DELETE RESTRICT
CREATE TABLE PAI_A (
    id INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL
);
CREATE TABLE FILHO_A (
    id INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL, 
    id_pai INTEGER REFERENCES PAI_A(id) ON DELETE RESTRICT
);

-- Par B: ON DELETE CASCADE
CREATE TABLE PAI_B (
    id INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL
);
CREATE TABLE FILHO_B (
    id INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL, 
    id_pai INTEGER REFERENCES PAI_B(id) ON DELETE CASCADE
);

-- Par C: ON DELETE SET NULL
CREATE TABLE PAI_C (
    id INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL
);
CREATE TABLE FILHO_C (
    id INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL, 
    id_pai INTEGER REFERENCES PAI_C(id) ON DELETE SET NULL
);

INSERT INTO PAI_A (id, nome) VALUES (1, 'Pai A');
INSERT INTO FILHO_A (id, nome, id_pai) VALUES (1, 'Filho A1', 1), (2, 'Filho A2', 1);
INSERT INTO PAI_B (id, nome) VALUES (1, 'Pai B');
INSERT INTO FILHO_B (id, nome, id_pai) VALUES (1, 'Filho B1', 1), (2, 'Filho B2', 1);
INSERT INTO PAI_C (id, nome) VALUES (1, 'Pai C');
INSERT INTO FILHO_C (id, nome, id_pai) VALUES (1, 'Filho C1', 1), (2, 'Filho C2', 1);

-- DELETE FROM PAI_A WHERE id = 1; -- (Comentado porque o RESTRICT bloqueia e interrompe a execução do script com erro de FOREIGN KEY)
DELETE FROM PAI_B WHERE id = 1;
DELETE FROM PAI_C WHERE id = 1;

-- Conferindo o que sobrou em cada tabela de filhos
SELECT * FROM FILHO_A;
SELECT * FROM FILHO_B;
SELECT * FROM FILHO_C;

-- Eu escolheria a opção A, pois ela permite que as chaves estrangeiras fiquem