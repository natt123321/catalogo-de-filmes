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

UPDATE filmes
SET capa_url = 'https://i.pinimg.com/1200x/0b/34/ce/0b34ce2145b475247577a5d438a199b0.jpg'
WHERE id = 1;

UPDATE filmes
SET capa_url = 'https://i.pinimg.com/1200x/12/b1/bb/12b1bb4ea3db0d572ddf06003196a63d.jpg'
WHERE titulo = 'Harry Potter e a Pedra Filosofal';

UPDATE filmes
SET capa_url = 'https://i.pinimg.com/1200x/d8/a4/84/d8a484f2b1ecaf38255daf8c4cad69cb.jpg'
WHERE id = 3;

UPDATE filmes
SET capa_url = 'https://i.pinimg.com/1200x/26/e7/9c/26e79ce4b033f4859264ca7ee682acf8.jpg'
WHERE titulo = 'Toy Story';

UPDATE filmes
SET capa_url = 'https://i.pinimg.com/736x/ee/73/35/ee733577a5724b59de70e4f1f335f874.jpg'
WHERE id = 2;

DELETE FROM filmes
WHERE id = 8;

