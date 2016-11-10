# Teste Ruby

Tem como objetivo se alimentar da API do Webmotors e listar marcas e modelos de carros

## Setup

```console
# Configure a aplicação
bin/setup

# Popular/Atualizar banco de dados
bin/rake webmotors_static_data:all
```

### Considerações

Não sei a frequência de atualização dos dados da Webmotors, mas acredito que não seja constante. Por esse motivo, decidi os dados deveriam ser tratados como "estáticos" e populados/atualizados sob demanda.

No melhor dos ambientes, deveria ser agendado um cron para executar a tarefa de atualizar os dados de marcas e modelos em um determinado intervalo.
