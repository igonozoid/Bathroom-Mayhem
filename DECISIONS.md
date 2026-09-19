# Registro de decisões

Este arquivo registra decisões que alteram escopo, arquitetura, prazo ou apresentação.

## Formato

### AAAA-MM-DD — Título

- **Decisão:** o que foi decidido.
- **Motivo:** por que foi decidido.
- **Impacto:** o que muda no projeto.
- **Revisitar:** condição que justificaria rever a decisão, ou “não”.

## Decisões

### 2026-09-18 — Sprint de 7 dias

- **Decisão:** produzir uma primeira versão publicável em 7 dias.
- **Motivo:** novo prazo do projeto.
- **Impacto:** priorizar um único loop completo, congelar funcionalidades no Dia 4 e reservar os últimos dias para estabilidade e publicação.
- **Revisitar:** somente se o prazo externo mudar.

### 2026-09-18 — Godot portable

- **Decisão:** iniciar com Godot 4.7 stable portable para Linux x86-64.
- **Motivo:** binário já disponível e validado no Dell.
- **Impacto:** a versão da engine deve permanecer fixa durante a sprint, salvo bloqueio crítico.
- **Revisitar:** apenas diante de incompatibilidade impeditiva.

### 2026-09-18 — Base de resolução mobile

- **Decisão:** usar 540 × 960 como resolução lógica, orientação retrato e escala expansível para outras proporções.
- **Motivo:** 9:16 fornece uma base leve e previsível para o protótipo, enquanto ancoragem e expansão acomodam telas móveis mais longas.
- **Impacto:** gameplay usa coordenadas lógicas; HUD fica ancorado; gestos de uma mão controlam ações e teclado serve apenas ao desenvolvimento.
- **Revisitar:** após testes em aparelhos 19.5:9 e 20:9 ou se a nova direção exigir paisagem.

### 2026-09-18 — Distribuição pré-loja

- **Decisão:** distribuir builds de teste como APK por uma página itch.io não listada ou restrita; manter o código em repositório GitHub privado.
- **Motivo:** permitir instalação rápida por testadores sem assumir agora o processo e as exigências da Play Store.
- **Impacto:** a sprint precisa de build Android de depuração, roteiro de instalação e teste físico; publicação em loja permanece fora do escopo.
- **Revisitar:** depois que a versão estiver estável e houver decisão sobre lançamento público.

### 2026-09-18 — Revisão antes de avanço

- **Decisão:** executar, observar e revisar cada marco antes de iniciar o seguinte.
- **Motivo:** evitar que erros técnicos ou visuais se acumulem durante a sprint curta.
- **Impacto:** compilação isolada não encerra uma tarefa; mudanças visuais exigem inspeção e builds Android exigem teste físico antes de distribuição.
- **Revisitar:** não.

### 2026-09-19 — Restaurar o auto-runner canônico

- **Decisão:** Luana corre automaticamente para a direita em visão lateral; remover movimentação livre e joystick virtual.
- **Motivo:** esta é a direção definida no chat de conceito e necessária para controle confortável com uma mão.
- **Impacto:** o protótipo top-down atual e seu APK ficam obsoletos; código, cena e testes precisam ser reconstruídos para tap/hold/swipe/duplo toque.
- **Revisitar:** somente se um playtest físico demonstrar problema estrutural.
