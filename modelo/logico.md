# Modelo lógico

As chaves estrangeiras apontam para a chave primária indicada depois da seta.
Em `RESERVA_SERVICO`, a chave primária é composta pelas duas chaves
estrangeiras.

```text
HOSPEDE (_id_, nome, documento, telefone)
RESERVA (_id_, data_entrada, data_saida, status, id_hospede -> HOSPEDE, id_quarto -> QUARTO)
QUARTO (_id_, numero, tipo, capacidade, diaria)
SERVICO (_id_, nome, descricao, valor_base)
RESERVA_SERVICO (_id_reserva -> RESERVA_, _id_servico -> SERVICO_, quantidade, valor_unitario)
```

`RESERVA_SERVICO` é a tabela associativa do N:N entre `RESERVA` e `SERVICO`.
`quantidade` e `valor_unitario` pertencem ao encontro, não a uma reserva ou a
um serviço isoladamente.
