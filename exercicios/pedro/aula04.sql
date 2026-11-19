-- Aula 04 - O banco responde
-- Enunciado: exercicios/enunciados/aula04-dql.md
--
-- Escreva a resposta de cada exercicio embaixo do marcador.
-- Antes de cada SELECT, escreva a pergunta em comentario.
-- Hoje so se consulta: nao crie, nao insira, nao altere.
-- Os blocos rodam sobre o banco da secretaria ja carregado.
-- O ex9 fica em comentario (as tabelas do trio nao existem aqui).

-- ============================================================================
-- Aula 04: O banco responde
-- Arquivo: exercicios/<seu-nome>/aula04.sql
-- ============================================================================

-- ex1
SELECT nome, nascimento FROM ALUNO;


-- ex2
SELECT nome FROM ALUNO WHERE id_turma = 1;
SELECT * FROM INSCRICAO WHERE situacao = 'ativa';


-- ex3
SELECT * FROM ALUNO WHERE id_turma IS NULL;

-- Consulta errada: SELECT * FROM ALUNO WHERE id_turma = NULL;
-- NULL representa a ausência de valor. Comparar qualquer coisa com NULL sempre resulta em desconhecido, devolvendo zero linhas mesmo quando existem registros vazios.


-- ex4
SELECT * FROM INSCRICAO WHERE situacao = 'ativa' AND id_modalidade = 2;
SELECT * FROM ALUNO WHERE id_turma IN (1, 2);


-- ex5
SELECT * FROM ALUNO 
WHERE nome LIKE 'A%';

-- Estimativa: Espero encontrar 0 linhas.
SELECT * FROM INSCRICAO 
WHERE data BETWEEN '2026-05-01' AND '2026-05-31';
-- Conferência: Retornou exatamente 0 linhas, porque a inscrição mais recente do banco é de 2026-04-11.


-- ex6
SELECT * FROM ALUNO 
ORDER BY nome ASC;

SELECT * FROM ALUNO 
ORDER BY nome ASC 
LIMIT 3;


-- ex7
-- a) SELECT nome FROM ALUNO WHERE id_turma = 0;
-- Erro: O zero é um número válido, mas "sem turma" no banco é representado pela ausência de valor (NULL).

SELECT nome FROM ALUNO WHERE id_turma IS NULL;

-- b) SELECT nome FROM ALUNO WHERE nome = 'Ana%';
-- Erro: O operador "=" busca correspondência exata (literalmente o texto "Ana%"). Para usar o curinga "%", é obrigatório usar o operador LIKE.

SELECT nome FROM ALUNO WHERE nome LIKE 'Ana%';

-- c) SELECT * FROM INSCRICAO WHERE situacao = 'ativa' OR situacao = 'trancada' AND id_modalidade = 2;
-- Erro : O operador AND tem precedência sobre o OR. Sem parênteses, o banco traz TODAS as inscrições ativas de qualquer modalidade, somadas às trancadas apenas da modalidade 2.

SELECT * FROM INSCRICAO WHERE (situacao = 'ativa' OR situacao = 'trancada') AND id_modalidade = 2;


-- ex8
-- Consulta 1:
-- Estimativa: Espero encontrar 0 linhas.
SELECT nome FROM ALUNO WHERE id_turma IS NULL;
-- Conferência: Retornou exatamente 1 linha

-- Consulta 2:
-- Estimativa: Espero encontrar 0 linhas.
SELECT nome FROM ALUNO WHERE nome LIKE '%Silva%' ORDER BY nome;
-- Conferência: Retornou 0 linhas

-- Consulta 3:
-- Estimativa: Espero encontrar 0 linhas.
SELECT * FROM INSCRICAO WHERE situacao = 'ativa' AND data >= '2026-09-01';
-- Conferência: Retornou 0 linhas


-- ex9
-- Pergunta 1: Quais quartos têm valor de diária entre R$ 150,00 e R$ 350,00, ordenados do mais barato para o mais caro?
-- SELECT numero, tipo, capacidade, diaria FROM QUARTO WHERE diaria BETWEEN 150.00 AND 350.00 ORDER BY diaria ASC;

-- Pergunta 2: Quais reservas ainda não têm data de saída definida (hóspedes que ainda não fecharam a estadia) e estão com status 'ativa' ou 'confirmada'?
-- SELECT id, id_hospede, id_quarto, data_entrada, status FROM RESERVA WHERE data_saida IS NULL AND status IN ('ativa', 'confirmada');

-- Pergunta 3: Quais hóspedes têm o sobrenome "Silva" em qualquer parte do nome, listados em ordem alfabética?
-- SELECT id, nome, documento, telefone FROM HOSPEDE WHERE nome LIKE '%Silva%' ORDER BY nome ASC;
