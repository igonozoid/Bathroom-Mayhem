# Tarefas

Atualizado em: 2026-09-19

Prioridades: **P0** bloqueia a publicação; **P1** melhora significativamente a versão; **P2** só entra se houver folga.

## Agora

- [x] **P0** Registrar proposta e cânone do auto-runner lateral.
- [x] **P0** Consolidar direção visual e cânone da Luana.
- [x] **P0** Auditar e catalogar as referências visuais recuperadas do chat 00.
- [x] **P0** Definir executável Linux x86-64 como formato de teste atual.
- [x] **P0** Definir itch.io restrito/não listado como canal de distribuição dos testes.
- [x] **P0** Definir resolução lógica 540 × 960 e orientação retrato.
- [x] **P0** Substituir joystick/movimentação livre por auto-run lateral.
- [x] **P0** Implementar tap, hold, swipe down e duplo toque.
- [x] **P0** Implementar loop de corrida, Pressure, vitória, derrota e reinício.
- [x] **P0** Criar o projeto Godot usando a versão portable já validada.
- [x] **P0** Inicializar Git local na branch `main` e configurar Git LFS.
- [x] **P0** Configurar `.gitignore` para Godot.
- [x] **P0** Construir uma base vertical jogável com sprites iniciais.
- [x] **P0** Substituir a pista abstrata por obstáculos de humano, ave e animal.
- [x] **P0** Criar splash, menu e tutorial jogáveis antes da corrida.
- [x] **P0** Diferenciar pulo curto e pulo prolongado em física e sprite.
- [x] **P1** Adicionar parallax multicamada e animação de leitura dos obstáculos.

## Próximas

- [ ] **P0** Implementar reinício e retorno ao menu.
- [x] **P0** Implementar interface e instruções mínimas.
- [ ] **P0** Testar HUD em 9:16, 19.5:9 e 20:9 reais ou emulados.
- [x] **P0** Criar preset versionável `Android Test APK`.
- [x] **P0** Instalar templates Godot 4.7, JDK e Android SDK no Dell.
- [x] **P0** Gerar e verificar APK técnico do protótipo descartado.
- [x] **P0** Gerar executável Linux do vertical slice.
- [ ] **P0** Executar e revisar o build Linux fora do editor.
- [ ] **P0** Corrigir bloqueadores.
- [ ] **P0** Preparar créditos e licenças.
- [ ] **P0** Preparar página e arquivos de publicação.
- [x] **P0** Preparar rascunho, metadados e fluxo seguro de envio ao itch.io.
- [ ] **P1** Adicionar feedback visual e sonoro.
- [x] **P1** Criar folha-base de poses da Luana.
- [x] **P1** Criar atlas inicial de tiles e props da praia.
- [x] **P1** Criar logo, ícone do aplicativo e atlas de HUD.
- [x] **P1** Criar fundo vertical inicial de Beach Run.
- [x] **P1** Criar atlas inicial de efeitos de gameplay.
- [x] **P1** Produzir um ciclo inicial da Luana com transparência verificada e saltos distintos.
- [x] **P1** Reduzir a ocupação visual da Luana para ampliar a leitura do percurso.
- [x] **P1** Produzir candidata de corrida da Luana com 16 quadros PNG e visualizador no navegador.
- [ ] **P0** Aprovar o ciclo de corrida em movimento e corrigir qualquer halo colorido antes da integração ao Godot.
- [ ] **P1** Fazer ao menos uma rodada de playtest externo.
- [ ] **P1** Registrar métricas simples de balanceamento durante os testes.
- [ ] **P2** Adicionar variedade ou conteúdo extra.

## Concluídas

- [x] Criar o diretório local do projeto.
- [x] Adicionar o Godot portable em `godot_bin`.
- [x] Validar o executável Godot 4.7 stable para Linux x86-64.
- [x] Criar a documentação inicial da sprint.
- [x] Gerar e integrar o primeiro atlas original de sprites.
- [x] Criar primeiro protótipo técnico de movimento livre (descartado como direção de gameplay).

## Bloqueios e riscos

- As referências históricas possuem contradições; `CANON.md`, `ART_BIBLE.md` e o catálogo visual são as fontes válidas.
- Teste Android foi adiado por decisão de escopo; o alvo atual é execução Linux fora do editor.
- O APK atual contém gameplay top-down/joystick e não está aprovado para playtest do conceito.
- Captura de PNG não funciona no backend headless sem textura de viewport; a inspeção visual deste marco precisa ocorrer no editor com janela ou no executável Linux.
- Prazo curto exige congelamento precoce de escopo.
- **Marco de apresentação reaberto:** o APK técnico não satisfaz coesão visual; ver `RECOVERY_PLAN.md`. Nenhuma publicação será feita antes da fase única ser revisada visualmente.
