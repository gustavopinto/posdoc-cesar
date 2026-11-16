# Site · Pós-doutorado CESAR School

Site estático de uma página do pós-doutorado de Gustavo Pinto na CESAR School:
linhas de pesquisa, publicações e estudos em andamento.

## Estrutura

```
.
├── index.html            # Página única (linhas, publicações, em andamento; CSS inline)
├── Dockerfile            # nginx:alpine servindo o site estático
├── nginx.conf.template   # Config nginx (porta via $PORT, /health, cache)
└── railway.toml          # Configuração de deploy no Railway
```

Os demais arquivos da pasta (termos, dados de survey, `ai-ownership/`,
rascunhos de artigos) **não** fazem parte do site: o `.gitignore` e o
`.dockerignore` funcionam como whitelist e só liberam os arquivos acima.

## Rodar localmente

```bash
python3 -m http.server 8080
# ou via Docker (igual ao Railway)
docker build -t posdoc-site .
docker run -p 8080:8080 posdoc-site
```

Acesse http://localhost:8080

## Deploy no Railway

1. `git init && git add . && git commit -m "site"` (o `.gitignore` só deixa entrar o site).
2. Suba para um repositório e crie um projeto no [Railway](https://railway.com) a partir dele.
3. O `railway.toml` aponta para o `Dockerfile`; build e healthcheck (`/health`) são automáticos.
4. O Railway injeta `PORT`, consumida pelo `nginx.conf.template`.

## Adicionar uma publicação

Copie um `<div class="pub">` na seção Publicações de `index.html` e ajuste título,
autores, resumo e o selo de status (`status ok` = aceito, `status` = em submissão).
# posdoc-cesar
# posdoc-cesar
