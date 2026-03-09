# Entrega Final Didatica - Caso 1B

## 1. Apresentacao
Este documento foi preparado para ser a versao mais didatica da entrega do Caso 1B.

O objetivo aqui nao e apenas mostrar a resposta final, mas explicar com clareza:
- o que o problema pediu;
- como o grupo pensou a modelagem;
- por que cada decisao foi tomada;
- como o DER foi construido;
- como o modelo foi organizado ate a 3FN.

Em outras palavras, este arquivo serve para duas finalidades:
- apoiar a entrega formal do trabalho;
- garantir que todos do grupo entendam a solucao e consigam explica-la.

## 2. O que o caso pediu
O enunciado pede a construcao de um modelo de dados para um sistema de gestao academica de uma universidade.

Esse sistema precisa organizar informacoes sobre:
- alunos;
- professores;
- cursos;
- disciplinas;
- turmas.

Tambem precisa suportar situacoes reais do ambiente academico, como:
- matriculas de alunos em varias disciplinas no mesmo semestre;
- professores lecionando diferentes turmas;
- disciplinas com pre-requisitos;
- controle de vagas;
- notas;
- creditos.

Por isso, o problema nao podia ser resolvido apenas com uma lista simples de tabelas. Era necessario pensar em:
- entidades principais;
- relacionamentos entre elas;
- regras de negocio;
- estrutura capaz de crescer sem ficar baguncada.

## 3. Como pensamos a solucao
Antes de desenhar qualquer DER, o raciocinio do grupo precisa seguir uma ordem.

### 3.1 Primeiro pensamento: identificar os elementos centrais
O primeiro passo foi perguntar:

"Quais sao os objetos principais que existem nesse contexto academico?"

A resposta veio diretamente do enunciado:
- aluno;
- professor;
- curso;
- disciplina;
- turma.

Esses elementos sao o nucleo do sistema.

### 3.2 Segundo pensamento: entender o que cada elemento precisa guardar
Depois, avaliamos quais informacoes cada elemento deveria armazenar.

Exemplos:
- o aluno precisa ter dados pessoais e status no curso;
- a disciplina precisa ter codigo, nome e carga horaria;
- a turma precisa ter semestre, professor e quantidade de vagas.

Esse passo foi importante porque ajudou a separar:
- o que pertence a uma entidade;
- o que na verdade e um relacionamento entre entidades.

### 3.3 Terceiro pensamento: localizar os cenarios complexos
O enunciado nao queria apenas um modelo basico. Ele destacou situacoes que exigem cuidado.

As principais foram:
- aluno em varias disciplinas;
- disciplina com varios alunos;
- disciplina com pre-requisito;
- professor em varias turmas;
- controle de vagas;
- notas e creditos.

Esses pontos mostraram que algumas relacoes nao poderiam ser resolvidas com uma unica chave estrangeira simples.

### 3.4 Quarto pensamento: evitar repeticao e confusao
Tambem tivemos que garantir que o modelo ficasse organizado.

Se colocassemos tudo em poucas tabelas, haveria problemas como:
- repeticao desnecessaria de dados;
- dificuldade de manutencao;
- risco de inconsistencias;
- quebra das formas normais.

Por isso, fizemos a separacao correta das entidades e criamos tabelas associativas quando necessario.

## 4. Estrutura final da solucao

### 4.1 Entidades principais adotadas
As entidades principais da solucao foram:
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

Agora vamos explicar uma por uma.

## 5. Explicacao de cada entidade

### 5.1 Departamento
O caso informa que o curso possui um departamento responsavel.

Por isso, criamos a entidade `Departamento`.

Ela existe para:
- guardar o nome do departamento;
- evitar repetir o mesmo departamento em varios cursos;
- manter o modelo mais organizado.

Principais atributos:
- `id_departamento`
- `nome`
- `sigla`

### 5.2 Curso
O curso e uma das entidades centrais do problema.

Ele representa a formacao academica do aluno, como por exemplo:
- Administracao;
- Engenharia de Dados;
- Economia.

Principais atributos:
- `id_curso`
- `nome`
- `carga_horaria_total`
- `id_departamento`

Decisao importante:
- o curso pertence a um departamento;
- por isso, `Curso` recebe uma chave estrangeira para `Departamento`.

### 5.3 Aluno
O aluno precisa guardar dados pessoais e dados academicos.

Principais atributos:
- `id_aluno`
- `ra`
- `nome`
- `email`
- `cpf`
- `data_nascimento`
- `status_curso`
- `id_curso`

