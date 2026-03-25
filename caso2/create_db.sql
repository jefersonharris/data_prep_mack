-- ============================================================
-- Caso 2 - Implementação de Banco de Dados
-- Universidade Mackenzie | MBA Engenharia de Dados
-- Script DDL - Criação do Banco de Dados
-- Baseado no modelo conceitual do Caso 1B:
-- Universidade Internacional do Conhecimento

-- Alunos:
-- João Gabriel Salgado Lessa — 10734219
-- Jeferson Batista Harris — 10737194
-- Leonardo Dom Machado Silva — 10735382

-- ============================================================

-- ============================================================
-- TABELA: departamento
-- Armazena os departamentos acadêmicos da universidade.
-- Cada departamento é responsável por um ou mais cursos.
-- ============================================================
CREATE TABLE departamento (
    id_departamento SERIAL        PRIMARY KEY,
    nome            VARCHAR(100)  NOT NULL,
    sigla           VARCHAR(10)   NOT NULL UNIQUE
);

-- ============================================================
-- TABELA: curso
-- Representa os cursos oferecidos pela universidade.
-- Cada curso pertence a um único departamento (1:N).
-- ============================================================
CREATE TABLE curso (
    id_curso              SERIAL        PRIMARY KEY,
    nome                  VARCHAR(150)  NOT NULL,
    carga_horaria_total   INTEGER       NOT NULL,
    id_departamento       INTEGER       NOT NULL,
    CONSTRAINT fk_curso_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES departamento (id_departamento)
);

-- ============================================================
-- TABELA: professor
-- Armazena os dados dos professores da universidade.
-- Professores podem lecionar várias turmas e disciplinas.
-- ============================================================
CREATE TABLE professor (
    id_professor          SERIAL        PRIMARY KEY,
    matricula_funcional   VARCHAR(20)   NOT NULL UNIQUE,
    nome                  VARCHAR(150)  NOT NULL,
    email                 VARCHAR(150)  NOT NULL UNIQUE,
    cpf                   CHAR(11)      NOT NULL UNIQUE,
    titulacao             VARCHAR(50)   NOT NULL
);

-- ============================================================
-- TABELA: aluno
-- Armazena os dados dos alunos da universidade.
-- Cada aluno está vinculado a um único curso (1:N).
-- ============================================================
CREATE TABLE aluno (
    id_aluno        SERIAL        PRIMARY KEY,
    ra              VARCHAR(20)   NOT NULL UNIQUE,
    nome            VARCHAR(150)  NOT NULL,
    email           VARCHAR(150)  NOT NULL UNIQUE,
    cpf             CHAR(11)      NOT NULL UNIQUE,
    data_nascimento DATE          NOT NULL,
    status_curso    VARCHAR(20)   NOT NULL DEFAULT 'ativo',
    id_curso        INTEGER       NOT NULL,
    CONSTRAINT fk_aluno_curso
        FOREIGN KEY (id_curso)
        REFERENCES curso (id_curso)
);

-- ============================================================
-- TABELA: disciplina
-- Representa as disciplinas da universidade.
-- Uma disciplina pode compor vários cursos (N:N via curso_disciplina).
-- Possui autorelacionamento para controle de pré-requisitos.
-- ============================================================
CREATE TABLE disciplina (
    id_disciplina   SERIAL        PRIMARY KEY,
    codigo          VARCHAR(20)   NOT NULL UNIQUE,
    nome            VARCHAR(150)  NOT NULL,
    ementa          TEXT,
    carga_horaria   INTEGER       NOT NULL,
    creditos        INTEGER       NOT NULL
);

-- ============================================================
-- TABELA: curso_disciplina (associativa N:N)
-- Resolve o relacionamento muitos-para-muitos entre
-- curso e disciplina. Uma mesma disciplina pode fazer
-- parte de vários cursos.
-- ============================================================
CREATE TABLE curso_disciplina (
    id_curso          INTEGER      NOT NULL,
    id_disciplina     INTEGER      NOT NULL,
    periodo_sugerido  INTEGER,
    obrigatoria       BOOLEAN      NOT NULL DEFAULT TRUE,
    CONSTRAINT pk_curso_disciplina
        PRIMARY KEY (id_curso, id_disciplina),
    CONSTRAINT fk_cd_curso
        FOREIGN KEY (id_curso)
        REFERENCES curso (id_curso),
    CONSTRAINT fk_cd_disciplina
        FOREIGN KEY (id_disciplina)
        REFERENCES disciplina (id_disciplina)
);

