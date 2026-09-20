# Luana — Especificação de animação jogável

Atualizado em: 2026-09-19

## Regra central

Luana não é uma ilustração de corrida. Ela é o avatar de um auto-runner lateral: corre automaticamente, salta obstáculos baixos e desliza sob obstáculos altos. A arte precisa servir essas três ações e suas transições.

## Pacote obrigatório do prólogo

| Ação | Função na fase | Entrega PNG |
| --- | --- | --- |
| Corrida | estado contínuo e base de todo o movimento | 16 quadros em loop |
| Salto curto | ultrapassar obstáculo baixo sem ganho máximo de distância | 16 quadros com aterrissagem |
| Salto prolongado | atravessar vãos ou obstáculos mais largos; acionado ao segurar | 16 quadros, topo sustentado e aterrissagem |
| Slide | passar sob gaivota e outros perigos altos | 16 quadros: entrada, loop baixo e saída |

## Contrato técnico de todos os quadros

- canvas de 351 × 281 px enquanto estiver em estudo;
- linha de chão idêntica em todos os estados que tocam o solo;
- pivô no centro entre os pés para corrida, entrada e saída do slide;
- alfa real, sem fundo de produção e sem halo magenta;
- cabelo, roupa, proporção e contorno preservados em todos os estados;
- corrida continua sendo a única animação em loop; salto e slide são sequências de entrada/saída.

## Critério de aprovação

O conjunto só é aprovado quando as três transições de controle rodam no laboratório HTML e numa cena isolada do Godot sem salto de escala, mudança de anatomia, congelamento de pose ou borda colorida visível.
