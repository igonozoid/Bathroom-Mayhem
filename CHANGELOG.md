# Histórico de mudanças

Mudanças relevantes no projeto e em sua documentação.

## 2026-09-18

### Adicionado

- estrutura inicial de documentação;
- escopo provisório para uma versão publicável;
- plano de produção em 7 dias;
- backlog priorizado;
- registro de decisões.
- projeto Godot 4.7 editável com cena principal e script de gameplay;
- atlas original de sprites com temática de banheiro;
- protótipo vertical com movimento, coleta, obstáculos, perigo e reinício;
- `.gitignore` para arquivos gerados pelo Godot e builds locais.
- configuração mobile em retrato com resolução lógica 540 × 960;
- controle virtual por toque/arraste e reinício por toque;
- HUD responsivo com ancoragem e margens para telas móveis.
- preset `Android Test APK` para builds ARM64 de desenvolvimento;
- estratégia de distribuição por itch.io restrito/não listado e código no GitHub privado;
- roteiro mínimo de instalação e teste em aparelho físico.
- ambiente local de exportação Android sem `sudo`;
- primeiro APK ARM64 de teste, assinado e verificado.
- portões de qualidade e modo de captura visual automatizada pelo renderizador real.
- correção de tiles cortados na borda e aumento de contraste das instruções móveis após inspeção visual.
- direção estética oficial em cartoon 2D tropical;
- folha-base de 12 poses da Luana com identidade canônica;
- tileset e props de Beach Run;
- logo `Bathroom Mayhem: Full Pressure`, ícone Android e atlas de HUD;
- ícone do aplicativo configurado no projeto Godot.
- background vertical inicial de Beach Run e atlas de efeitos de movimento/Pressure.

## 2026-09-19

### Corrigido

- cânone restaurado como auto-runner 2D lateral sempre para a direita;
- joystick/arraste marcados como direção descartada;
- APK top-down marcado como obsoleto para avaliação de gameplay;
- controles canônicos registrados: tap, hold, swipe down e duplo toque.

### Adicionado

- `CANON.md` como fonte de verdade local;
- `references/from_chat_00/` para receber o material exportado do chat de conceito sem importação pelo Godot.
- arquivo bruto do chat 00 com 19 páginas, 95 turnos, 10 anexos e 11 gerações visuais;
- pranchas recuperadas de Luana, Zaya, Rebecca, Nina e Theo organizadas como referências canônicas;
- manifesto e hashes SHA-256 para auditoria do arquivo.
- auditoria das 45 imagens adicionadas manualmente ao arquivo do chat 00;
- catálogo visual por imagem com separação entre cânone, conceito, estudo, referência narrativa, contradição e duplicata;
- identificação de 44 conteúdos únicos, uma duplicata exata e versões contraditórias de Rebecca/Aurora;
- seleção explícita das referências que podem orientar o vertical slice de sete dias.
- configuração inicial de Git/Git LFS com exclusão da engine portátil, builds e segredos;
- licença proprietária e registro inicial de componentes de terceiros;
- rascunho completo da página de teste no itch.io;
- roteiro de criação dos projetos GitHub/itch.io e script de publicação com bloqueio do APK obsoleto.

### Alterado

- objetivo do projeto passou a ser uma versão publicável em 7 dias;
- conceito anterior foi marcado para revisão após uma mudança drástica de direção.
