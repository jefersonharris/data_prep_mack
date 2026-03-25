-- ============================================================
-- Caso 2 - Implementação de Banco de Dados
-- Universidade Mackenzie | MBA Engenharia de Dados
-- Script DML - Carga Inicial de Dados
-- Baseado no modelo conceitual do Caso 1B:
-- Universidade Internacional do Conhecimento

-- Alunos:
-- João Gabriel Salgado Lessa — 10734219
-- Jeferson Batista Harris — 10737194
-- Leonardo Dom Machado Silva — 10735382
-- ============================================================

-- ============================================================
-- CARGA: departamento
-- ============================================================
INSERT INTO departamento (nome, sigla) VALUES
    ('Ciências Exatas e Tecnologia',  'CET'),
    ('Ciências Humanas e Sociais',    'CHS'),
    ('Ciências da Saúde',             'CDS'),
    ('Administração e Negócios',      'ADN');

-- ============================================================
-- CARGA: curso
-- ============================================================
INSERT INTO curso (nome, carga_horaria_total, id_departamento) VALUES
    ('Sistemas de Informação',           3200, 1),
    ('Ciência da Computação',            3600, 1),
    ('Análise e Desenvolvimento de Sistemas', 2400, 1),
    ('Administração de Empresas',        3000, 4),
    ('Psicologia',                       4000, 2);

-- ============================================================
-- CARGA: professor
-- ============================================================
INSERT INTO professor (matricula_funcional, nome, email, cpf, titulacao) VALUES
    ('PROF-001', 'Ana Paula Ferreira',      'ana.ferreira@universidade.br',      '11122233344', 'Doutora'),
    ('PROF-002', 'Carlos Eduardo Mendes',   'carlos.mendes@universidade.br',     '22233344455', 'Mestre'),
    ('PROF-003', 'Renata Oliveira Costa',   'renata.costa@universidade.br',      '33344455566', 'Doutora'),
    ('PROF-004', 'Fernando Silva Rocha',    'fernando.rocha@universidade.br',    '44455566677', 'Especialista'),
    ('PROF-005', 'Juliana Martins Alves',   'juliana.alves@universidade.br',     '55566677788', 'Doutora'),
    ('PROF-006', 'Roberto Pereira Lima',    'roberto.lima@universidade.br',      '66677788899', 'Mestre');

-- ============================================================
-- CARGA: aluno
-- ============================================================
INSERT INTO aluno (ra, nome, email, cpf, data_nascimento, status_curso, id_curso) VALUES
    ('2024001', 'Lucas Andrade Souza',     'lucas.souza@aluno.br',      '12345678901', '2002-03-15', 'ativo',    1),
    ('2024002', 'Mariana Torres Gomes',    'mariana.gomes@aluno.br',    '23456789012', '2001-07-22', 'ativo',    1),
    ('2024003', 'Pedro Henrique Lopes',    'pedro.lopes@aluno.br',      '34567890123', '2000-11-05', 'ativo',    2),
    ('2024004', 'Isabela Rodrigues Neto',  'isabela.neto@aluno.br',     '45678901234', '2003-01-30', 'ativo',    2),
    ('2024005', 'Gabriel Santos Lima',     'gabriel.lima@aluno.br',     '56789012345', '2001-05-18', 'ativo',    3),
    ('2024006', 'Fernanda Carvalho Dias',  'fernanda.dias@aluno.br',    '67890123456', '2002-09-12', 'ativo',    3),
    ('2024007', 'Rafael Nascimento Cruz',  'rafael.cruz@aluno.br',      '78901234567', '2000-06-25', 'trancado', 4),
    ('2024008', 'Camila Costa Vieira',     'camila.vieira@aluno.br',    '89012345678', '2001-12-08', 'ativo',    4),
    ('2023001', 'Thiago Alves Pinto',      'thiago.pinto@aluno.br',     '90123456789', '1999-04-14', 'ativo',    1),
    ('2023002', 'Laura Moreira Campos',    'laura.campos@aluno.br',     '01234567890', '2000-08-20', 'ativo',    2);

