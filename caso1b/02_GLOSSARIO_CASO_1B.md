# Glossario do Caso 1B

## O que e este arquivo
Este glossario explica, em linguagem simples, os principais termos e siglas usados no caso da Universidade Internacional do Conhecimento.

Ele serve para quem nao tem familiaridade com modelagem de dados, banco de dados ou sistemas academicos.

## Termos e siglas

### DER
Sigla para `Diagrama Entidade-Relacionamento`.

Em termos simples:
- E um desenho que mostra quais sao os elementos principais do sistema.
- Tambem mostra como esses elementos se conectam.

Exemplo:
- Aluno se matricula em Turma.
- Professor leciona Turma.

### Entidade
Uma entidade e algo importante do sistema que precisa ser registrado.

Exemplos:
- Aluno
- Professor
- Curso
- Disciplina
- Turma

### Atributo
Atributo e uma informacao que descreve uma entidade.

Exemplos:
- Nome do aluno
- CPF do professor
- Codigo da disciplina
- Carga horaria do curso

### Relacionamento
Relacionamento e a ligacao entre duas entidades.

Exemplos:
- Um aluno pertence a um curso.
- Uma turma esta ligada a uma disciplina.
- Um professor pode lecionar uma turma.

### Cardinalidade
Cardinalidade mostra quantas ocorrencias de uma entidade podem se relacionar com outra.

Exemplos comuns:
- `1:1` = um para um
- `1:N` = um para muitos
- `N:N` = muitos para muitos

### 1:1
Significa que um registro se relaciona com apenas um outro registro.

Exemplo:
- Um cadastro pode ter um unico complemento exclusivo.

### 1:N
Significa que um registro pode estar ligado a varios outros.

Exemplo:
- Um curso pode ter varias disciplinas.

### N:N
Significa que muitos registros de um lado podem se ligar a muitos do outro lado.

Exemplo:
- Um aluno pode cursar varias turmas.
- Uma turma pode ter varios alunos.

### Auto-relacionamento
E quando uma entidade se relaciona com ela mesma.

Exemplo no caso:
- Uma disciplina pode exigir outra disciplina como pre-requisito.

### Chave primaria
Tambem chamada de `PK`, do ingles `Primary Key`.

E o campo que identifica cada registro de forma unica.

Exemplo:
- `id_aluno`
- `id_disciplina`

### Chave estrangeira
Tambem chamada de `FK`, do ingles `Foreign Key`.

E um campo que aponta para o registro de outra tabela, criando a ligacao entre elas.

Exemplo:
- A tabela `turma` pode guardar o `id_disciplina`.

### PK
Sigla para `Primary Key`.

Em portugues:
- Chave primaria

Funcao:
- Identificar um registro sem repetir.

### FK
Sigla para `Foreign Key`.

Em portugues:
- Chave estrangeira

Funcao:
- Conectar tabelas entre si.

### Modelo relacional
E a versao do DER transformada em tabelas.

Ou seja:
- O DER mostra a ideia.
- O modelo relacional mostra como isso vira banco de dados.

### Tabela associativa
E uma tabela criada para resolver relacoes `N:N`.

Exemplo:
- `matricula`

Ela pode ligar:
- aluno
- turma

E ainda guardar:
- nota
- status
- creditos

### Normalizacao
E o processo de organizar os dados para evitar repeticao desnecessaria, erros e confusoes.

Objetivo:
- deixar o banco mais limpo
- evitar redundancia
- facilitar manutencao

### 1FN
Sigla para `Primeira Forma Normal`.

Significa, de forma simples:
- cada campo guarda apenas um valor
- nao existem grupos repetidos dentro da mesma coluna

### 2FN
Sigla para `Segunda Forma Normal`.

Significa, de forma simples:
- os atributos dependem da chave inteira, e nao apenas de uma parte dela

### 3FN
Sigla para `Terceira Forma Normal`.

Significa, de forma simples:
- os atributos dependem diretamente da chave primaria
- evita dependencias indiretas entre colunas

### Regra de negocio
E uma condicao que o sistema precisa obedecer.

Exemplos do caso:
- Um aluno pode se matricular em varias disciplinas no semestre.
- Uma disciplina pode ter pre-requisitos.
- Uma turma possui limite de vagas.

### Requisito
E algo que o problema pede como obrigatorio.

Exemplos:
- controlar alunos
- controlar professores
- representar turmas
- aplicar normalizacao ate 3FN

### Matricula
E o registro de que um aluno entrou em uma disciplina ou turma.

No modelo de dados, a matricula normalmente vira uma tabela propria.

### Historico academico
E o conjunto de informacoes sobre o percurso do aluno.

Pode incluir:
- disciplinas cursadas
- aprovacoes e reprovacoes
- notas
- creditos
- status no curso

### Curso
E o programa academico do aluno.

Exemplos:
- Administracao
- Engenharia de Dados

Um curso pode ter:
- varias disciplinas
- uma carga horaria total
- um departamento responsavel

### Disciplina
E cada materia ou unidade de ensino do curso.

Exemplos:
- Banco de Dados
- Estatistica
- Programacao

### Turma
E a oferta de uma disciplina em um periodo especifico.

Uma turma normalmente tem:
- disciplina
- professor
- semestre
- horario
- local
- vagas

### Pre-requisito
E uma disciplina que o aluno precisa concluir antes de cursar outra.

Exemplo:
- Para cursar `Banco de Dados II`, talvez precise ter sido aprovado em `Banco de Dados I`.

### Carga horaria
E a quantidade total de horas de estudo ou aula.

Pode existir em:
- curso
- disciplina

### Creditos
Sao unidades usadas para medir o peso academico de uma disciplina.

Em muitos sistemas:
- cada disciplina vale certa quantidade de creditos
- o aluno acumula esses creditos ao ser aprovado

### Vagas
E o numero maximo de alunos que podem entrar em uma turma.

### Status do aluno no curso
Indica a situacao academica do aluno.

Exemplos:
- ativo
- trancado
- formado

### Escalavel
Quer dizer que o sistema consegue crescer sem perder organizacao.

Exemplo:
- continuar funcionando bem mesmo com mais alunos, turmas e disciplinas.

### Eficiente
Quer dizer que o modelo foi pensado para funcionar bem, com menos repeticao e menos risco de erro.

## Nome correto para esse tipo de material
O nome mais comum para esse tipo de arquivo e:

- `Glossario`

Em alguns contextos, tambem pode aparecer como:
- `Lista de termos`
- `Dicionario de termos`
- `Glossario de siglas e conceitos`
