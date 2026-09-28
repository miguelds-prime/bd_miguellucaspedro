Recepcionista
id                   INT            PRIMARY KEY
nome                 VARCHAR (60)   NOT NULL
receber_pagamento    INT
id_reserva           INT            FOREIGN KEY

Hospede
id                   INT            PRIMARY KEY
nome                 VARCHAR (120)  NOT NULL
email                VARCHAR (120)  UNIQUE

Quartos
id                   INT            PRIMARY KEY
descricao            VARCHAR (120)  NOT NULL
id_reserva           INT            FOREIGN KEY
 
Reserva              
id                   INT            PRIMARY KEY
data_entrada         DATE
data_saida           DATE