-- ============================================================
-- CARGA: disciplina
-- ============================================================
INSERT INTO disciplina (codigo, nome, ementa, carga_horaria, creditos) VALUES
    ('MAT101', 'Cálculo Diferencial e Integral',
     'Limites, derivadas, integrais e suas aplicações.',
     72, 4),
    ('ALG101', 'Álgebra Linear',
     'Matrizes, determinantes, sistemas lineares e espaços vetoriais.',
     72, 4),
    ('PRG101', 'Introdução à Programação',
     'Lógica de programação, algoritmos e estruturas básicas.',
     72, 4),
    ('PRG201', 'Programação Orientada a Objetos',
     'Conceitos de OOP: classes, herança, polimorfismo e encapsulamento.',
     72, 4),
    ('BD101',  'Fundamentos de Banco de Dados',
     'Modelagem de dados, SQL, normalização e integridade referencial.',
     72, 4),
    ('BD201',  'Banco de Dados Avançado',
     'Otimização de consultas, transações, triggers e stored procedures.',
     60, 3),
    ('RED101', 'Redes de Computadores',
     'Modelo OSI, protocolos TCP/IP, endereçamento e roteamento.',
     60, 3),
    ('EST101', 'Estrutura de Dados',
     'Listas, filas, pilhas, árvores e grafos.',
     72, 4),
    ('ADM101', 'Fundamentos de Administração',
     'Funções administrativas, gestão de processos e organizações.',
     60, 3),
    ('GES201', 'Gestão de Projetos',
     'Metodologias ágeis, PMBOK, planejamento e controle de projetos.',
     60, 3);

-- ============================================================
-- CARGA: curso_disciplina (N:N curso x disciplina)
-- ============================================================
-- Sistemas de Informação (id_curso = 1)
INSERT INTO curso_disciplina (id_curso, id_disciplina, periodo_sugerido, obrigatoria) VALUES
    (1, 1, 1, TRUE),   -- MAT101
    (1, 3, 1, TRUE),   -- PRG101
    (1, 2, 2, TRUE),   -- ALG101
    (1, 4, 2, TRUE),   -- PRG201
    (1, 5, 3, TRUE),   -- BD101
    (1, 7, 3, TRUE),   -- RED101
    (1, 6, 4, TRUE),   -- BD201
    (1, 10, 5, FALSE);  -- GES201

-- Ciência da Computação (id_curso = 2)
INSERT INTO curso_disciplina (id_curso, id_disciplina, periodo_sugerido, obrigatoria) VALUES
    (2, 1, 1, TRUE),   -- MAT101
    (2, 2, 1, TRUE),   -- ALG101
    (2, 3, 1, TRUE),   -- PRG101
    (2, 8, 2, TRUE),   -- EST101
    (2, 4, 2, TRUE),   -- PRG201
    (2, 5, 3, TRUE),   -- BD101
    (2, 7, 3, TRUE),   -- RED101
    (2, 6, 4, TRUE);   -- BD201

-- Análise e Desenvolvimento de Sistemas (id_curso = 3)
INSERT INTO curso_disciplina (id_curso, id_disciplina, periodo_sugerido, obrigatoria) VALUES
    (3, 3, 1, TRUE),   -- PRG101
    (3, 4, 2, TRUE),   -- PRG201
    (3, 5, 2, TRUE),   -- BD101
    (3, 7, 3, TRUE),   -- RED101
    (3, 10, 4, FALSE);  -- GES201

-- Administração de Empresas (id_curso = 4)
INSERT INTO curso_disciplina (id_curso, id_disciplina, periodo_sugerido, obrigatoria) VALUES
    (4, 9, 1, TRUE),   -- ADM101
    (4, 10, 3, TRUE),  -- GES201
    (4, 1, 1, FALSE);  -- MAT101

-- ============================================================
-- CARGA: disciplina_prerequisito (autorelacionamento)
-- ============================================================
-- PRG201 requer PRG101
INSERT INTO disciplina_prerequisito (id_disciplina, id_disciplina_prerequisito) VALUES
    (4, 3);
-- BD201 requer BD101
INSERT INTO disciplina_prerequisito (id_disciplina, id_disciplina_prerequisito) VALUES
    (6, 5);
-- BD101 requer PRG101
INSERT INTO disciplina_prerequisito (id_disciplina, id_disciplina_prerequisito) VALUES
    (5, 3);
-- EST101 requer ALG101
INSERT INTO disciplina_prerequisito (id_disciplina, id_disciplina_prerequisito) VALUES
    (8, 2);
-- ALG101 requer MAT101
INSERT INTO disciplina_prerequisito (id_disciplina, id_disciplina_prerequisito) VALUES
    (2, 1);
-- GES201 requer ADM101
INSERT INTO disciplina_prerequisito (id_disciplina, id_disciplina_prerequisito) VALUES
    (10, 9);

