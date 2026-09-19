# Reinício da produção visual

Atualizado em: 2026-09-19

## Decisão

O vertical slice deixa de receber mudanças de gameplay até possuir um kit visual coerente. A ordem anterior — mecânicas primeiro, arte provisória depois — produziu uma demonstração técnica, não um jogo reconhecível.

O runtime continua no Godot, pois ele já exporta para Linux e atende ao jogo 2D. Não há ganho em migrar agora para HTML/JavaScript ou GDevelop: isso repetiria a fase de infraestrutura e atrasaria a produção visual.

## Formato dos assets

- **SVG modular:** HUD, ícones, botões, molduras, sinalização, itens simples e partes separadas do personagem.
- **PNG em camadas raster:** fundos pintados, nuvens, montanhas, multidão e texturas de areia/água. SVG não é a escolha certa para tentar reproduzir pintura detalhada.
- **Luana:** conjunto de SVGs independentes (cabeça, cabelo, tronco, braços, pernas, tênis e acessórios), montados como cutout/rig no Godot. Um único SVG com “camadas” não vira automaticamente um rig no Godot; os membros precisam existir como arquivos ou nós separados.

## Pacote que precisa existir antes de nova fase

1. Guia de proporções e paleta final da Luana.
2. Rig de Luana e poses-chave: corrida, salto curto, salto longo, slide, impacto e vitória.
3. Kit SVG da interface: barra Pressure, contadores, botão, pausa, cartão e moldura.
4. Objetos de gameplay: rolo de papel, água de coco, café, gaivota, cachorro e turista — todos com silhueta e dimensão definidas.
5. Telas completas: splash, menu, tutorial, pausa, derrota e vitória.
6. Fundos em três planos: céu/montanhas, praia/público e areia/primeiro plano.
7. Uma folha de composição da fase, definindo o que cada trecho mostra antes de codificar obstáculos.

## Portão de retorno ao Godot

Só voltamos a integrar gameplay quando houver uma prancha visual única com Luana, HUD, cenário e obstáculos vistos juntos. O primeiro teste seguinte deve avaliar leitura, ritmo e identidade; não exportação.

