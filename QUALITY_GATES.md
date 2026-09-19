# Portões de qualidade

Regra permanente: nenhum marco avança apenas porque compilou. Antes de continuar, a versão precisa ser executada, observada e revisada no nível adequado ao risco da mudança.

## Ciclo obrigatório

1. Implementar uma mudança pequena e verificável.
2. Validar importação, cenas e scripts com o Godot 4.7.
3. Executar o fluxo afetado.
4. Capturar e inspecionar visualmente quando houver alteração de arte, layout ou interface.
5. Corrigir erros, regressões e problemas de legibilidade encontrados.
6. Repetir os testes relevantes.
7. Atualizar tarefas, decisões e changelog.
8. Avançar somente quando o marco estiver adequado ao escopo atual.

## Critérios para avançar

- nenhum erro de script, cena ou exportação conhecido;
- fluxo principal executável do início ao fim;
- interface legível nas proporções móveis-alvo;
- controles funcionais no dispositivo de destino;
- build correspondente gerada e verificada;
- limitações não resolvidas explicitamente registradas;
- inspeção visual realizada para mudanças visuais.

## Captura local de QA

O jogo possui um argumento exclusivo para gerar uma captura do viewport usando o renderizador gráfico real:

```bash
./godot_bin/Godot_v4.7-stable_linux.x86_64 --path . -- --capture-preview
```

A captura é gravada em `/tmp/bathroom-mayhem-preview.png`. Esse modo não é acionado durante execução normal ou no APK.

## Limite atual

Enquanto o alvo é Linux, a build só pode ser considerada aprovada após executar fora do editor e passar pelo fluxo completo com teclado. A validação Android foi adiada; quando ela retornar, instalação e teste em aparelho físico serão obrigatórios antes de qualquer distribuição móvel.