-- ============================================================
-- TABELA: disciplina_prerequisito (autorelacionamento N:N)
-- Registra quais disciplinas precisam ser concluídas
-- antes de outra disciplina poder ser cursada.
-- ============================================================
CREATE TABLE disciplina_prerequisito (
    id_disciplina             INTEGER  NOT NULL,
    id_disciplina_prerequisito INTEGER NOT NULL,
    CONSTRAINT pk_disciplina_prerequisito
        PRIMARY KEY (id_disciplina, id_disciplina_prerequisito),
    CONSTRAINT fk_dp_disciplina
        FOREIGN KEY (id_disciplina)
        REFERENCES disciplina (id_disciplina),
    CONSTRAINT fk_dp_prerequisito
        FOREIGN KEY (id_disciplina_prerequisito)
        REFERENCES disciplina (id_disciplina),
    CONSTRAINT chk_prerequisito_diferente
        CHECK (id_disciplina <> id_disciplina_prerequisito)
);

-- ============================================================
-- TABELA: turma
-- Representa uma oferta de disciplina em um semestre/ano
-- específico, ministrada por um professor.
-- Controla a capacidade máxima de vagas.
-- ============================================================
CREATE TABLE turma (
    id_turma          SERIAL       PRIMARY KEY,
    id_disciplina     INTEGER      NOT NULL,
    id_professor      INTEGER      NOT NULL,
    ano               INTEGER      NOT NULL,
    semestre          INTEGER      NOT NULL CHECK (semestre IN (1, 2)),
    capacidade_vagas  INTEGER      NOT NULL,
    status_turma      VARCHAR(20)  NOT NULL DEFAULT 'aberta',
    CONSTRAINT fk_turma_disciplina
        FOREIGN KEY (id_disciplina)
        REFERENCES disciplina (id_disciplina),
    CONSTRAINT fk_turma_professor
        FOREIGN KEY (id_professor)
        REFERENCES professor (id_professor)
);

-- ============================================================
-- TABELA: turma_horario
-- Armazena os horários de cada turma separadamente,
-- garantindo a 1FN (evitando campos multivalorados em turma).
-- Uma turma pode ter múltiplos dias/horários semanais.
-- ============================================================
CREATE TABLE turma_horario (
    id_turma_horario  SERIAL       PRIMARY KEY,
    id_turma          INTEGER      NOT NULL,
    dia_semana        VARCHAR(15)  NOT NULL,
    hora_inicio       TIME         NOT NULL,
    hora_fim          TIME         NOT NULL,
    local             VARCHAR(50)  NOT NULL,
    CONSTRAINT fk_th_turma
        FOREIGN KEY (id_turma)
        REFERENCES turma (id_turma)
);

-- ============================================================
-- TABELA: matricula (associativa N:N com atributos)
-- Resolve o relacionamento muitos-para-muitos entre
-- aluno e turma. Registra dados acadêmicos do aluno
-- na turma: nota, frequência e status.
-- A restrição UNIQUE impede matrícula duplicada.
-- ============================================================
CREATE TABLE matricula (
    id_matricula      SERIAL         PRIMARY KEY,
    id_aluno          INTEGER        NOT NULL,
    id_turma          INTEGER        NOT NULL,
    data_matricula    DATE           NOT NULL DEFAULT CURRENT_DATE,
    status_matricula  VARCHAR(20)    NOT NULL DEFAULT 'ativa',
    nota_final        NUMERIC(4, 1),
    frequencia        NUMERIC(5, 2),
    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno)
        REFERENCES aluno (id_aluno),
    CONSTRAINT fk_matricula_turma
        FOREIGN KEY (id_turma)
        REFERENCES turma (id_turma),
    CONSTRAINT uq_aluno_turma
        UNIQUE (id_aluno, id_turma)
);