Decisao importante:
- o aluno foi ligado diretamente a um curso;
- isso atende ao enunciado, que fala em status do aluno no curso.

Exemplos de `status_curso`:
- ativo;
- trancado;
- formado.

### 5.4 Professor
O professor tambem precisa ter dados pessoais e informacoes funcionais.

Principais atributos:
- `id_professor`
- `matricula_funcional`
- `nome`
- `email`
- `cpf`
- `titulacao`

Decisao importante:
- nao criamos uma tabela separada de historico de ensino;
- esse historico pode ser obtido pelas turmas que o professor ministrou.

### 5.5 Disciplina
A disciplina representa cada materia do curso.

Principais atributos:
- `id_disciplina`
- `codigo`
- `nome`
- `ementa`
- `carga_horaria`
- `creditos`

Decisao importante:
- os creditos ficaram em `Disciplina`, porque pertencem a materia e nao a matricula;
- a matricula registra se o aluno foi aprovado ou nao naquela oferta.

### 5.6 Turma
A turma representa a oferta de uma disciplina em um semestre especifico.

Essa foi uma das entidades mais importantes do trabalho, porque varias regras do enunciado passam por ela.

Principais atributos:
- `id_turma`
- `id_disciplina`
- `id_professor`
- `ano`
- `semestre`
- `capacidade_vagas`
- `status_turma`

Decisoes importantes:
- a turma pertence a uma disciplina;
- a turma possui um professor responsavel;
- o controle de vagas acontece na turma, nao na disciplina.

Isso faz sentido porque:
- a disciplina e o conceito geral da materia;
- a turma e a oferta concreta daquela materia em um periodo especifico.

### 5.7 TurmaHorario
O caso fala em horarios das aulas.

Se colocassemos todos os horarios dentro da propria tabela `Turma`, teriamos um problema:
- uma turma pode ter mais de um dia e horario de aula;
- isso geraria campo repetido ou varios horarios na mesma coluna.

Para evitar isso, criamos `TurmaHorario`.

Principais atributos:
- `id_turma_horario`
- `id_turma`
- `dia_semana`
- `hora_inicio`
- `hora_fim`
- `local`

Decisao importante:
- essa separacao ajuda diretamente a manter a 1FN.

### 5.8 Matricula
Essa foi a entidade associativa mais importante do modelo.

Por que ela existe?

Porque:
- um aluno pode se matricular em varias turmas;
- uma turma pode ter varios alunos.

Isso e uma relacao `N:N`.

Como relacoes `N:N` nao devem ser representadas diretamente sem tratamento, criamos a tabela `Matricula`.

Principais atributos:
- `id_matricula`
- `id_aluno`
- `id_turma`
- `data_matricula`
- `status_matricula`
- `nota_final`
- `frequencia`

Decisoes importantes:
- a matricula resolve a relacao entre aluno e turma;
- a nota final pertence a matricula, porque depende daquele aluno naquela turma;
- a frequencia tambem pertence a matricula;
- colocamos uma restricao de unicidade em `id_aluno + id_turma` para impedir matricula duplicada na mesma turma.

### 5.9 CursoDisciplina
Tambem identificamos outra relacao `N:N`.

Um curso possui varias disciplinas.
Ao mesmo tempo, uma mesma disciplina pode aparecer em mais de um curso.

Por isso, criamos `CursoDisciplina`.

Principais atributos:
- `id_curso`
- `id_disciplina`
- `periodo_sugerido`
- `obrigatoria`

Decisao importante:
- essa entidade permite dizer nao apenas que a disciplina faz parte do curso;
- tambem permite guardar em que periodo ela e sugerida e se e obrigatoria ou optativa.

### 5.10 DisciplinaPrerequisito
O caso exige que uma disciplina possa depender de outra disciplina.

Isso e um auto-relacionamento, porque:
- a disciplina se relaciona com outra disciplina.

Para resolver isso corretamente, criamos `DisciplinaPrerequisito`.

Principais atributos:
- `id_disciplina`
- `id_disciplina_prerequisito`

Decisao importante:
- essa tabela evita colocar pre-requisito como texto;
- assim, o relacionamento fica estruturado e consultavel no banco.

## 6. Relacionamentos e como eles foram pensados

### 6.1 Relacoes um para muitos
As relacoes `1:N` da solucao foram:
- um departamento possui varios cursos;
- um curso possui varios alunos;
- uma disciplina possui varias turmas;
- um professor pode lecionar varias turmas;
- uma turma pode possuir varios horarios;
- um aluno pode ter varias matriculas;
- uma turma pode ter varias matriculas.

