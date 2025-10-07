-- Commit separado: manipulacao.sql

-- Inseririndo locais
INSERT INTO Local (nome, cidade, estado) VALUES ('Parque Estadual', 'Campo Grande', 'MS');

-- Inseririndo usuários
INSERT INTO Usuario (nome, email, senha) VALUES ('Joyce Hellen', 'joyce@example.com', 'senhaSegura123');

-- Inseririndo projetos
INSERT INTO Projeto (nome, descricao, data_inicio, data_fim, local_id)
VALUES ('Recuperação do Rio', 'Projeto para recuperar rios assoreados', '2025-01-01', '2025-06-30', 1);

-- Registrar participação
INSERT INTO Participacao (usuario_id, projeto_id, papel) VALUES (1, 1, 'Coordenadora');

-- Inserir atividades
INSERT INTO Atividade (projeto_id, descricao, data) VALUES (1, 'Limpeza das margens do rio', '2025-02-15');

-- Consultar participantes do projeto
SELECT u.nome, p.papel 
FROM Usuario u
JOIN Participacao p ON u.id = p.usuario_id
WHERE p.projeto_id = 1;