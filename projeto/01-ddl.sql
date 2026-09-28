Recepcionista
id                   INTEGER        PK
nome                 VARCHAR (60)
receber_pagamento    INTEGER

Hospede
id                   INTEGER        PK
nome                 VARCHAR (120)
email                VARCHAR (120) UNIQUE

Quartos
id                   INTEGER        PK
descricao            VARCHAR (120) NOT NULL
id_reserva           INTEGER FK
 
Reserva              
id                   INTEGER        PK
data_entrada         DATE
data_saida           DATE