Essas relacoes foram resolvidas com chaves estrangeiras nas tabelas do lado "muitos".

### 6.2 Relacoes muitos para muitos
As relacoes `N:N` foram:
- curso x disciplina;
- aluno x turma.

Essas relacoes foram resolvidas com:
- `CursoDisciplina`
- `Matricula`

### 6.3 Auto-relacionamento
O auto-relacionamento aparece em:
- disciplina x disciplina, no caso dos pre-requisitos.

Ele foi resolvido com:
- `DisciplinaPrerequisito`

### 6.4 Relacao um para um
Nao identificamos nenhuma relacao `1:1` obrigatoria no enunciado.

Isso nao e um problema.

Uma boa modelagem nao precisa forcar todos os tipos de cardinalidade. Ela precisa representar corretamente aquilo que o problema realmente pede.

## 7. Como o modelo atende cada exigencia do enunciado

### 7.1 Aluno pode se matricular em varias disciplinas por semestre
Isso foi resolvido por `Matricula`.

Como o aluno pode ter varias matriculas, e cada matricula aponta para uma turma, o sistema consegue registrar varias disciplinas no mesmo semestre.

### 7.2 Uma disciplina pode ter varios alunos em diferentes turmas
Isso tambem foi resolvido corretamente.

O fluxo e:
- a disciplina pode gerar varias turmas;
- cada turma pode receber varias matriculas;
- assim, varios alunos podem cursar a mesma disciplina em turmas diferentes.

### 7.3 Disciplina pode ter pre-requisitos
Isso foi resolvido com `DisciplinaPrerequisito`.

Essa estrutura permite:
- um pre-requisito unico;
- varios pre-requisitos;
- consultas claras sobre dependencias entre disciplinas.

### 7.4 Professor pode lecionar varias disciplinas e varias turmas
Como cada turma guarda o `id_professor`, um professor pode aparecer em quantas turmas forem necessarias.

Isso resolve:
- varias disciplinas em semestres diferentes;
- varias turmas da mesma disciplina;
- historico de ensino ao longo do tempo.

### 7.5 Controle de vagas
O limite de vagas foi colocado em `Turma`, por meio de `capacidade_vagas`.

Esse foi o lugar correto porque:
- a lotacao acontece por oferta;
- duas turmas da mesma disciplina podem ter capacidades diferentes.

### 7.6 Notas e creditos
As notas foram colocadas em `Matricula`, porque sao dados do aluno naquela turma.

Os creditos foram colocados em `Disciplina`, porque fazem parte da definicao academica da materia.

Assim:
- `nota_final` depende da matricula;
- `creditos` dependem da disciplina.

## 8. Explicacao didatica da normalizacao

### 8.1 Por que normalizar
Normalizar significa organizar os dados de forma logica para evitar:
- repeticao desnecessaria;
- dados contraditorios;
- tabelas confusas;
- dificuldade de manutencao.

No nosso trabalho, a normalizacao foi importante porque o sistema academico possui muitas relacoes cruzadas.

### 8.2 Primeira Forma Normal
Na 1FN, cada campo deve guardar apenas um valor por vez.

Exemplo de erro:
- uma coluna chamada `horarios` com "segunda 19h, quarta 21h".

Isso seria ruim porque mistura varios valores no mesmo campo.

Como resolvemos:
- criamos `TurmaHorario`, separando cada horario em um registro proprio.

Outro exemplo:
- pre-requisitos nao ficaram em texto dentro da disciplina;
- criamos `DisciplinaPrerequisito`.

### 8.3 Segunda Forma Normal
Na 2FN, um atributo nao pode depender apenas de parte de uma chave composta.

Isso aparece principalmente em tabelas associativas.

Exemplo:
- em `CursoDisciplina`, os atributos precisam fazer sentido para a combinacao entre curso e disciplina;
- por isso, `periodo_sugerido` e `obrigatoria` fazem sentido ali.

Ja os dados da disciplina, como nome e ementa, ficaram somente em `Disciplina`.

### 8.4 Terceira Forma Normal
Na 3FN, os atributos devem depender diretamente da chave primaria, e nao de outro atributo nao-chave.

Exemplo de erro:
- guardar o nome do departamento dentro de `Aluno`.

Isso seria incorreto porque:
- o aluno pertence ao curso;
- o curso pertence ao departamento;
- entao o departamento seria uma dependencia indireta.

