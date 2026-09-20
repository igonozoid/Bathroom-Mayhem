# Plano de arte — Prólogo jogável

Atualizado em: 2026-09-19

## Direção adotada

Todo elemento novo do prólogo será um SVG vetorial, com contorno azul-marinho espesso, formas simples, três tons de luz no máximo e paleta areia/aqua/coral/creme. O alvo não é simular a ilustração pintada anterior: é um cartoon gráfico consistente, legível e editável.

O prólogo é uma fase completa de 60–75 segundos:

`Chegada à praia → faixa de areia → quiosque → banheiro público`

O jogador controla Luana em auto-run lateral. Uma peça só entra em produção se tiver uso na fase, na interface ou numa tela do fluxo.

## Ordem de produção

| Ordem | Pacote | Resultado que precisa ser aprovado |
| --- | --- | --- |
| 1 | Folha de estilo | paleta, espessura de contorno, proporção e grid de 16 px |
| 2 | Rig de Luana | corpo reconhecível e coerente em pose neutra |
| 3 | Ciclo de corrida | 8 poses em loop sem “pulos” de anatomia |
| 4 | Ações de Luana | salto curto, salto longo, slide, impacto e vitória |
| 5 | Kit de obstáculos/itens | silhuetas reconhecíveis e hitboxes claras |
| 6 | Cenário em planos | céu, praia distante e primeiro plano com scroll distinto |
| 7 | HUD e telas | fluxo inteiro clicável antes da integração definitiva |
| 8 | FX e polimento | poeira, alerta, coleta, impacto, transições |

Cada pacote será testado antes de iniciar o seguinte. O primeiro teste ocorre em uma página HTML local; depois o mesmo conjunto é montado no Godot.

## 1. Kit-base e convenções

| Asset SVG | Função | Tamanho-base |
| --- | --- | --- |
| `style-swatch.svg` | paleta e exemplos de contorno | 512 × 512 |
| `luana-scale-guide.svg` | altura, pivôs e área de colisão | 256 × 384 |
| `ui-grid.svg` | espaçamento e cards | 540 × 960 |

Regras: pivô de personagem no centro dos pés; arquivos em `assets/vector/`; cada SVG tem `viewBox`; sem texto rasterizado; sem efeitos que dependam de fonte externa.

## 2. Luana em PNG animado

Para o prólogo, Luana usa quadros PNG ilustrados, em vez do rig SVG experimental. Isso preserva qualidade de desenho e evita a aparência geométrica do protótipo vetorial. Os SVGs continuam arquivados como estudo, não como arte ativa.

| Grupo | Arquivos | Uso |
| --- | --- | --- |
| Corrida | `assets/art/characters/luana/v3/run_clean/luana_run_clean_00..15.png` | ciclo de 16 poses |
| Fonte preservada | `png_source/luana_run_cycle_16_magenta_source.png` | master antes do chaveamento |
| Próximas ações | salto, slide, impacto e vitória em folhas PNG separadas | estados de gameplay |

Silhueta: adulta, curvilínea/chubby atlética, cabelo preto longo com reflexo azul, top branco e shorts aqua. Não haverá troca de anatomia entre poses.

### Animações de Luana

| Estado | Quadros/poses | Critério de aceitação |
| --- | --- | --- |
| Corrida | 16 | pés alternam contato, passagem e extensão; cabeça e tronco mantêm massa |
| Salto curto | 3 | saída, ápice, queda; arco curto |
| Salto longo | 4 | saída, extensão, ápice, queda; arco claramente maior |
| Slide | 3 | entrada, sustentação, saída; silhueta baixa |
| Impacto | 3 | antecipação, impacto, recuperação |
| Vitória | 4 | desacelera, alívio, celebração |

## 3. Objetos de gameplay

| Asset SVG | Tipo | Interação |
| --- | --- | --- |
| `pickup_paper_roll.svg` | coletável | reduz Pressure |
| `pickup_coconut_water.svg` | coletável | reduz Pressure |
| `hazard_coffee.svg` | item ruim | aumenta Pressure |
| `hazard_tourist.svg` | obstáculo baixo | pular |
| `hazard_dog.svg` | obstáculo baixo | pular |
| `hazard_seagull.svg` | obstáculo alto | slide |
| `goal_restroom.svg` | objetivo | encerra a fase |
| `sign_restroom_arrow.svg` | sinalização | progresso visual |

Para cada obstáculo: pose padrão, pose de movimento simples (2–4), sombra e área de colisão documentada.

## 4. Cenário vetorial em planos

| Plano | Peças SVG necessárias | Movimento |
| --- | --- | --- |
| Céu | gradiente, nuvens, sol, montanhas | 0,05× da velocidade |
| Horizonte | oceano, ondas, cidade distante | 0,12× |
| Praia média | palmeira, torre, guarda-sol, público, quiosque, placas | 0,30× |
| Jogo | areia, rastros, pedras, conchas, sombras | 1,00× |
| Primeiro plano | folhas, grama, espuma, poeira | 1,25× |

O público será composto de três silhuetas vetoriais reutilizáveis, com variação de cor, escala e animação de balanço — não de dezenas de personagens diferentes.

## 5. Telas do prólogo

| Tela | Elementos visuais |
| --- | --- |
| Splash | logo, onda/folha animada, carregamento curto |
| Menu | logo, Luana em pose, botão Jogar, botão Controles, cenário em movimento |
| Tutorial | quatro cartões: pulo, pulo longo, slide, alívio |
| HUD | Pressure, papel, distância, trecho, pausa, aviso contextual |
| Pausa | retomar, reiniciar, controles, sair ao menu |
| Derrota | causa, resultado, botão tentar de novo |
| Vitória | banheiro, resultado, celebração e jogar novamente |

## 6. Efeitos mínimos

- `fx_dust_01..03.svg` — corrida e aterrissagem;
- `fx_speed_01..02.svg` — impulso do salto;
- `fx_collect.svg` — coleta;
- `fx_alert.svg` — Pressure alto;
- `fx_impact.svg` — colisão;
- `fx_relief.svg` — habilidade especial.

## Protótipo de animação

Antes de integrar ao jogo, uma página local `tools/animation_lab/index.html` deve permitir:

1. reproduzir cada ciclo em 12, 15 e 18 fps;
2. pausar em qualquer quadro;
3. ativar guias de pivô, hitbox e onion skin;
4. comparar salto curto e salto longo lado a lado;
5. registrar GIF/frames de referência quando a animação for aprovada.

O mesmo teste será repetido em uma cena Godot isolada, usando os SVGs importados. Só então os arquivos entram na fase.

## Fora do prólogo

Ficam fora: segunda fase, roupas alternativas, inimigos adicionais, loja, monetização, ranking, cutscene e publicação.
