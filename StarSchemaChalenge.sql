CREATE DATABASE UniversidadeStarSchema;
USE UniversidadeStarSchema;

CREATE TABLE Dim_Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(100),
    email_professor VARCHAR(100),
    titulo VARCHAR(50),
    id_departamento INT, 
    FOREIGN KEY (id_departamento) REFERENCES Dim_Departamento(id_departamento)
);

CREATE TABLE Dim_Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_departamento VARCHAR(100),
    campus VARCHAR(100),
    coordenador VARCHAR(100)
);

CREATE TABLE Dim_Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    id_departamento INT, 
    FOREIGN KEY (id_departamento) REFERENCES Dim_Departamento(id_departamento)
);

CREATE TABLE Dim_Disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(100),
    carga_horaria INT,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Dim_Professor(id_professor)
);

CREATE TABLE Dim_Data (
    id_data INT PRIMARY KEY AUTO_INCREMENT,
    data_completa DATE,
    ano INT,
    mes INT,
    dia INT,
    trimestre INT,
    semestre INT
);

CREATE TABLE Fato_Professor_Disciplina (
    id_fato INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT,
    id_departamento INT,
    id_curso INT,
    id_disciplina INT,
    id_data INT,
    carga_horaria INT,
    -- Relacionando as dimensões
    FOREIGN KEY (id_professor) REFERENCES Dim_Professor(id_professor),
    FOREIGN KEY (id_departamento) REFERENCES Dim_Departamento(id_departamento),
    FOREIGN KEY (id_curso) REFERENCES Dim_Curso(id_curso),
    FOREIGN KEY (id_disciplina) REFERENCES Dim_Disciplina(id_disciplina),
    FOREIGN KEY (id_data) REFERENCES Dim_Data(id_data)
);

CREATE TABLE Disciplina_Curso (
    id_disciplina INT,
    id_curso INT,
    PRIMARY KEY (id_disciplina, id_curso),
    FOREIGN KEY (id_disciplina) REFERENCES Dim_Disciplina(id_disciplina),
    FOREIGN KEY (id_curso) REFERENCES Dim_Curso(id_curso)
);

CREATE TABLE Pre_requisitos (
    id_disciplina INT,
    id_pre_requisito INT,
    PRIMARY KEY (id_disciplina, id_pre_requisito),
    FOREIGN KEY (id_disciplina) REFERENCES Dim_Disciplina(id_disciplina),
    FOREIGN KEY (id_pre_requisito) REFERENCES Dim_Disciplina(id_disciplina)
);

CREATE TABLE Dim_Aluno (
    id_aluno INT PRIMARY KEY,          -- ID único do aluno
    nome_aluno VARCHAR(100) NOT NULL,  -- Nome completo do aluno
    data_nascimento DATE,              -- Data de nascimento do aluno
    genero VARCHAR(10),                -- Gênero do aluno (opcional)
    email VARCHAR(100),                -- Email do aluno
    telefone VARCHAR(20),              -- Telefone do aluno
    endereco VARCHAR(200)              -- Endereço do aluno
);


CREATE TABLE Matriculado (
    id_aluno INT,
    id_curso INT,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES Dim_Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Dim_Curso(id_curso)
);


INSERT INTO Dim_Professor (nome_professor, email_professor, titulo, id_departamento)
VALUES 
('João Silva', 'joao.silva@universidade.com', 'Doutor', 1),
('Maria Souza', 'maria.souza@universidade.com', 'Mestre', 2);

INSERT INTO Dim_Departamento (nome_departamento, campus, coordenador)
VALUES 
('Ciência da Computação', 'Campus Central', 'Carlos Santos'),
('Matemática', 'Campus Norte', 'Ana Lima');

INSERT INTO Dim_Curso (nome_curso, id_departamento)
VALUES 
('Engenharia de Software', 1),
('Estatística', 2);

INSERT INTO Dim_Disciplina (nome_disciplina, carga_horaria, id_professor)
VALUES 
('Algoritmos e Programação', 60, 1),
('Cálculo Diferencial', 80, 2);

INSERT INTO Dim_Data (data_completa, ano, mes, dia, trimestre, semestre)
VALUES 
('2024-01-15', 2024, 1, 15, 1, 1),
('2024-02-20', 2024, 2, 20, 1, 1);

INSERT INTO Dim_Aluno (id_aluno, nome_aluno, data_nascimento, genero, email, telefone, endereco)
VALUES 
(1, 'João Silva', '2001-05-15', 'Masculino', 'joao.silva@email.com', '34-9999-9999', 'Rua A, 123, Uberlândia'),
(2, 'Maria Souza', '1999-08-10', 'Feminino', 'maria.souza@email.com', '34-8888-8888', 'Rua B, 456, Uberaba'),
(3, 'Carlos Santos', '2002-12-25', 'Masculino', 'carlos.santos@email.com', '34-7777-7777', 'Rua C, 789, Uberlândia');

INSERT INTO Fato_Professor_Disciplina (id_professor, id_departamento, id_curso, id_disciplina, id_data, carga_horaria)
VALUES 
(1, 1, 1, 1, 1, 60),
(2, 2, 2, 2, 2, 80);


 












