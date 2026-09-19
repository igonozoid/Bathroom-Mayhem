# Referências do chat 00

Coloque aqui os arquivos exportados de **“00 — Conceito, Naming e Planejamento Inicial”**. Esta árvore possui `.gdignore`, portanto o Godot não importará nem incluirá automaticamente esses masters no APK.

## Organização

- `characters/`: pranchas canônicas de Luana e outros personagens;
- `gameplay/`: mockups, movimentos, controles e telas de gameplay;
- `environments/`: praia, calçadão, quiosques, festival, hotel e banheiro;
- `branding/`: logos, capas, tipografia e estudos de nome;
- `other/`: material que ainda não foi classificado.

## Nomes recomendados

```text
characters/LUANA_CANON_01.png
characters/LUANA_2D_APPROVED_01.png
gameplay/GAMEPLAY_VERTICAL_MOCKUP_01.png
environments/BEACH_RUN_REFERENCE_01.png
branding/LOGO_REFERENCE_01.png
```

Não substitua arquivos existentes. Adicione versões numeradas. Depois da revisão, os assets realmente usados no jogo serão derivados para `assets/`.

O conteúdo recuperado automaticamente está em [`archive/`](archive/README.md).

## Importação manual de 2026-09-19

As 45 imagens salvas manualmente a partir do chat foram revisadas e movidas, sem exclusão ou conversão, para [`source_images/`](source_images/). Os nomes agora descrevem o assunto, o personagem e o horário original; a classificação completa, incluindo contradições, duplicatas e indicação do que realmente pode orientar o MVP, está em [`IMAGE_CATALOG.md`](IMAGE_CATALOG.md).

As pranchas já promovidas para `characters/` continuam intocadas. `source_images/` é o lote histórico integral e não é importado pelo Godot.

Resumo: 44 conteúdos únicos, uma duplicata exata, duas versões incorretas de Rebecca, uma versão intermediária de Aurora substituída por Nina e várias cenas coletivas úteis somente como referência narrativa.