-- ============================================================
-- CARGA: turma
-- ============================================================
-- Turmas do 1º semestre de 2025
INSERT INTO turma (id_disciplina, id_professor, ano, semestre, capacidade_vagas, status_turma) VALUES
    (3, 2, 2025, 1, 40, 'encerrada'),  -- PRG101 - Prof. Carlos
    (1, 1, 2025, 1, 35, 'encerrada'),  -- MAT101 - Prof. Ana
    (5, 3, 2025, 1, 30, 'encerrada'),  -- BD101   - Prof. Renata
    (9, 4, 2025, 1, 45, 'encerrada'),  -- ADM101  - Prof. Fernando
    (7, 6, 2025, 1, 30, 'encerrada'),  -- RED101  - Prof. Roberto
    (2, 1, 2025, 1, 35, 'encerrada');  -- ALG101  - Prof. Ana

-- Turmas do 2º semestre de 2025
INSERT INTO turma (id_disciplina, id_professor, ano, semestre, capacidade_vagas, status_turma) VALUES
    (4, 2, 2025, 2, 40, 'encerrada'),  -- PRG201 - Prof. Carlos
    (6, 3, 2025, 2, 25, 'encerrada'),  -- BD201   - Prof. Renata
    (8, 5, 2025, 2, 30, 'encerrada'),  -- EST101  - Prof. Juliana
    (10, 4, 2025, 2, 35, 'encerrada'); -- GES201  - Prof. Fernando

-- Turmas do 1º semestre de 2026
INSERT INTO turma (id_disciplina, id_professor, ano, semestre, capacidade_vagas, status_turma) VALUES
    (3, 2, 2026, 1, 40, 'aberta'),    -- PRG101 - Prof. Carlos
    (1, 1, 2026, 1, 35, 'aberta'),    -- MAT101 - Prof. Ana
    (5, 3, 2026, 1, 30, 'aberta'),    -- BD101   - Prof. Renata
    (9, 4, 2026, 1, 45, 'aberta');    -- ADM101  - Prof. Fernando

-- ============================================================
-- CARGA: turma_horario
-- ============================================================
-- Turma 1 (PRG101 - 2025/1): segunda e quarta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (1, 'Segunda', '08:00', '10:00', 'Lab Informática A'),
    (1, 'Quarta',  '08:00', '10:00', 'Lab Informática A');

-- Turma 2 (MAT101 - 2025/1): terça e quinta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (2, 'Terça',  '10:00', '12:00', 'Sala 201'),
    (2, 'Quinta', '10:00', '12:00', 'Sala 201');

-- Turma 3 (BD101 - 2025/1): segunda e quarta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (3, 'Segunda', '14:00', '16:00', 'Lab Informática B'),
    (3, 'Quarta',  '14:00', '16:00', 'Lab Informática B');

-- Turma 4 (ADM101 - 2025/1): terça e quinta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (4, 'Terça',  '19:00', '21:00', 'Sala 305'),
    (4, 'Quinta', '19:00', '21:00', 'Sala 305');

-- Turma 5 (RED101 - 2025/1): sexta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (5, 'Sexta', '14:00', '18:00', 'Lab Redes');

-- Turma 6 (ALG101 - 2025/1): segunda e quarta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (6, 'Segunda', '10:00', '12:00', 'Sala 102'),
    (6, 'Quarta',  '10:00', '12:00', 'Sala 102');

-- Turma 7 (PRG201 - 2025/2): terça e quinta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (7, 'Terça',  '08:00', '10:00', 'Lab Informática A'),
    (7, 'Quinta', '08:00', '10:00', 'Lab Informática A');

-- Turma 8 (BD201 - 2025/2): segunda e quarta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (8, 'Segunda', '16:00', '18:00', 'Lab Informática B'),
    (8, 'Quarta',  '16:00', '18:00', 'Lab Informática B');

-- Turma 9 (EST101 - 2025/2): sexta
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (9, 'Sexta', '08:00', '12:00', 'Lab Informática C');

-- Turma 10 (GES201 - 2025/2): sábado
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (10, 'Sábado', '08:00', '12:00', 'Sala 401');

-- Turma 11 (PRG101 - 2026/1)
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (11, 'Segunda', '08:00', '10:00', 'Lab Informática A'),
    (11, 'Quarta',  '08:00', '10:00', 'Lab Informática A');

-- Turma 12 (MAT101 - 2026/1)
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (12, 'Terça',  '10:00', '12:00', 'Sala 201'),
    (12, 'Quinta', '10:00', '12:00', 'Sala 201');

