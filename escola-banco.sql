## Criação do banco de dados

```sql
CREATE DATABASE escola;
```

```sql
-- MySQL
USE escola;
```

```sql
-- PostgreSQL
-- \c escola;
```

---

## Tabela: alunos

```sql
CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);
```

---

## Tabela: professores

```sql
CREATE TABLE professores (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);
```

---

## Tabela: disciplinas

```sql
CREATE TABLE disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);
```

---

## Tabela: turmas

```sql
CREATE TABLE turmas (
    id_turma SERIAL PRIMARY KEY,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);
```

---

## Tabela: matrículas

Relaciona alunos com turmas (N para N)

```sql
CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES turmas(id_turma),
    UNIQUE (id_aluno, id_turma)
);
```

---

## Tabela: notas

```sql
CREATE TABLE notas (
    id_nota SERIAL PRIMARY KEY,
    id_matricula INT NOT NULL,
    nota DECIMAL(4,2) CHECK (nota >= 0 AND nota <= 10),
    FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);
```

---

## Exemplo de inserção de dados

```sql
INSERT INTO alunos (nome, data_nascimento, email)
VALUES ('João Silva', '2005-03-10', 'joao@email.com');

INSERT INTO professores (nome, email)
VALUES ('Maria Souza', 'maria@escola.com');

INSERT INTO disciplinas (nome, carga_horaria)
VALUES ('Matemática', 80);

INSERT INTO turmas (id_disciplina, id_professor, ano, semestre)
VALUES (1, 1, 2025, 1);