Como resolvemos:
- o departamento ficou apenas em `Departamento`;
- o curso ficou apenas em `Curso`;
- o aluno aponta para o curso.

Esse encadeamento evita redundancia e mantem a estrutura limpa.

## 9. Por que nossa solucao faz sentido
Nossa modelagem faz sentido porque separa corretamente:
- o que e entidade;
- o que e relacionamento;
- o que e atributo permanente;
- o que e atributo de uma ocorrencia especifica.

Alguns exemplos claros:

### 9.1 A nota nao fica em Aluno
Porque a nota nao pertence ao aluno de forma geral.

Ela pertence:
- ao aluno;
- em uma turma especifica;
- em uma disciplina especifica;
- em um semestre especifico.

Por isso, ela fica em `Matricula`.

### 9.2 O professor nao fica em Disciplina
Porque a disciplina existe independentemente de quem a ministra.

Quem assume a oferta concreta da disciplina e a turma.

Por isso:
- `Disciplina` representa a materia;
- `Turma` representa a oferta da materia;
- `Turma` aponta para o professor.

### 9.3 O pre-requisito nao fica como texto
Porque texto solto dificulta validacao, consulta e integridade.

Com `DisciplinaPrerequisito`, o banco entende de forma estruturada qual disciplina depende de qual outra.

## 10. Resumo tecnico da solucao

### 10.1 Entidades
- Departamento
- Curso
- Aluno
- Professor
- Disciplina
- Turma
- TurmaHorario
- Matricula
- CursoDisciplina
- DisciplinaPrerequisito

### 10.2 Relacoes principais
- Departamento `1:N` Curso
- Curso `1:N` Aluno
- Disciplina `1:N` Turma
- Professor `1:N` Turma
- Turma `1:N` TurmaHorario
- Aluno `N:N` Turma, via Matricula
- Curso `N:N` Disciplina, via CursoDisciplina
- Disciplina `N:N` Disciplina, via DisciplinaPrerequisito

### 10.3 Elementos mais importantes do modelo
- `Matricula` resolve o problema das inscricoes dos alunos
- `Turma` concentra semestre, professor e vagas
- `TurmaHorario` evita campo multivalorado
- `CursoDisciplina` organiza a grade dos cursos
- `DisciplinaPrerequisito` implementa os pre-requisitos

## 11. Como o grupo pode explicar o trabalho em apresentacao
Se o grupo precisar apresentar oralmente, a linha de explicacao pode ser esta:

### 11.1 Comeco
"Nosso primeiro passo foi identificar as entidades principais do sistema academico: aluno, professor, curso, disciplina e turma."

### 11.2 Meio
"Depois, analisamos os cenarios complexos do enunciado, especialmente matriculas, pre-requisitos, vagas, notas e turmas em diferentes semestres."

### 11.3 Estrutura
"A partir disso, criamos entidades associativas para resolver relacoes muitos para muitos, como Matricula e CursoDisciplina, e tambem criamos uma entidade especifica para pre-requisitos."

### 11.4 Normalizacao
"Por fim, validamos a estrutura ate a 3FN, separando horarios, pre-requisitos e demais informacoes para evitar redundancia e manter o modelo consistente."

### 11.5 Fechamento
"O resultado foi um modelo escalavel, organizado e aderente ao que o enunciado pediu."

## 12. Conclusao final
O trabalho foi pensado para nao apenas cumprir o enunciado, mas tambem fazer sentido do ponto de vista de modelagem de dados.

Nossa solucao:
- representa corretamente o contexto academico;
- atende aos cenarios complexos pedidos;
- utiliza entidades associativas quando necessario;
- aplica chaves primarias e estrangeiras;
- respeita a normalizacao ate a 3FN;
- permite que o grupo explique cada decisao com clareza.

## 13. Arquivos de apoio
Este documento deve ser lido junto com:
- [03_ENTREGA_FINAL_CASO_1B.md](/home/jeffharris/mba_mackenzie/disciplines/data_prep/caso1b/03_ENTREGA_FINAL_CASO_1B.md)
- [05_DER_CASO_1B.dbml](/home/jeffharris/mba_mackenzie/disciplines/data_prep/caso1b/05_DER_CASO_1B.dbml)
- [02_GLOSSARIO_CASO_1B.md](/home/jeffharris/mba_mackenzie/disciplines/data_prep/caso1b/02_GLOSSARIO_CASO_1B.md)
