# Distribuição de testes

Atualizado em: 2026-09-19

## Estratégia escolhida

- **GitHub privado:** código-fonte, documentação, histórico e colaboração.
- **itch.io não listado ou restrito:** canal futuro, somente após validar o MVP Linux.
- **Linux x86-64:** distribuição local atual para testes no Dell.
- **Play Store:** fora do escopo desta primeira versão.

O GitHub não deve conter credenciais, keystores ou senhas. Nesta etapa, a entrega é local; itch.io só entra quando houver uma build revisada e aprovada para distribuição.

## Tipo de build

Durante desenvolvimento, usar `Linux Test` para execução fora do editor. Android permanece configurado, mas está fora do ciclo ativo de teste.

Configuração atual:

- arquitetura: x86-64;
- orientação: retrato;
- formato: executável ELF e arquivo `.pck` adjacente.

## Dependências locais instaladas

- templates oficiais Godot 4.7, incluindo `linux_debug.x86_64`, em `~/.local/share/godot/export_templates/4.7.stable`;
- Godot portable em `godot_bin/`.

As dependências Android instaladas permanecem preservadas para uma futura fase móvel, mas não são necessárias para o ciclo atual.

## Build anterior

O APK Android permanece arquivado apenas como registro técnico e não deve ser distribuído ou usado para avaliação.
- Cena inicial inspecionada por captura do renderizador real após correções de borda e contraste.
- Pendente: instalar e testar em aparelho físico.

## Geração pelo editor

1. Abrir o projeto no Godot.
2. Acessar **Project > Export**.
3. Selecionar **Linux Test**.
4. Corrigir avisos de dependências, se houver.
5. Exportar para `builds/linux/BathroomMayhem.x86_64`.
6. Executar o binário mantendo o arquivo `.pck` ao lado dele.

## Geração pela linha de comando

Na raiz do projeto:

```bash
mkdir -p builds/linux
./godot_bin/Godot_v4.7-stable_linux.x86_64 --headless --path . \
  --export-debug "Linux Test" builds/linux/BathroomMayhem.x86_64
```

## Execução local

No diretório `builds/linux`, executar:

```bash
./BathroomMayhem.x86_64
```

O arquivo `BathroomMayhem.pck` precisa permanecer no mesmo diretório. Nenhum envio ao itch.io será feito neste marco.

## Roteiro mínimo de teste

- [ ] Executável abre fora do editor.
- [ ] Jogo abre na janela em retrato.
- [ ] Luana corre automaticamente para a direita.
- [ ] Espaço executa pulo e segurá-lo prolonga o salto.
- [ ] Seta para baixo executa slide.
- [ ] `F` executa `Controlled Relief`.
- [ ] Não aparece joystick virtual.
- [ ] Coletáveis, NPCs e obstáculos respondem ao movimento lateral.
- [ ] Vitória e derrota são alcançáveis.
- [ ] `R` reinicia a partida e Enter avança pelas telas.
- [ ] Fechar e reabrir o jogo funciona.
- [ ] Desempenho permanece estável por cinco partidas.
# Build atual de teste

- Arquivo principal: `builds/linux/BathroomMayhem.x86_64` e `builds/linux/BathroomMayhem.pck` (arquivos locais ignorados pelo Git).
- Execução: `./builds/linux/BathroomMayhem.x86_64` no diretório do projeto.
- Alvo: Linux x86-64; Android está suspenso nesta fase.
- Data: 2026-09-19.
- SHA-256: `edaf3670eefe230dc711319e7bd4d08e546652a1c93922910d07baaf2d775fa0`.
- Conteúdo: build de revisão da fase única, com quatro trechos de percurso, logo no menu, HUD de trecho e ciclo inicial de corrida.
- Estado: exportado; **não é candidata a publicação**. Requer abertura, revisão visual e uma partida completa com teclado fora do editor conforme `RECOVERY_PLAN.md`.
