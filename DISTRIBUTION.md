# Distribuição de testes

Atualizado em: 2026-09-19

## Estratégia escolhida

- **GitHub privado:** código-fonte, documentação, histórico e colaboração.
- **itch.io não listado ou restrito:** página simples para distribuir o APK aos testadores.
- **APK Android:** instalação manual durante a sprint.
- **Play Store:** fora do escopo desta primeira versão.

O GitHub não deve conter credenciais, keystores ou senhas. Builds podem ser anexadas a uma release privada para arquivo interno, mas o itch.io será o ponto de entrega para os testadores.

## Tipo de build

Durante desenvolvimento, usar `Android Test APK`, assinado para depuração. Essa build é adequada para testes manuais e não deve ser tratada como release final de loja.

Configuração atual:

- pacote: `com.igonoz.bathroommayhem`;
- versão: `0.1.0-test`;
- código: `1`;
- arquitetura inicial: ARM64;
- orientação: retrato;
- modo imersivo: ligado;
- SDK mínimo efetivo do template Godot 4.7: Android 7.0 / API 24.
- SDK-alvo efetivo: API 36.

## Dependências locais instaladas

- templates Android oficiais do Godot 4.7 em `~/.local/share/godot/export_templates/4.7.stable`;
- Temurin OpenJDK 17 em `~/.local/share/bathroom-devtools/jdk17`;
- Android SDK em `~/.local/share/bathroom-devtools/android-sdk`;
- Platform Tools, Build Tools 35.0.1 e Platform 35;
- caminhos Java e Android registrados no editor Godot 4.7.

## Build atual

> **OBSOLETA — não distribuir para avaliação de gameplay.** A build atual valida apenas exportação Android e assets; ainda contém o protótipo de movimentação livre que contradiz o auto-runner canônico.

- Arquivo: `builds/android/BathroomMayhem-test.apk`
- Tamanho: aproximadamente 40 MB.
- SHA-256: `82be6782c5d16838d8aa198459d74fd54e5f6fb347f7cf60a27552be2eec2dbe`
- Pacote: `com.igonoz.bathroommayhem`
- Versão: `0.1.0-test` (`versionCode` 1).
- Assinatura de depuração verificada com APK Signature Scheme v2 e v3.
- Cena inicial inspecionada por captura do renderizador real após correções de borda e contraste.
- Pendente: instalar e testar em aparelho físico.

## Geração pelo editor

1. Abrir o projeto no Godot.
2. Acessar **Project > Export**.
3. Selecionar **Android Test APK**.
4. Corrigir avisos de dependências, se houver.
5. Exportar para `builds/android/BathroomMayhem-test.apk`.
6. Instalar em aparelho físico e executar o roteiro de teste.

## Geração pela linha de comando

Depois que as dependências estiverem configuradas:

```bash
mkdir -p builds/android
./godot_bin/Godot_v4.7-stable_linux.x86_64 --headless --path . \
  --export-debug "Android Test APK" builds/android/BathroomMayhem-test.apk
```

## Publicação no itch.io

Criar inicialmente uma página como **Draft** ou **Restricted**, tipo “Downloadable”, plataforma Android. Enviar o APK e marcar claramente como teste fechado/pré-alpha. Não tornar pública até validar instalação, abertura, controles e reinício em pelo menos um aparelho real.

O texto e os metadados da página estão preparados em `ITCH_PAGE.md`. O fluxo de autenticação e envio está documentado em `GIT_AND_ITCH_SETUP.md`. O script `tools/publish_itch.sh` bloqueia intencionalmente o APK top-down obsoleto.

Página Draft criada em: `https://igonoz.itch.io/bathroom-mayhem-full-pressure`. Nenhum APK foi publicado ainda.

## Roteiro mínimo de teste

- [ ] APK instala sem erro.
- [ ] Jogo abre em retrato.
- [ ] Interface não invade recortes ou barras do sistema.
- [ ] Luana corre automaticamente para a direita.
- [ ] Toque curto executa pulo.
- [ ] Segurar prolonga o pulo.
- [ ] Swipe para baixo executa slide.
- [ ] Duplo toque executa `Controlled Relief`.
- [ ] Não aparece joystick virtual.
- [ ] Coletáveis, NPCs e obstáculos respondem ao movimento lateral.
- [ ] Vitória e derrota são alcançáveis.
- [ ] Toque reinicia a partida.
- [ ] Fechar e reabrir o aplicativo funciona.
- [ ] Desempenho permanece estável por cinco partidas.
