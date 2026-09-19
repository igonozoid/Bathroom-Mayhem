# Arquivo do chat 00

Arquivo local de **“00 — Conceito, Naming e Planejamento Inicial”**.

## Conteúdo preservado

- `history_raw/`: 19 páginas JSON, 95 turnos, em ordem da página mais recente para a mais antiga;
- `attachments/`: 10 anexos recuperados da conversa, incluindo duplicatas;
- `generated_images/`: 11 imagens geradas durante a continuação local no Codex, incluindo tentativas descartadas;
- `export-manifest-v2.json`: cursores, contagens, caminhos originais e metadados da exportação;
- `CHECKSUMS.sha256`: hashes para verificar integridade.

O diretório `history/` contém apenas a primeira tentativa inválida de exportação e foi mantido para auditoria. O histórico válido está em `history_raw/`.

## Limitações da fonte

Este é o conteúdo integral disponibilizado ao Codex pela interface de leitura do histórico. A ferramenta limita cada mensagem recuperada a 20.000 caracteres; mensagens excepcionalmente longas podem conter indicação de truncamento no JSON. Os anexos foram copiados a partir dos arquivos disponibilizados pelo aplicativo e podem ser previews, não necessariamente os masters originais enviados no chat.

Por isso, preserve também qualquer exportação original do ChatGPT e os arquivos visuais originais que você tiver. Coloque-os nas pastas irmãs de `from_chat_00/`; não sobrescreva o arquivo bruto.

## Personagens promovidos

Cópias das pranchas recuperadas foram organizadas em `../characters/`:

- `LUANA_CANON_PHOTO.png`
- `LUANA_CANON_SHEET.png`
- `ZAYA_CANON_SHEET.png`
- `REBECCA_CANON_SHEET.png`
- `NINA_CANON_SHEET.png`
- `THEO_CANON_SHEET.png`

