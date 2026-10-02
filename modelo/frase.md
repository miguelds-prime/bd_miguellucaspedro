# O caso do trio

**Integrantes:** Miguel, Lucas e Pedro

**Turma:** 3º Trimestre — Banco de Dados I

---

## Em uma frase

> O hotel registra hóspedes, reservas de quartos e os serviços consumidos durante
> cada estadia.

## As entidades

Cada substantivo da frase que tem vida própria e que precisamos guardar mais de
um:

- **HOSPEDE:** id, nome, documento, telefone
- **RESERVA:** id, data_entrada, data_saida, status, id_hospede, id_quarto
- **QUARTO:** id, numero, tipo, capacidade, diaria
- **SERVICO:** id, nome, descricao, valor_base
- **RESERVA_SERVICO:** id_reserva, id_servico, quantidade, valor_unitario

Uma reserva pertence a um hóspede e registra o quarto reservado. Um hóspede pode
ter várias reservas, e um quarto pode aparecer em várias reservas ao longo do
tempo.

## O N:N com atributo próprio

O par **RESERVA e SERVICO** é muitos-para-muitos: uma reserva pode consumir vários
serviços e um serviço pode aparecer em várias reservas. A associativa
**RESERVA_SERVICO** guarda os atributos que nascem do encontro: `quantidade` e
`valor_unitario` (o preço praticado naquela reserva).
