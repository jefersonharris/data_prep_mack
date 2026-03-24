# My Data Prep

Projeto de apoio para os exercícios de data prep com ambiente em `Dev Container` e banco `PostgreSQL`.

## Estrutura

- `.devcontainer/` - configuração do ambiente de desenvolvimento
- `db-scripts/` - scripts SQL executados na inicialização do banco
- `scripts/` - comandos auxiliares para subir e derrubar o banco

## Como rodar

1. Abra o projeto no VS Code.
2. Execute o comando `Dev Containers: Rebuild and Reopen in Container`.
3. Aguarde o container subir e o Postgres inicializar.

## Scripts úteis

Subir o banco:

```bash
./scripts/db_up.sh
```

Derrubar o banco sem apagar os dados:

```bash
./scripts/db_down.sh
```

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
