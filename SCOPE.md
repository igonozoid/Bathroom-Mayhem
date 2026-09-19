# Escopo da versão publicável

Atualizado em: 2026-09-18

## Objetivo

Entregar em 7 dias uma versão curta e publicável de Bathroom Mayhem. O jogo deve iniciar, comunicar sua proposta rapidamente, permitir concluir ou perder uma partida e oferecer uma forma clara de reiniciar ou sair.

## Alvo mobile

- Plataforma inicial provisória: Android.
- Orientação: retrato.
- Resolução lógica: 540 × 960, proporção-base 9:16.
- Adaptação: conteúdo expandido para outras proporções, mantendo HUD ancorado nas bordas.
- Gameplay: auto-runner 2D lateral; Luana corre sempre para a direita.
- Controles: toque curto, toque segurado, swipe para baixo e duplo toque; sem joystick virtual.
- Teclado: disponível apenas para desenvolvimento no desktop.
- Margem segura mínima: 18–24 px lógicos para barras, cantos e recortes de tela.

## Direção confirmada

Luana atravessa a praia em uma corrida desesperada até um banheiro. O objetivo é administrar Pressure, desviar ou interagir com pessoas/obstáculos, coletar recursos e alcançar o banheiro. Pressure máxima provoca fail. O vertical slice deve durar pouco, reiniciar imediatamente e testar primeiro o prazer do movimento e a vontade de tentar novamente.

## Critérios mínimos de publicação

- [ ] Executa na plataforma-alvo sem depender do editor.
- [ ] Fluxo completo: início, gameplay, fim e reinício.
- [ ] Controles são apresentados ao jogador.
- [ ] Não há bloqueios conhecidos no caminho principal.
- [ ] Interface permanece legível em 9:16, 19.5:9 e 20:9.
- [ ] Controles por toque funcionam sem depender de teclado.
- [ ] Não existe controle horizontal manual ou joystick no gameplay.
- [ ] Auto-run, pulo variável, slide e duplo toque funcionam em aparelho físico.
- [ ] HUD respeita margens seguras em aparelhos com recorte de tela.
- [ ] Áudio possui controles adequados, se incluído.
- [ ] Créditos e licenças de assets estão registrados.
- [ ] Build final foi testada fora da pasta do projeto.
- [ ] Página de publicação possui descrição, imagens e instruções.

## Fora do escopo por padrão

Entram somente mediante troca explícita por outra entrega:

- multiplayer;
- contas, servidor ou ranking on-line;
- múltiplos modos de jogo;
- narrativa extensa;
- grande variedade de fases, personagens ou inimigos;
- sistemas persistentes complexos;
- suporte a várias plataformas no primeiro lançamento;
- polimento que não afete clareza, estabilidade ou publicação.

## Definition of Done

Uma tarefa só está concluída quando funciona no fluxo real do jogo, foi verificada e não introduz erro impeditivo conhecido.
