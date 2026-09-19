# Cânone do projeto

Atualizado em: 2026-09-19

Este documento prevalece sobre protótipos temporários ou textos antigos que o contradigam.

## Produto

- **Franquia:** Bathroom Mayhem
- **Capítulo 1:** Full Pressure
- **Engine:** Godot 4.7
- **Plataforma inicial:** Android
- **Orientação:** retrato, mobile-first
- **Referência visual:** 1080 × 1920
- **Resolução lógica do projeto:** 540 × 960
- **Gênero:** auto-runner/plataforma 2D de visão lateral
- **Stage inicial:** Beach Run
- **Protagonista:** Luana

## Premissa

Luana marcou um encontro na praia, sofre uma emergência intestinal e precisa alcançar um banheiro atravessando uma praia cada vez mais caótica. O tom é satírico, acelerado e cartunesco.

## Loop

`RUN → JUMP → SLIDE → DODGE → COLLECT → MANAGE PRESSURE → CAUSE MAYHEM → REACH TOILET`

Luana corre automaticamente e continuamente para a direita. O jogador não controla direção horizontal nem usa joystick virtual.

## Controles de uma mão

- toque curto: pulo;
- toque e segurar: pulo mais alto;
- swipe para baixo: agachar/deslizar;
- duplo toque: habilidade especial `Controlled Relief`;
- toque na tela de resultado: reinício imediato.

Teclado existe apenas para desenvolvimento:

- espaço: pulo/segurar;
- seta para baixo: slide;
- tecla especial a definir: `Controlled Relief`;
- `R`: reinício.

## Câmera

Luana permanece no terço inferior/esquerdo da tela vertical. O mundo se desloca para a esquerda, deixando espaço visível à frente e acima.

## Sistemas centrais

### Pressure

`CALM → PRESSURE → URGENT → PANIC → CODE BROWN → FAIL`

Pressure altera postura, animação, áudio, velocidade e controle.

### Mayhem Combo

Reações em cadeia entre Luana, NPCs, animais e objetos. O caos é pontuação e espetáculo, não apenas punição.

### Dignity

Pontuação humorística secundária. Não funciona como vida.

### Controlled Relief

Habilidade de Luana: reduz parcialmente Pressure, diminui Dignity e provoca reações/Mayhem ao redor.

## Pilares

1. Jogável confortavelmente com uma mão.
2. Urgência crescente e legível.
3. Humor físico e escatológico sempre cartunesco.
4. Perder também precisa ser divertido.
5. Reinício quase instantâneo.
6. Sessões curtas e rejogáveis.
7. O corpo de Luana nunca é a piada; a situação é.

## MVP de sete dias

- Luana;
- uma sequência curta de Beach Run;
- auto-run;
- pulo variável e slide;
- Pressure funcional;
- papel higiênico, água e café;
- obstáculos simples e ao menos um NPC;
- um fail;
- um banheiro/success;
- reinício rápido;
- APK testável em aparelho físico.

