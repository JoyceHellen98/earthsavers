-- Criação das tabelas
CREATE TABLE Usuario (
    id_usuario INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL
);

CREATE TABLE Iniciativa (
    id_iniciativa INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    descricao TEXT,
    localizacao TEXT,
    data_inicio DATE,
    id_usuario INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Impacto (
    id_impacto INTEGER PRIMARY KEY,
    tipo TEXT NOT NULL
);

CREATE TABLE Iniciativa_Impacto (
    id_iniciativa INTEGER,
    id_impacto INTEGER,
    PRIMARY KEY (id_iniciativa, id_impacto),
    FOREIGN KEY (id_iniciativa) REFERENCES Iniciativa(id_iniciativa),
    FOREIGN KEY (id_impacto) REFERENCES Impacto(id_impacto)
);

-- Inserção de dados
INSERT INTO Usuario (nome, email, senha) VALUES 
('João Silva', 'joao@email.com', '123456'),
('Maria Souza', 'maria@email.com', 'abcdef');

INSERT INTO Impacto (tipo) VALUES ('Queimadas'), ('Desmatamento');

INSERT INTO Iniciativa (titulo, descricao, localizacao, data_inicio, id_usuario) 
VALUES 
('Reflorestamento Local', 'Plantio de árvores nativas', 'Campo Grande', '2025-06-20', 1),
('Limpeza de Rio', 'Remoção de resíduos no rio Anhanduí', 'Campo Grande', '2025-06-21', 2);

INSERT INTO Iniciativa_Impacto (id_iniciativa, id_impacto) VALUES 
(1, 2),
(2, 1);

-- Consulta de iniciativas de um usuário
SELECT titulo, descricao FROM Iniciativa WHERE id_usuario = 1;

-- Atualização de uma iniciativa
UPDATE Iniciativa SET titulo = 'Reflorestamento Urbano' WHERE id_iniciativa = 1;

-- Remoção de um impacto
DELETE FROM Impacto WHERE id_impacto = 2;