-- Turma 13 (BD101 - 2026/1)
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (13, 'Segunda', '14:00', '16:00', 'Lab Informática B'),
    (13, 'Quarta',  '14:00', '16:00', 'Lab Informática B');

-- Turma 14 (ADM101 - 2026/1)
INSERT INTO turma_horario (id_turma, dia_semana, hora_inicio, hora_fim, local) VALUES
    (14, 'Terça',  '19:00', '21:00', 'Sala 305'),
    (14, 'Quinta', '19:00', '21:00', 'Sala 305');

-- ============================================================
-- CARGA: matricula
-- Dados do 1º semestre de 2025 (turmas 1 a 6) — encerradas
-- ============================================================

-- Lucas Andrade (aluno 1, curso SI) - PRG101, MAT101, BD101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (1, 1, '2025-02-10', 'aprovado',  8.5, 92.0),
    (1, 2, '2025-02-10', 'aprovado',  7.0, 85.0),
    (1, 3, '2025-02-10', 'aprovado',  9.0, 95.0);

-- Mariana Torres (aluno 2, curso SI) - PRG101, BD101, ALG101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (2, 1, '2025-02-10', 'aprovado',  7.5, 88.0),
    (2, 3, '2025-02-10', 'reprovado', 4.0, 60.0),
    (2, 6, '2025-02-10', 'aprovado',  8.0, 90.0);

-- Pedro Henrique (aluno 3, curso CC) - MAT101, ALG101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (3, 2, '2025-02-11', 'aprovado',  9.5, 98.0),
    (3, 6, '2025-02-11', 'aprovado',  9.0, 95.0);

-- Isabela Rodrigues (aluno 4, curso CC) - PRG101, MAT101, RED101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (4, 1, '2025-02-11', 'aprovado',  6.5, 80.0),
    (4, 2, '2025-02-11', 'aprovado',  7.0, 82.0),
    (4, 5, '2025-02-11', 'aprovado',  8.5, 91.0);

-- Gabriel Santos (aluno 5, curso ADS) - PRG101, BD101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (5, 1, '2025-02-12', 'aprovado',  7.0, 85.0),
    (5, 3, '2025-02-12', 'aprovado',  8.0, 90.0);

-- Fernanda Carvalho (aluno 6, curso ADS) - PRG101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (6, 1, '2025-02-12', 'reprovado', 3.5, 55.0);

-- Camila Costa (aluno 8, curso ADM) - ADM101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (8, 4, '2025-02-13', 'aprovado', 8.0, 88.0);

-- Thiago Alves (aluno 9, curso SI - 2023) - BD101, RED101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (9, 3, '2025-02-10', 'aprovado',  9.5, 97.0),
    (9, 5, '2025-02-10', 'aprovado',  8.0, 88.0);

-- Laura Moreira (aluno 10, curso CC - 2023) - MAT101, ALG101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (10, 2, '2025-02-11', 'aprovado', 9.0, 94.0),
    (10, 6, '2025-02-11', 'aprovado', 8.5, 91.0);

-- ============================================================
-- Matrículas do 2º semestre de 2025 (turmas 7 a 10)
-- ============================================================

-- Lucas Andrade (aprovado em PRG101 e BD101) - PRG201, BD201
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (1, 7,  '2025-07-15', 'aprovado', 8.0, 90.0),
    (1, 8,  '2025-07-15', 'aprovado', 7.5, 86.0);

-- Pedro Henrique (aprovado em MAT101, ALG101) - GES201, EST101
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (3, 9,  '2025-07-16', 'aprovado', 9.0, 96.0),
    (3, 10, '2025-07-16', 'aprovado', 8.5, 93.0);

-- Camila Costa (aprovado em ADM101) - GES201
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (8, 10, '2025-07-15', 'aprovado', 7.5, 85.0);

-- ============================================================
-- Matrículas do 1º semestre de 2026 (turmas 11 a 14) - ativas
-- ============================================================

-- Fernanda Carvalho (repetindo PRG101 - turma nova em 2026)
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (6, 11, '2026-02-10', 'ativa', NULL, NULL);

-- Isabela Rodrigues - PRG101 nova turma
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (4, 13, '2026-02-11', 'ativa', NULL, NULL);

-- Mariana Torres (repetindo BD101 - repovou em 2025)
INSERT INTO matricula (id_aluno, id_turma, data_matricula, status_matricula, nota_final, frequencia) VALUES
    (2, 13, '2026-02-10', 'ativa', NULL, NULL);
