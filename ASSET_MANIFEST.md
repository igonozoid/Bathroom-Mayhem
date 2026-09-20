# Manifesto de assets visuais

Atualizado em: 2026-09-19

Todos os arquivos abaixo são artes originais geradas para Bathroom Mayhem com a ferramenta integrada de geração de imagens. Os prompts finais estão resumidos neste documento e os arquivos finais foram copiados para o projeto.

## Personagem

### `assets/art/characters/luana/v3/run_clean/`

- Arquivos: 16 PNGs `luana_run_clean_00.png` a `luana_run_clean_15.png`.
- Dimensão normalizada: 351 × 281 px por quadro.
- Alfa real: sim (`sRGBA`), verificado após chaveamento do fundo magenta de produção.
- Conteúdo: ciclo de corrida lateral para Luana adulta, curvilínea/chubby atlética, com cabelo preto/azul, top branco e shorts aqua.
- Uso: candidato para o ciclo principal. Deve passar por revisão de movimento no visualizador HTML antes de entrar na fase.
- Fonte preservada: `assets/art/characters/luana/png_source/luana_run_cycle_16_magenta_source.png`.

### `assets/art/characters/luana/v4/jump_short/` e `slide/`

- Arquivos: 16 quadros de salto curto e 16 de slide; cada quadro tem 351 × 281 px e alfa real. As sheets consolidadas ficam em `v4/sheets/`.
- Função: candidatas enquadradas para os controles do auto-runner, a serem avaliadas exclusivamente junto da corrida no laboratório `tools/animation_lab/luana_controls_preview.html`.
- Fontes preservadas e aprovadas para enquadramento: `png_source/luana_jump_short_16_magenta_source_v4.png` e `png_source/luana_slide_16_magenta_source_v4.png`.
- Histórico: as fontes de 12 quadros e seus recortes em `v3/jump_short/` e `v3/slide/` foram reprovados por células quebradas; são preservados, mas não devem ser integrados.

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

### `assets/art/obstacles/beach_dog_v2.png`

- Dimensão: 1536 × 1024.
- Alfa real: sim.
- Conteúdo: cachorro correndo em perfil lateral.
- Uso: obstáculo de solo; deve ser evitado com pulo. Substitui a versão experimental V1 no MVP reconstruído.

### `assets/art/obstacles/tourist_phone_v2.png`

- Dimensão: 1162 × 1354.
- Alfa real: sim.
- Conteúdo: turista distraído com celular e bolsa de praia.
- Uso: substitui o placeholder desenhado em código; obstáculo humano de solo.

### `assets/art/backgrounds/beach_run_stage_v2.png`

- Dimensão: 941 × 1672.
- Fundo: opaco.
- Conteúdo: cenário final da fase Beach Run, com torre de salva-vidas, público, quiosque e faixa central livre.
- Uso: composição vertical anterior, preservada como referência. Não é mais usada no runtime.

### `assets/art/backgrounds/beach_run_panorama_v3.png`

- Dimensão: 2172 × 724.
- Fundo: opaco.
- Conteúdo: panorama lateral de praia com torre de salva-vidas, oceano, montanhas, público, quiosque, palmeiras e faixa inferior de areia livre.
- Uso: fundo ativo da rota. A câmera percorre o panorama ao longo da corrida, em vez de manter uma placa fixa.
- Geração: ferramenta integrada de imagens, usando o painel B do mockup histórico exclusivamente como referência de direção, composição e paleta; sem reproduzir UI, texto ou personagem da referência.

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
