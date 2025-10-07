-- Commit separado: schema.sql

CREATE TABLE Usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  senha VARCHAR(100) NOT NULL
);

CREATE TABLE Local (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cidade VARCHAR(100),
  estado VARCHAR(50)
);

CREATE TABLE Projeto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  data_inicio DATE,
  data_fim DATE,
  local_id INT,
  FOREIGN KEY (local_id) REFERENCES Local(id)
);

CREATE TABLE Participacao (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT,
  projeto_id INT,
  papel VARCHAR(50),
  FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
  FOREIGN KEY (projeto_id) REFERENCES Projeto(id)
);

CREATE TABLE Atividade (
  id INT PRIMARY KEY AUTO_INCREMENT,
  projeto_id INT,
  descricao TEXT,
  data DATE,
  FOREIGN KEY (projeto_id) REFERENCES Projeto(id)
);