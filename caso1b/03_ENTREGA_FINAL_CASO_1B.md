# Entrega Final - Caso 1B

## 1. Objetivo da solucao
Modelar um sistema de gestao academica para a Universidade Internacional do Conhecimento, cobrindo alunos, professores, cursos, disciplinas e turmas, com suporte a matriculas, pre-requisitos, ocupacao de vagas, notas e historico academico.

## 2. Requisitos consolidados do caso

### 2.1 Entidades e informacoes exigidas
- `Aluno`: informacoes pessoais, historico academico, matriculas e status no curso.
- `Professor`: informacoes pessoais, disciplinas lecionadas, turmas atribuidas e historico de ensino.
- `Curso`: nome, departamento responsavel, carga horaria total e lista de disciplinas.
- `Disciplina`: codigo, nome, ementa, pre-requisitos e carga horaria.
- `Turma`: ano, semestre, disciplina, professor, local e horarios.

### 2.2 Regras de negocio obrigatorias
- Um aluno pode se matricular em varias disciplinas por semestre.
- Uma disciplina pode ter varios alunos distribuidos em diferentes turmas.
- Uma disciplina pode depender de uma ou mais disciplinas pre-requisito.
- Um professor pode lecionar varias disciplinas e varias turmas em semestres diferentes.
- O sistema deve controlar ocupacao de vagas por turma.
- O sistema deve registrar notas e permitir apuracao de creditos.

### 2.3 Requisitos tecnicos da entrega
- Definir chaves primarias para todas as entidades.
- Definir chaves estrangeiras para os relacionamentos.
- Representar relacionamentos `1:N`, `N:N` e auto-relacionamento quando aplicavel.
- Aplicar normalizacao ate `3FN`.

## 3. Decisoes de modelagem

### 3.1 Entidades principais
- `Departamento`
- `Curso`
- `Aluno`
- `Professor`
- `Disciplina`
- `Turma`
- `TurmaHorario`
- `Matricula`
- `CursoDisciplina`
- `DisciplinaPrerequisito`

### 3.2 Justificativas importantes
- `Matricula` foi modelada como entidade associativa para resolver a relacao `N:N` entre aluno e turma.
- `CursoDisciplina` foi criada porque uma disciplina pode compor mais de um curso.
- `DisciplinaPrerequisito` representa o auto-relacionamento de disciplina com disciplina.
- `TurmaHorario` foi separada de `Turma` para suportar multiplos horarios sem violar a 1FN.
- `Historico academico` nao foi criado como tabela isolada, porque pode ser derivado do conjunto de matriculas do aluno.
- `Historico de ensino` nao foi criado como tabela isolada, porque pode ser derivado das turmas ministradas pelo professor.
- O controle de vagas foi colocado em `Turma`, e nao em `Disciplina`, porque a ocupacao acontece por oferta da disciplina em cada semestre.
- Os `creditos` ficam em `Disciplina`; os creditos concluidos pelo aluno podem ser calculados a partir das matriculas aprovadas.

## 4. Entidades, atributos e chaves

### 4.1 Departamento
- `id_departamento` PK
- `nome`
- `sigla`

### 4.2 Curso
- `id_curso` PK
- `nome`
- `carga_horaria_total`
- `id_departamento` FK

### 4.3 Aluno
- `id_aluno` PK
- `ra`
- `nome`
- `email`
- `cpf`
- `data_nascimento`
- `status_curso`
- `id_curso` FK

### 4.4 Professor
- `id_professor` PK
- `matricula_funcional`
- `nome`
- `email`
- `cpf`
- `titulacao`

### 4.5 Disciplina
- `id_disciplina` PK
- `codigo`
- `nome`
- `ementa`
- `carga_horaria`
- `creditos`

### 4.6 CursoDisciplina
- `id_curso` PK, FK
- `id_disciplina` PK, FK
- `periodo_sugerido`
- `obrigatoria`

### 4.7 DisciplinaPrerequisito
- `id_disciplina` PK, FK
- `id_disciplina_prerequisito` PK, FK

### 4.8 Turma
- `id_turma` PK
- `id_disciplina` FK
- `id_professor` FK
- `ano`
- `semestre`
- `capacidade_vagas`
- `status_turma`

### 4.9 TurmaHorario
- `id_turma_horario` PK
- `id_turma` FK
- `dia_semana`
- `hora_inicio`
- `hora_fim`
- `local`

### 4.10 Matricula
- `id_matricula` PK
- `id_aluno` FK
- `id_turma` FK
- `data_matricula`
- `status_matricula`
- `nota_final`
- `frequencia`

Restricao importante:
- Deve existir unicidade para `id_aluno + id_turma`, impedindo matricula duplicada na mesma turma.

## 5. Relacionamentos e cardinalidades

### 5.1 Relacoes `1:N`
- `Departamento 1:N Curso`
- `Curso 1:N Aluno`
- `Disciplina 1:N Turma`
- `Professor 1:N Turma`
- `Turma 1:N TurmaHorario`
- `Aluno 1:N Matricula`
- `Turma 1:N Matricula`

### 5.2 Relacoes `N:N`
- `Curso N:N Disciplina`, resolvida por `CursoDisciplina`
- `Aluno N:N Turma`, resolvida por `Matricula`

### 5.3 Auto-relacionamento
- `Disciplina N:N Disciplina`, resolvida por `DisciplinaPrerequisito`

