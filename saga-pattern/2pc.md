# Two-Phase Commit (2PC) – Observações

![img](./assets/2pc.png)

## Como funciona o Two-Phase Commit (2PC)

1. Fase de Prepare
    - O coordenador envia um request de prepare para cada serviço envolvido na transação.
    - Cada serviço responde:
        - ✅ OK → está pronto para comitar.
        - ❌ NOK → não pode comitar.
    - Se qualquer um responder NOK → a transação é abortada (nada foi gravado no banco ainda).

2. Fase de Commit
    - Se todos responderem OK → o coordenador envia o comando de commit para cada serviço.
    - Cada serviço executa o commit localmente.

📍 Garantia:
Ou todos os serviços comitam a transação, ou nenhum comita → atomicidade.

## Problema de escalabilidade
- Não escala bem com muitos serviços.
- Não é adequado em cenários globais de web.
- Se não houver controle dos serviços → pior ainda.

## Quando pode ser adequado
- Todos os serviços estão sob controle (ex.: mesmo datacenter / AWS).
- Latência conhecida e baixa (~30ms).
- Cenário pequeno/médio: ex. empresa com ~1.000 reservas/dia (≠ Booking.com).

## Vantagem nesse contexto
- Solução simples.
- Suficiente para empresas que não precisam de escala massiva.

## Comparação com [Saga Pattern](https://github.com/DeveloperArthur/algoritmos-guias-anotacoes-uteis/blob/main/saga-pattern/saga.md)

![img](./assets/sagavs2pc.png)