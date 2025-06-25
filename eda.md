# Patterns Utilizados na EDA que Eu Já Implementei

## Point-to-Point com Interação Consumidora do Tipo Push e o Pattern Fire-and-Forget
- Explicação: [https://github.com/DeveloperArthur/rinha-de-backend-2023/tree/4215b87e18d7cc3735228911a59d3da06b032bdd?tab=readme-ov-file#fila--cache](https://github.com/DeveloperArthur/rinha-de-backend-2023/tree/4215b87e18d7cc3735228911a59d3da06b032bdd?tab=readme-ov-file#fila--cache)
- Implementação: [https://github.com/DeveloperArthur/rinha-de-backend-2023/blob/4215b87e18d7cc3735228911a59d3da06b032bdd/app/queue/rabbitmq.go](https://github.com/DeveloperArthur/rinha-de-backend-2023/blob/4215b87e18d7cc3735228911a59d3da06b032bdd/app/queue/rabbitmq.go)

## One-to-Many
- Implementação: https://github.com/DeveloperArthur/arquitetura-escalabilidade-com-php?tab=readme-ov-file#problemas-na-arquitetura-e-decis%C3%B5es-de-resolu%C3%A7%C3%A3o

## Event Streaming
- Implementação: https://github.com/DeveloperArthur/aplicacao-reativa-spring-webflux?tab=readme-ov-file#processamento-assincrono-e-n%C3%A3o-bloqueante

## Saga
- Implementação: https://github.com/DeveloperArthur/algoritmos-guias-anotacoes-uteis/blob/main/saga-pattern/saga.md

## CQRS em Monolito Hexagonal
- Implementação: https://github.com/DeveloperArthur/CQRS-with-RabbitMQ-Redis-InfraAsCode

## CQRS com Event Sourcing, DLQ, Interação Consumidora do Tipo Pull, com ACK e Back Pressure
- Ainda não implementado

---

## Dúvidas Respondidas no Fórum
- Sobre ter Produtor e Consumidor na mesma App: https://forum.casadocodigo.com.br/t/arquitetura-orientada-a-eventos-sobre-ter-produtor-e-consumidor-na-mesma-app/2331
- Fila vs Tópico e o pattern one-to-many: https://forum.casadocodigo.com.br/t/arquitetura-orientada-a-eventos-fila-vs-topico-e-o-pattern-one-to-many/2330
- Dúvida sobre o pattern fire-and-forget: https://forum.casadocodigo.com.br/t/arquitetura-orientada-a-eventos-duvida-sobre-o-pattern-fire-and-forget/2332
- Onde está o Event Sourcing na Figura 3.20 / O que é Event Store: https://forum.casadocodigo.com.br/t/arquitetura-orientada-a-eventos-onde-esta-o-event-sourcing-na-figura-3-20/2333

