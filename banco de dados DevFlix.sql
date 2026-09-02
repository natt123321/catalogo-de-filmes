CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT now(),
    atualizado_em TIMESTAMP
);

CREATE TABLE filmes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    ano_lancamento DATE NOT NULL,
    genero VARCHAR(100) NOT NULL,
    nota DECIMAL(3,1) CHECK (nota >= 0 AND nota <= 10),
    capa_url TEXT,
    criado_em TIMESTAMP NOT NULL DEFAULT now(),
    atualizado_em TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO usuarios (nome, email, senha)
VALUES
('Ana Silva', 'ana@email.com', '123456'),
('João Santos', 'joao@email.com', '123456'),
('Maria Oliveira', 'maria@email.com', '123456'),
('Pedro Souza', 'pedro@email.com', '123456'),
('Lucas Ferreira', 'lucas@email.com', '123456');


INSERT INTO filmes (usuario_id, titulo, ano_lancamento, genero, nota, capa_url)
VALUES
(1, 'Interestelar', '2014-11-06', 'Ficção Científica', 9.5, 'https://exemplo.com/interestelar.jpg'),
(2, 'O Rei Leão', '1994-06-24', 'Animação', 9.0, 'https://exemplo.com/reileao.jpg'),
(3, 'Homem-Aranha', '2002-05-17', 'Ação', 8.5, 'https://exemplo.com/homemaranha.jpg'),
(1, 'Harry Potter e a Pedra Filosofal', '2001-11-23', 'Fantasia', 9.2, 'https://exemplo.com/harrypotter.jpg'),
(4, 'Toy Story', '1995-11-22', 'Animação', 8.8, 'https://exemplo.com/toystory.jpg');

SELECT * FROM usuarios;

SELECT * FROM filmes;

SELECT * FROM filmes WHERE usuario_id = 1;