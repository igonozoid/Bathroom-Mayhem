# Art Bible — Bathroom Mayhem

Atualizado em: 2026-09-19

## Direção

Cartoon 2D lateral vetorial, expressivo e legível em celulares. A estética mistura férias tropicais alegres com urgência cômica. O humor vem da situação e das reações, nunca do corpo dos personagens.

## Linguagem visual

- formas grandes e silhuetas reconhecíveis;
- contorno azul-marinho espesso e consistente;
- preenchimentos vetoriais planos, com no máximo três níveis de luz;
- detalhes reduzidos para leitura entre 64 e 160 px;
- movimento elástico, expressões amplas e poses claras;
- perspectiva lateral ortográfica no gameplay;
- SVG modular e editável para personagem, UI, itens e props; fundos também usam formas vetoriais simplificadas.
- interface com volumes brilhantes e ícones compactos.

## Paleta principal

- **Deep Navy:** contornos, sombras e fundos de HUD;
- **Aqua/Turquoise:** marca, água, estados neutros e roupa de Luana;
- **Coral/Orange:** urgência, perigo e destaques;
- **Cream/White:** brilho, espuma, papel e contraste;
- **Golden Sand:** chão e ambiente de praia;
- **Gold:** itens raros e recompensa.

## Luana

### Cânone preservado

- adulta, 19 anos, aproximadamente 1,60 m;
- corpo curvilíneo/chubby atlético; nunca redesenhar como esbelta;
- pele clara;
- olhos azuis intensos;
- cabelo preto longo com reflexos azulados;
- pequeno piercing na ponte do nariz;
- atitude alternativa, divertida, ousada e autêntica.

### Roupa do vertical slice

Top esportivo branco com acabamento turquesa, shorts turquesa com acabamento branco e tênis branco/turquesa. A roupa é funcional para corrida e mantém leitura consistente em todas as poses.

### Animação

Priorizar linhas de ação e leitura imediata. Estados principais:

1. normal;
2. preocupada;
3. urgente;
4. pânico/Code Brown.

A folha `luana_actions_v1.png` contém 12 poses-base para idle, corrida, salto, aterrissagem, queda, recuperação e progressão de pressão. Ela é uma base de produção; ciclos finais devem ser normalizados quadro a quadro antes de animação definitiva.

## Praia — Beach Run

- areia dourada com pequenas pedras e conchas;
- água turquesa e espuma branca;
- madeira quente para píer e carrinhos;
- props em coral, aqua e creme;
- vegetação verde saturada com sombras azul-marinho;
- banheiro público reconhecível à distância;
- nenhum prop decorativo pode competir com a silhueta de Luana.

## Marca

O logo principal usa `BATHROOM MAYHEM` em aqua e coral, com `FULL PRESSURE` subordinado. Velocímetro e papel higiênico comunicam urgência e tema sem recorrer a imagens explícitas.

## Evitar

- realismo fotográfico no jogo;
- pixel art misturada à estética principal;
- contornos pretos puros e finos;
- fundos excessivamente detalhados;
- humor baseado em humilhar o corpo de Luana;
- gore ou material escatológico realista;
- mudança de anatomia, cabelo ou rosto entre sprites;
- texto gerado dentro de props ou ícones.
