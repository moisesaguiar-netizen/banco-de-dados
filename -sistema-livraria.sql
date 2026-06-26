-- Criação do banco de dados em SQLite Online
-- Adaptado para SQLite com as tabelas Clientes e Compras

-- Tabela Clientes
CREATE TABLE Clientes (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeCliente VARCHAR(255) NOT NULL,
    emailCliente VARCHAR(255) NOT NULL
);

-- Tabela Compras
CREATE TABLE Compras (
    CompraID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClienteID INTEGER NOT NULL,
    NomeLivro VARCHAR(255) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Inserção de dados de exemplo para testes

-- Inserindo clientes
INSERT INTO Clientes (nomeCliente, emailCliente) VALUES 
('João Silva', 'joao@example.com'),
('Maria Santos', 'maria@example.com'),
('Carlos Oliveira', 'carlos@example.com'),
('Ana Costa', 'ana@example.com');

-- Inserindo compras
INSERT INTO Compras (ClienteID, NomeLivro) VALUES 
(1, 'O Senhor dos Anéis'),
(1, '1984'),
(2, 'Dom Casmurro'),
(2, 'Memórias Póstumas de Brás Cubas'),
(3, 'O Cortiço'),
(4, 'Grande Sertão: Veredas');

-- Consultas úteis

-- Listar todos os clientes
SELECT * FROM Clientes;

-- Listar todas as compras
SELECT * FROM Compras;

-- Listar compras com informações do cliente
SELECT 
    c.nomeCliente,
    c.emailCliente,
    co.NomeLivro
FROM Compras co
INNER JOIN Clientes c ON co.ClienteID = c.ID;

-- Contar compras por cliente
SELECT 
    c.nomeCliente,
    COUNT(co.CompraID) AS TotalCompras
FROM Clientes c
LEFT JOIN Compras co ON c.ID = co.ClienteID
GROUP BY c.nomeCliente;
