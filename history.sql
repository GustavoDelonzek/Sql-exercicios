/* 2025-02-27 00:01:02 [104 ms] */ 
CREATE TABLE departamento(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    create_time DATETIME,
    name VARCHAR(255)
);
/* 2025-02-27 08:44:02 [123 ms] */ 
CREATE TABLE vendedor(
    codVendedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    dataNascimento DATE,
    endereco VARCHAR(60)
);
/* 2025-02-27 08:44:59 [39 ms] */ 
CREATE TABLE cidade(
    codCidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    siglaEstado VARCHAR(2) NOT NULL
);
/* 2025-02-27 08:45:06 [95 ms] */ 
CREATE TABLE estado(
    siglaEstado VARCHAR(2),
    nome VARCHAR(30) NOT NULL
);
/* 2025-02-27 08:45:12 [109 ms] */ 
CREATE TABLE departamento(  
    codDepartamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-27 11:04:00 [79 ms] */ 
CREATE TABLE itemPedido(
    codPedido INT NOT NULL,
    codProduto INT NOT NULL,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0)
);
/* 2025-02-27 11:15:31 [72 ms] */ 
CREATE TABLE pedido(
    codPedido SERIAL,
    dataRealizacao DATE DEFAULT(CURRENT_DATE),
    dataEntrega DATE,
    codFornecedor INT NOT NULL,
    valor NUMERIC(20, 2)
);
/* 2025-02-27 11:16:00 [140 ms] */ 
CREATE TABLE fornecedor(
    codFornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE,
    razaoSocial VARCHAR(80) NOT NULL UNIQUE,
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE,
    endereco VARCHAR(60),
    telefone VARCHAR(20),
    codCidade INT NOT NULL
);
/* 2025-02-27 11:41:34 [82 ms] */ 
CREATE TABLE itemVenda(
    codVenda INT NOT NULL,
    codProduto INT NOT NULL,
    numeroLote INT NOT NULL,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0)
);
/* 2025-02-27 11:42:06 [47 ms] */ 
CREATE TABLE venda(
    codVenda INT NOT NULL PRIMARY KEY,
    codProduto INT NOT NULL,
    codVendedor INT NOT NULL,
    dataVenda DATE DEFAULT(CURRENT_DATE),
    enderecoEntrega VARCHAR(60),
    status VARCHAR(30)
);
/* 2025-02-27 11:42:09 [84 ms] */ 
CREATE TABLE produtoLote(
    codProduto INT NOT NULL,
    numeroLote INT NOT NULL PRIMARY KEY,
    quantidadeAdquirida NUMERIC(14,2),
    quantidadeVendida NUMERIC(14,2),
    precoCusto NUMERIC(14,2),
    dataValidade DATE
);
/* 2025-02-27 11:42:13 [80 ms] */ 
CREATE TABLE produto(
    codProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(40) NOT NULL,
    unidadeMedida CHAR(2),
    embalagem VARCHAR(15) DEFAULT 'Fardo',
    codClasse INT,
    precoVenda NUMERIC(14,2),
    estoqueMinimo NUMERIC(14,2)
);
/* 2025-02-27 11:42:26 [36 ms] */ 
CREATE TABLE classe(
    codClasse INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sigla VARCHAR(12),
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(80)
);
/* 2025-02-27 11:42:35 [65 ms] */ 
CREATE TABLE clienteJuridico(
    codCliente INT NOT NULL,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE PRIMARY KEY,
    razaoSocial VARCHAR(80),
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE
);
/* 2025-02-27 11:42:37 [49 ms] */ 
CREATE TABLE clienteFisico(
    codInteiro INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE,
    cpf VARCHAR(11) NOT NULL UNIQUE PRIMARY KEY,
    rg VARCHAR(8)
);
/* 2025-02-27 11:42:54 [50 ms] */ 
CREATE TABLE cliente(
    codCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(60),
    codCidade INT NOT NULL,
    telefone VARCHAR(20),
    tipo CHAR(1) CHECK(tipo in ('F', 'J')),
    dataCadastro DATE DEFAULT(CURRENT_DATE),
    cep CHAR(8)
);
/* 2025-02-27 11:43:08 [85 ms] */ 
CREATE TABLE vendedor(
    codVendedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade INT,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento INT
);
/* 2025-02-27 11:43:16 [40 ms] */ 
CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    create_time DATETIME COMMENT 'Create Time',
    name VARCHAR(255)
) COMMENT '';
/* 2025-02-27 11:43:39 [130 ms] */ 
CREATE TABLE cidade(
    codCidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    siglaEstado CHAR(2) NOT NULL
);
/* 2025-02-27 11:43:49 [48 ms] */ 
CREATE TABLE estado(
    siglaEstado CHAR(2),
    nome VARCHAR(30) NOT NULL
);
/* 2025-02-27 11:43:56 [55 ms] */ 
CREATE TABLE departamento(  
    codDepartamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-27 14:31:06 [13 ms] */ 
SELECT * FROM produto LIMIT 100;
/* 2025-02-27 14:32:54 [9 ms] */ 
SELECT fornecedor.`codFornecedor`, fornecedor.`nomeFantasia`, fornecedor.endereco, fornecedor.telefone, fornecedor.`codCidade` FROM fornecedor LIMIT 100;
/* 2025-02-27 14:36:17 [9 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda` FROM venda WHERE venda.status = 'Despachada' LIMIT 100;
/* 2025-02-27 14:39:32 [1 ms] */ 
SELECT `produtoLote`.`numeroLote` FROM `produtoLote` WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-27 14:39:50 [4 ms] */ 
SELECT produtoLote.`numeroLote` FROM `produtoLote` WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-27 14:40:24 [5 ms] */ 
SELECT departamento.nome FROM departamento LIMIT 100;
