# Catálogo visual — importação manual do chat 00

Revisado em: 2026-09-19

## Como ler este catálogo

Este documento classifica as 45 imagens adicionadas manualmente. Elas foram preservadas em `source_images/`, agrupadas por assunto e personagem e renomeadas de forma descritiva; o sufixo de horário original foi mantido para cruzamento com esta tabela. Nenhuma imagem foi apagada ou convertida.

- **Cânone visual**: pode orientar novas artes, respeitando as ressalvas registradas.
- **Conceito aprovado**: define bem composição, linguagem ou UX, mas não é asset recortável.
- **Estudo útil**: contém ideias aproveitáveis; não deve ser copiado como verdade canônica.
- **Referência narrativa**: ajuda a preservar personagem/relação, mas está fora do MVP de sete dias.
- **Contraditória**: conflita com decisões atuais ou com uma ficha canônica posterior.
- **Duplicata**: arquivo idêntico a outro; preservado apenas como registro.

Nenhuma imagem gerada deve ser usada diretamente como spritesheet/tileset sem separação, limpeza de bordas, normalização de escala e teste no Godot. Textos desenhados dentro das imagens também não são fonte confiável de dados.

## Decisões de maior impacto

1. A direção de jogo válida é a do mockup vertical sem joystick: auto-run lateral, toque, segurar, swipe para baixo e duplo toque.
2. A estética de produção permanece **2D cartoon estilizado**, com contornos fortes. Pixel art e fotorrealismo são apenas referências.
3. A Luana atual tem 19 anos, cerca de 1,60 m, corpo curvilíneo/chubby atlético, cabelo preto longo com reflexos azuis e olhos azuis. Pesos e idades divergentes impressos nas pranchas antigas não prevalecem sobre `CANON.md` e `ART_BIBLE.md`.
4. Rebecca canônica tem 50 anos e cerca de 1,25 m. As versões de 27 anos e/ou 1,70 m estão rejeitadas.
5. Aurora foi uma etapa intermediária que resultou em Nina; não é personagem separada no cânone atual.
6. As cenas coletivas de garagem são memória narrativa, não referência anatômica: várias alteram rostos, escala e composição entre gerações.

## Gameplay, interface e ambiente

| Horário no arquivo | Assunto | Classificação | Ponderação / uso correto |
|---|---|---|---|
| `00_57_16` | Comparativo A/B/C de gameplay vertical | **Conceito aprovado** | Melhor registro da tela 9:16 e dos quatro gestos. Usar o enquadramento B como ponto de partida; reduzir ruído do cenário e não desenhar instruções permanentes sobre a área jogável. |
| `00_58_06` | Concept board geral | **Contraditória parcial** | Boa referência de tom, logo, capítulos e elenco; a tela central é horizontal e usa joystick/botão, contrariando o auto-run por gestos. Não usar como especificação de controle. |
| `01_00_40` | Tileset tropical em pixel art | **Estudo útil** | Bom inventário de categorias e camadas de parallax. Rejeitado como asset final: pixel art conflita com a direção cartoon, há escalas/perspectivas mistas e as peças não constituem atlas técnico validado. |
| `01_01_34` | Folha de movimentos da Luana | **Estudo útil** | Boa lista de estados e leitura lateral. Roupa preta, proporções e quadros irregulares não são o visual do vertical slice; serve para planejar animações, não para recorte direto. |

## Luana

| Horário no arquivo | Classificação | Ponderação / uso correto |
|---|---|---|
| `01_02_25` | **Cânone visual com ressalvas** | Boa consolidação PHOTO/3D/2D e detalhes faciais. O peso textual é histórico e não deve governar o sprite. |
| `01_02_47` | **Cânone visual com ressalvas** | Uma das melhores bases de rosto, corpo e variações. É exatamente igual a `01_03_12`. |
| `01_03_12` | **Duplicata** | SHA-256 idêntico a `01_02_47`; manter apenas como registro de exportação. |
| `01_03_23` | **Cânone visual com ressalvas** | Referência forte para cabelo, olhos, sardas, piercing e silhueta. A ficha imprime cerca de 58 kg, mas o cânone não fixa peso. |
| `01_09_27` | **Referência narrativa legada** | Prancha de Luca, o irmão associado à versão anterior do enredo; não é Luana e não entra no MVP. |
| `01_12_30` | **Cânone visual** | Boa ficha fotográfica/casual da Luana e útil para consistência facial. |
| `01_12_51` | **Cânone visual** | Segunda ficha de Luana; complementa ângulos e roupas, sem substituir a folha canônica já promovida. |
| `01_13_06` | **Cânone visual — foto** | Referência informal coerente de rosto/corpo. Fotorrealismo não é estilo de gameplay. |
| `01_13_22` | **Cânone visual — foto** | Referência informal alternativa coerente. Usar para identidade, não para textura ou sprite. |

## Elenco — fichas individuais

