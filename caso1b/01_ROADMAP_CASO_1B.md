# Roadmap de Entrega - Caso 1B

## Objetivo
Entregar uma solucao completa para o caso da Universidade Internacional do Conhecimento, contemplando o DER, o modelo relacional e a justificativa de normalizacao ate a 3FN.

## Ordem de execucao recomendada

### 1. Ler e decompor o enunciado
Primeiro, devemos transformar o texto do caso em requisitos objetivos.

Entregaveis desta etapa:
- Lista das entidades citadas no problema.
- Lista dos atributos obrigatorios de cada entidade.
- Lista das regras de negocio explicitas.
- Lista dos cenarios complexos que o modelo precisa suportar.

Critero de conclusao:
- Nenhum requisito do enunciado fica sem mapeamento.

### 2. Definir as entidades principais
Com os requisitos organizados, devemos identificar as entidades centrais do dominio academico.

Entidades iniciais esperadas:
- Aluno
- Professor
- Curso
- Disciplina
- Turma
- Departamento
- Matricula

Observacao:
- Nesta etapa ainda nao devemos detalhar tudo; o foco e estabelecer a base estrutural do modelo.

Critero de conclusao:
- Todas as entidades principais possuem nome claro e papel definido.

### 3. Definir atributos e chaves primarias
Depois da definicao das entidades, devemos listar os atributos de cada uma e escolher suas chaves primarias.

Exemplos do que precisa ser definido:
- Identificadores unicos
- Dados pessoais
- Dados academicos
- Atributos operacionais, como status, semestre, vagas e carga horaria

Critero de conclusao:
- Cada entidade possui PK definida e atributos sem ambiguidade.

### 4. Mapear relacionamentos e cardinalidades
Antes de desenhar o DER final, precisamos definir como as entidades se conectam.

Relacoes que devem ser validadas:
- Curso -> Disciplina
- Aluno -> Curso
- Aluno -> Turma
- Professor -> Turma
- Disciplina -> Turma
- Disciplina -> Disciplina, para pre-requisitos
- Departamento -> Curso

Pontos de atencao:
- Identificar relacoes 1:N
- Identificar relacoes N:N
- Verificar se ha necessidade de 1:1
- Verificar auto-relacionamento em Disciplina

Critero de conclusao:
- Toda relacao possui cardinalidade justificada.

### 5. Resolver os cenarios complexos do caso
Esta etapa e critica, porque o enunciado cobra explicitamente esses comportamentos.

Cenarios obrigatorios:
- Matricula de um aluno em multiplas disciplinas por semestre
- Multiplos alunos em uma mesma turma
- Controle de pre-requisitos
- Professor lecionando varias disciplinas e varias turmas em diferentes semestres
- Controle de vagas ocupadas
- Registro de notas e creditos

Decisao esperada:
- Criar entidades associativas quando necessario, especialmente para relacoes N:N

Critero de conclusao:
- Todos os cenarios do enunciado podem ser representados sem redundancia estrutural.

### 6. Montar o DER conceitual
Com entidades, atributos e relacionamentos definidos, devemos consolidar o DER.

O DER deve mostrar:
- Entidades
- Atributos principais
- PKs
- FKs
- Cardinalidades
- Entidades associativas

Critero de conclusao:
- O DER representa integralmente o problema e pode ser convertido em tabelas sem perda de significado.

### 7. Converter o DER em modelo relacional
Depois do DER, devemos transformar o desenho conceitual em tabelas.

Entregaveis desta etapa:
- Nome das tabelas
- Colunas
- PKs
- FKs
- Tabelas associativas

Critero de conclusao:
- O esquema relacional reflete exatamente o DER.

### 8. Validar a normalizacao ate 3FN
Com o modelo relacional em maos, devemos revisar dependencias e redundancias.

Validacoes esperadas:
- 1FN: atributos atomicos e sem grupos repetidos
- 2FN: sem dependencia parcial de chave composta
- 3FN: sem dependencia transitiva indevida

Critero de conclusao:
- Existe justificativa clara de que o modelo esta em 3FN.

### 9. Preparar a documentacao final
Por fim, devemos organizar a entrega em formato claro e defensavel.

Pacote final sugerido:
- Resumo do problema
- Requisitos levantados
- Lista de entidades e atributos
- Relacionamentos e cardinalidades
- DER final
- Modelo relacional
- Justificativa da normalizacao
- Observacoes sobre regras de negocio

Critero de conclusao:
- A entrega pode ser lida por um professor sem explicacao adicional.

## O que fazer primeiro, na pratica
Se o objetivo for avancar com velocidade, a sequencia imediata deve ser:

1. Extrair os requisitos do enunciado em uma lista objetiva.
2. Listar entidades, atributos e chaves primarias.
3. Definir relacionamentos e cardinalidades.
4. Resolver os casos complexos com entidades associativas e auto-relacionamentos.
5. Desenhar o DER.
6. Converter para modelo relacional.
7. Revisar a normalizacao ate 3FN.
8. Organizar a versao final para entrega.

## Resultado esperado
Ao seguir este roadmap, a solucao final deve entregar:
- Um DER coerente e completo
- Um modelo relacional consistente
- Regras de negocio representadas corretamente
- Justificativa tecnica de normalizacao ate 3FN
