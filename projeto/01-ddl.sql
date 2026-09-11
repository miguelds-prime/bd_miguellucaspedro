LABORATORIO
id                   INTEGER        PK
nome                 VARCHAR (60) NOT NULL
bloco                CHAR (1)

PROFESSOR
id                   INTEGER        PK
nome                 VARCHAR (120) NOT NULL
email                VARCHAR (120) UNIQUE

EQUIPAMENTO
id                   INTEGER        PK
descricao            VARCHAR (120) NOT NULL
patrimonio           VARCHAR (20) UNIQUE
id_laboratorio       INTEGER        FK -> LABORATORIO.id
 
EMPRESTIMO <- a associativa
id                   INTEGER        PK
id_professor         INTEGER        FK -> PROFESSOR.id
id_equipamento       INTEGER        FK -> EQUIPAMENTO.id
data_saida           DATE NOT NULL
data_devolucao       DATE           <- vazio = ainda esta com ele