| Horário no arquivo | Personagem | Classificação | Ponderação / uso correto |
|---|---|---|---|
| `01_03_43` | Zaya | **Cânone visual** | Coerente com 18 anos, ~1,70 m, corpo muito magro, olhos mel, cabelo preto e vitiligo. |
| `01_03_59` | Rebecca | **Cânone visual** | Versão correta: 50 anos, ~1,25 m, forte/curvilínea, loira, sardas e olhos verdes. |
| `01_04_14` | Rebecca | **Contraditória** | Mostra 27 anos e ~1,70 m; invalida idade e nanismo. Não usar. |
| `01_04_25` | Rebecca | **Contraditória** | Mantém ~1,25 m, mas reduz Rebecca a 27 anos e muda excessivamente sua identidade para biker jovem. Substituída pela ficha canônica. |
| `01_04_41` | Nathan | **Cânone visual** | Coerente com ~2,10 m, ascendência somaliana, cabeça raspada/tatuada, barba grisalha, corpo grande e estética biker. |
| `01_05_00` | Nathan | **Cânone visual com ressalvas** | Variação válida da ficha; conferir sempre altura e silhueta contra `01_04_41`. |
| `01_08_39` | Nathan | **Cânone visual — foto** | Boa referência fotográfica tardia; não usar o realismo no jogo. |
| `01_08_54` | Rebecca | **Cânone visual — foto** | Boa referência tardia da Rebecca adulta; preservar baixa estatura e idade. |
| `01_09_09` | Fillipo | **Referência narrativa** | Pai de Luana/Luca na versão extensa do universo. Fora do MVP. |
| `01_10_00` | Theo | **Referência narrativa legada** | O chat contém versões conflitantes de idade (15 e 28). A arte não entra em produção até a ficha narrativa ser fechada. |
| `01_10_20` | Theo | **Referência narrativa legada** | Mesma restrição de idade/continuidade; útil apenas para aparência familiar. |
| `01_10_39` | Kaiko | **Referência narrativa** | Personagem lateral ainda sem papel no vertical slice. |
| `01_10_52` | Tainá | **Referência narrativa** | Mãe de Luana/Luca no universo anterior; fora do MVP. |
| `01_11_09` | Nina | **Cânone visual com ressalvas** | Mulher adulta com nanismo, cabelo loiro cacheado, olhos azuis e sardas. Confirmar a ficha já promovida em `characters/`. |
| `01_11_27` | Aurora | **Contraditória / substituída** | Etapa intermediária; a conversa a converteu em Nina. Não tratar como nova personagem. |
| `01_11_52` | Zaya | **Cânone visual — foto** | Boa referência casual, mantendo corpo magro e vitiligo. |
| `01_12_06` | Ariella | **Estudo não canonizado** | Não há decisão suficiente que a coloque no roster atual. Preservar como exploração, sem produção. |
| `01_12_16` | Zaya | **Cânone visual — foto** | Segunda referência casual consistente da Zaya. |
| `01_13_38` | Maya | **Referência narrativa** | Ficha aprovada no chat como `CHR-MAYA-001`, mas sem função no MVP atual. |
| `01_13_51` | Maya | **Referência narrativa** | Variação da ficha-base; não confundir Maya com Luana. |
| `01_14_11` | Maya | **Referência narrativa — foto** | Foto informal aprovada para a personagem; fora do MVP. |
| `01_14_24` | Maya | **Referência narrativa — foto** | Segunda foto informal; fora do MVP. |

## Nathan, Rebecca e cenas de garagem

| Horário no arquivo | Classificação | Ponderação / uso correto |
|---|---|---|
| `01_05_25` | **Referência narrativa** | Prancha conjunta útil para relação e contraste de escala; conferir identidades nas fichas individuais. |
| `01_05_49` | **Referência narrativa** | Variação conjunta; boa para poses, não para fixar anatomia. |
| `01_06_08` | **Referência narrativa** | Variação conjunta adicional; escala e estilo variam. |
| `01_06_18` | **Referência narrativa** | Cena do casal na garagem; preserva clima, mas não é modelo técnico. |
| `01_06_40` | **Estudo com inconsistências** | Foto coletiva; algumas alturas/rostos não correspondem perfeitamente às fichas. |
| `01_06_49` | **Estudo com inconsistências** | Outra tentativa coletiva; não usar como referência-mãe. |
| `01_07_07` | **Estudo com inconsistências** | Grupo em frente à garagem; útil para ambientação. |
| `01_07_25` | **Estudo com inconsistências** | Variação de grupo; escala e elenco devem ser validados individualmente. |
| `01_07_51` | **Estudo com inconsistências** | Retrato coletivo; composição útil, fidelidade variável. |
| `01_08_18` | **Estudo com inconsistências** | Retrato do núcleo; não substituir fichas individuais. |

## Uso imediato no projeto de sete dias

Para o APK de teste, somente estas referências devem guiar produção agora:

- `00_57_16`: enquadramento vertical e gestos;
- fichas canônicas de Luana (`01_02_25`, `01_02_47`, `01_03_23`, `01_12_30`, `01_12_51`), subordinadas ao texto atual do cânone;
- `01_01_34`: apenas vocabulário de poses;
- `01_00_40`: apenas lista de elementos ambientais, nunca como tileset final;
- elenco adicional e garagem: arquivados para depois do vertical slice.

## Integridade do lote

- 45 PNGs importados manualmente;
- 44 conteúdos únicos;
- 1 duplicata exata: `01_02_47` = `01_03_12` (`9d298a6ff570…`);
- nenhum original removido;
- as referências permanecem fora da importação do Godot por causa de `references/.gdignore`.
- não há mais PNGs soltos na raiz de `from_chat_00/`.
