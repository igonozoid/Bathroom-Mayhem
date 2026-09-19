# Manifesto de assets visuais

Atualizado em: 2026-09-19

Todos os arquivos abaixo são artes originais geradas para Bathroom Mayhem com a ferramenta integrada de geração de imagens. Os prompts finais estão resumidos neste documento e os arquivos finais foram copiados para o projeto.

## Personagem

### `assets/art/characters/luana/v2/`

- Arquivos: oito poses de corrida `luana_run_*_v2.png`, além de `luana_jump_short_v2.png` e `luana_jump_long_v2.png`.
- Alfa real: sim, verificado em todos os dez PNGs.
- Conteúdo: Luana adulta, curvilínea/chubby atlética, com silhueta mais cheia, corrida em oito fases e saltos de baixa/alta extensão separados.
- Uso: ciclo principal do vertical slice. O pulo prolongado tem arte e física distintas do pulo curto.
- Geração: ferramenta integrada de imagens; os candidatos com falso xadrez de transparência foram rejeitados e não foram incluídos no jogo.

### `assets/art/characters/luana/luana_actions_v1.png`

- Dimensão: 1273 × 1236.
- Alfa real: sim.
- Conteúdo: 12 poses laterais de Luana.
- Uso: referência de personagem e fallback de slide; substituído pelo conjunto `v2/` nos ciclos de corrida e pulo.
- Observação: requer normalização de células/ciclos antes de animação final.
- Prompt resumido: Luana adulta canônica convertida em cartoon 2D lateral, corpo curvilíneo preservado, roupa esportiva branca/turquesa, poses de idle, corrida, salto, aterrissagem e pressão, contorno azul-marinho e fundo transparente.

## Obstáculos

### `assets/art/obstacles/seagull_flying_v1.png`

- Dimensão: 1536 × 1024.
- Alfa real: sim.
- Conteúdo: gaivota em voo lateral.
- Uso: obstáculo alto; deve ser evitada com slide.

### `assets/art/obstacles/beach_dog_running_v1.png`

- Dimensão: 1536 × 1024.
- Alfa real: sim.
- Conteúdo: cachorro correndo em perfil lateral.
- Uso: obstáculo de solo; deve ser evitado com pulo.

### Turista distraído

- Estado: desenhado em código na cena inicial, com silhueta, celular e bolsa de praia.
- Uso: obstáculo humano de solo; deve ser evitado com pulo.
- Motivo: os rascunhos gerados para este personagem vieram com o xadrez de transparência gravado na imagem e foram rejeitados para integração.

## Cenário

### `assets/art/environment/beach_tiles_props_v1.png`

- Dimensão: 1448 × 1086.
- Alfa real: sim.
- Conteúdo: areia, ledge, água, píer, rampa, guarda-sol, cadeira, prancha, bola, carrinho, palmeira e banheiro.
- Uso: Stage 01 — Beach Run.
- Prompt resumido: atlas lateral de praia, cartoon 2D compatível com Luana, doze elementos isolados, paleta areia/aqua/coral e fundo transparente.

## Branding

### `assets/art/branding/bathroom_mayhem_logo_v1.png`

- Dimensão: 1536 × 1024.
- Alfa: sim, com efeitos de fundo parcialmente translúcidos.
- Texto: `BATHROOM MAYHEM` / `FULL PRESSURE`.
- Uso: tela inicial, capa e itch.io.

### `assets/art/branding/app_icon_v1.png`

- Dimensão: 1254 × 1254.
- Fundo: opaco, adequado para ícone quadrado.
- Uso: ícone do projeto, APK e avatar itch.io.

## Background

### `assets/art/backgrounds/beach_run_background_v1.png`

- Dimensão: 941 × 1672, próxima de 9:16.
- Fundo: opaco.
- Conteúdo: céu, nuvens, oceano, horizonte e corredor amplo de areia.
- Uso: plate inicial e referência para camadas futuras de parallax.
- Prompt resumido: praia tropical vertical em cartoon 2D, área inferior limpa para gameplay lateral, sem personagens ou UI.

## Interface

### `assets/art/ui/hud_icons_v1.png`

- Dimensão: 1448 × 1086.
- Alfa real: sim.
- Conteúdo: Pressure, Dignity, Mayhem, papel, Golden Roll, água, coco, café, pílula, pause, áudio e vibração.
- Uso: HUD, menus e tutorial.

## Efeitos

### `assets/art/fx/gameplay_fx_v1.png`

- Dimensão: 1448 × 1086.
- Alfa real: sim.
- Conteúdo: poeira de corrida/aterrissagem, swoosh, velocidade, suor, rumble, Pressure, pânico, sparkles, impacto e alívio.
- Uso: feedback de movimento, itens e estados de Pressure.
