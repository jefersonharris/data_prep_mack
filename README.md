# My Data Prep

Projeto de apoio para os exercícios de data prep com ambiente em `Dev Container` e banco `PostgreSQL`.

## Estrutura

- `.devcontainer/` - configuração do ambiente de desenvolvimento
- `db-scripts/` - scripts SQL executados na inicialização do banco
- `scripts/` - comandos auxiliares para subir e derrubar o banco

## Pré-requisitos

- Docker e Docker Compose instalados.
- VS Code com a extensão `Dev Containers`.

## Como rodar (modo recomendado)

1. Abra o projeto no VS Code.
2. Com a extensão `Dev Containers` instalada, use o comando `Dev Containers: Rebuild and Reopen in Container`.
3. Aguarde o container `app` subir e o Postgres inicializar.

## Scripts úteis

Subir o banco:

```bash
./scripts/db_up.sh
```

Derrubar o banco sem apagar os dados:

```bash
./scripts/db_down.sh
```

## Comandos manuais do Docker Compose

Executados a partir da raiz do projeto:

- Subir `app` e `db`:  
  `docker compose -f .devcontainer/docker-compose.yml up -d`

- Subir apenas o Postgres (útil para testes rápidos):  
  `docker compose -f .devcontainer/docker-compose.yml up -d db`

- Parar containers (mantém os dados):  
  `docker compose -f .devcontainer/docker-compose.yml stop`

- Derrubar containers (mantém os dados):  
  `docker compose -f .devcontainer/docker-compose.yml down`

- Derrubar containers **e apagar o volume** `postgres-data` (reaplica os scripts de inicialização na próxima subida):  
  `docker compose -f .devcontainer/docker-compose.yml down -v`

- Ver logs do Postgres:  
  `docker compose -f .devcontainer/docker-compose.yml logs -f db`

## Como recriar o ambiente do zero

1. Certifique-se de que os containers estão parados:  
   `docker compose -f .devcontainer/docker-compose.yml down`
2. Remova o volume para reaplicar os scripts SQL de `db-scripts/`:  
   `docker compose -f .devcontainer/docker-compose.yml down -v`
3. Suba novamente:  
   `docker compose -f .devcontainer/docker-compose.yml up -d`
4. (Opcional) Reabra no VS Code via `Dev Containers: Reopen in Container`.

## Troubleshooting rápido

- Porta 5434 já em uso no host: altere `ports` em `.devcontainer/docker-compose.yml` ou libere a porta antes de subir.
- Alterei scripts em `db-scripts/` e quero reaplicar: execute `down -v` para remover o volume e depois `up -d`.
- Precisa do cliente psql no container `app`: ele é instalado automaticamente pelo `postCreateCommand`; se falhar, rode dentro do container `sudo apt-get update && sudo apt-get install -y postgresql-client`.

## Banco de dados

Configuração padrão do Postgres:

- Host: `db`
- Porta: `5432`
- Database: `datawarehouse`
- Usuário: `postgres`
- Senha: `password123`

## Observação

Os arquivos `.sql` em `db-scripts/` são executados apenas na primeira criação do volume do Postgres.
Se quiser reaplicar os scripts do zero, é necessário remover o volume antes de subir novamente.
