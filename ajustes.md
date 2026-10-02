# Ajustes da Aula 01

Pessoal, aqui é o professor Diego.

O caso foi estruturado a partir do rascunho que vocês deixaram: hóspede faz
reserva e a reserva envolve quarto. Organizei isso em um caso de hotelaria com
cinco estruturas fáceis de defender: `HOSPEDE`, `RESERVA`, `QUARTO`, `SERVICO` e
`RESERVA_SERVICO`. A tabela `RESERVA_SERVICO` é a associativa entre reserva e
serviço e, como a aula pede, registra `quantidade` e `valor_unitario`, que só
existem por causa daquele consumo.

Antes de transformar o modelo em SQL, o trio ainda precisa validar três pontos:

- se uma reserva deve registrar exatamente um quarto ou se o caso de vocês
  realmente precisa permitir vários quartos na mesma reserva;
- se `documento` identifica unicamente um hóspede e se `numero` identifica
  unicamente um quarto;
- quais valores de `status`, tipos de quarto e unidades de serviço fazem
  sentido no caso real de vocês.

Não usei o `projeto/01-ddl.sql` para decidir o modelo: aquele arquivo tem
entidades de outro contexto e não corresponde ao rascunho de vocês.
