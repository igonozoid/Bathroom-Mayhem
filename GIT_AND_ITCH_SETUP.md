# GitHub e itch.io — configuração segura

Atualizado em: 2026-09-19

## Estado preparado localmente

- Git iniciado na branch `main`;
- imagens e áudio configurados para Git LFS;
- engine portátil, builds, ferramentas, segredos e keystores ignorados;
- repositório destinado a ser **privado**;
- APK destinado primeiro a uma página itch.io **Draft**, depois **Restricted**.

Nunca envie senha, token, chave privada ou arquivo de assinatura pelo chat. Faça login apenas nas páginas e ferramentas oficiais.

## 1. Criar o repositório no GitHub

1. Entre em `github.com` no navegador.
2. Use **New repository**.
3. Nome sugerido: `Bathroom-Mayhem`.
4. Marque **Private**.
5. Não adicione README, `.gitignore` nem licença no site; esses arquivos já existem localmente.
6. Crie o repositório e copie a URL HTTPS exibida.
7. No terminal aberto nesta pasta, conecte e envie:

```bash
git remote add origin https://github.com/SEU-USUARIO/Bathroom-Mayhem.git
git push -u origin main
```

O GitHub solicitará autenticação oficial. Com HTTPS, use o fluxo do navegador/Git Credential Manager ou um token de acesso; nunca a senha comum da conta no terminal.

## 2. Criar a página no itch.io

1. Entre em `itch.io` e abra **Dashboard → Create new project**.
2. Copie os campos preparados em `ITCH_PAGE.md`.
3. Use o slug `bathroom-mayhem-full-pressure`, se estiver disponível.
4. Selecione **Downloadable**, Android e **In development**.
5. Deixe em **Draft** enquanto montamos a página e validamos o APK.
6. Depois do teste interno, altere para **Restricted** e distribua download keys aos testadores.

O Butler exige que a página já exista antes do primeiro envio.

## 3. Autenticar o Butler

A ferramenta está instalada localmente em `.tools/butler/butler` e é ignorada pelo Git:

```bash
./.tools/butler/butler login
```

O comando abre o navegador para autorização oficial do itch.io. Não cole credenciais em arquivos do projeto.

## 4. Publicar uma build aprovada

Crie um `.env` local a partir de `.env.example` e preencha somente usuário/subdomínio e slug — não há senha nesse arquivo:

```bash
cp .env.example .env
```

Depois que o APK canônico passar pelos portões de qualidade:

```bash
./tools/publish_itch.sh
```

O script recusa a publicação se a build estiver ausente, se os campos não estiverem preenchidos ou se o arquivo ainda for o APK obsoleto conhecido.

