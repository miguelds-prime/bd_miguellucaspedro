CREATE TABLE HOSPEDE (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20),
    telefone VARCHAR(15)
);

CREATE TABLE QUARTO (
    id INT PRIMARY KEY,
    numero INT,
    tipo VARCHAR(50),
    capacidade INT,
    diaria DECIMAL(10,2)
);

CREATE TABLE RESERVA (
    id INT PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_entrada DATE,
    data_saida DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_hospede) REFERENCES HOSPEDE(id),
    FOREIGN KEY (id_quarto) REFERENCES QUARTO(id)
);

CREATE TABLE SERVICO (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    valor_base DECIMAL(10,2)
);

CREATE TABLE RESERVA_SERVICO (
    id_reserva INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    PRIMARY KEY (id_reserva, id_servico),
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id),
    FOREIGN KEY (id_servico) REFERENCES SERVICO(id)
);