### 5.4 Relacao `1:1`
- Nao foi identificada uma relacao `1:1` obrigatoria no enunciado.
- A ausencia de `1:1` nao prejudica a solucao, porque o caso nao exige nenhuma entidade exclusivamente acoplada a outra.

## 6. Como o modelo atende aos cenarios complexos

### 6.1 Aluno em varias disciplinas no mesmo semestre
O aluno se relaciona com turma por meio de `Matricula`. Como cada turma pertence a uma disciplina e a um semestre, o aluno pode ter varias matriculas em diferentes turmas no mesmo periodo.

### 6.2 Varios alunos na mesma disciplina em turmas diferentes
Uma disciplina pode gerar varias turmas. Cada turma pode ter varias matriculas. Assim, o modelo suporta tanto varias turmas da mesma disciplina quanto varios alunos por turma.

### 6.3 Controle de pre-requisitos
A tabela `DisciplinaPrerequisito` registra quais disciplinas precisam ser concluidas antes de outra. Isso implementa o auto-relacionamento pedido no caso.

### 6.4 Professor lecionando varias disciplinas e varias turmas
Cada turma referencia um professor. Como um professor pode aparecer em varias turmas, o historico de ensino e naturalmente suportado.

### 6.5 Controle de vagas
`Turma.capacidade_vagas` registra o limite maximo. A ocupacao pode ser apurada pela contagem das matriculas ativas na turma.

### 6.6 Controle de notas e creditos
- `Matricula.nota_final` registra a nota do aluno na turma.
- `Disciplina.creditos` registra o valor academico da disciplina.
- Os creditos obtidos pelo aluno podem ser calculados somando os creditos das disciplinas em que ele foi aprovado.

## 7. Modelo relacional final

### 7.1 Tabelas

#### Departamento
- `id_departamento` PK
- `nome`
- `sigla`

#### Curso
- `id_curso` PK
- `nome`
- `carga_horaria_total`
- `id_departamento` FK -> `Departamento.id_departamento`

#### Aluno
- `id_aluno` PK
- `ra`
- `nome`
- `email`
- `cpf`
- `data_nascimento`
- `status_curso`
- `id_curso` FK -> `Curso.id_curso`

#### Professor
- `id_professor` PK
- `matricula_funcional`
- `nome`
- `email`
- `cpf`
- `titulacao`

#### Disciplina
- `id_disciplina` PK
- `codigo`
- `nome`
- `ementa`
- `carga_horaria`
- `creditos`

#### CursoDisciplina
- `id_curso` PK, FK -> `Curso.id_curso`
- `id_disciplina` PK, FK -> `Disciplina.id_disciplina`
- `periodo_sugerido`
- `obrigatoria`

#### DisciplinaPrerequisito
- `id_disciplina` PK, FK -> `Disciplina.id_disciplina`
- `id_disciplina_prerequisito` PK, FK -> `Disciplina.id_disciplina`

#### Turma
- `id_turma` PK
- `id_disciplina` FK -> `Disciplina.id_disciplina`
- `id_professor` FK -> `Professor.id_professor`
- `ano`
- `semestre`
- `capacidade_vagas`
- `status_turma`

#### TurmaHorario
- `id_turma_horario` PK
- `id_turma` FK -> `Turma.id_turma`
- `dia_semana`
- `hora_inicio`
- `hora_fim`
- `local`

#### Matricula
- `id_matricula` PK
- `id_aluno` FK -> `Aluno.id_aluno`
- `id_turma` FK -> `Turma.id_turma`
- `data_matricula`
- `status_matricula`
- `nota_final`
- `frequencia`
- `UNIQUE (id_aluno, id_turma)`

## 8. Validacao da normalizacao

### 8.1 Primeira Forma Normal
O modelo atende a 1FN porque:
- nao ha campos multivalorados;
- horarios foram separados em `TurmaHorario`;
- pre-requisitos foram separados em `DisciplinaPrerequisito`.

### 8.2 Segunda Forma Normal
O modelo atende a 2FN porque:
- tabelas com chave composta, como `CursoDisciplina` e `DisciplinaPrerequisito`, possuem atributos dependentes da chave completa;
- atributos descritivos de aluno, professor, curso e disciplina nao foram misturados em tabelas associativas.

### 8.3 Terceira Forma Normal
O modelo atende a 3FN porque:
- dados de departamento aparecem apenas em `Departamento`;
- dados de curso aparecem apenas em `Curso`;
- dados da disciplina aparecem apenas em `Disciplina`;
- notas pertencem a `Matricula`, e nao a `Aluno` ou `Turma`;
- historicos nao sao armazenados de forma redundante, pois podem ser derivados.

## 9. Conclusao
O modelo proposto atende ao enunciado, cobre os cenarios complexos exigidos e permanece consistente com as regras de normalizacao ate a 3FN.

Os elementos centrais da solucao sao:
- `Matricula` para resolver aluno x turma
- `CursoDisciplina` para resolver curso x disciplina
- `DisciplinaPrerequisito` para o auto-relacionamento
- `TurmaHorario` para suportar horarios multiplos

## 10. Arquivo visual do DER
O arquivo [05_DER_CASO_1B.dbml](/home/jeffharris/mba_mackenzie/disciplines/data_prep/caso1b/05_DER_CASO_1B.dbml) foi incluido na pasta `caso1b` para visualizacao no VS Code com extensoes DBML.
