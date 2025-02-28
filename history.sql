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
/* 2025-02-27 16:25:23 [72 ms] */ 
CREATE TABLE departamento(  
    codDepartamento SERIAL PRIMARY KEY  ,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-27 16:25:25 [65 ms] */ 
CREATE TABLE estado(
    siglaEstado CHAR(2) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL UNIQUE
);
/* 2025-02-27 16:25:26 [77 ms] */ 
CREATE TABLE cidade(
    codCidade SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    siglaEstado CHAR(2) NOT NULL,
    CONSTRAINT FK_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES estado(siglaEstado)  
);
/* 2025-02-27 16:33:00 [62 ms] */ 
CREATE TABLE vendedor(
    codVendedor SERIAL PRIMARY KEY,
    nome VARCHAR(60),
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento BIGINT UNSIGNED,
    CONSTRAINT FK_codCidade FOREIGN KEY (codCidade) REFERENCES cidade(codCidade),
    CONSTRAINT FK_codDepartamento FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento)
);
/* 2025-02-27 16:35:30 [81 ms] */ 
CREATE TABLE departamento(  
    codDepartamento SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-27 16:35:32 [75 ms] */ 
CREATE TABLE estado(
    siglaEstado CHAR(2) PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL UNIQUE
);
/* 2025-02-27 16:35:33 [40 ms] */ 
CREATE TABLE cidade(
    codCidade SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL,
    siglaEstado CHAR(2) NOT NULL,
    CONSTRAINT FK_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES estado(siglaEstado)  
);
/* 2025-02-27 16:35:34 [87 ms] */ 
CREATE TABLE vendedor(
    codVendedor SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(60),
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento BIGINT UNSIGNED,
    CONSTRAINT FK_codCidade FOREIGN KEY (codCidade) REFERENCES cidade(codCidade),
    CONSTRAINT FK_codDepartamento FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento)
);
/* 2025-02-27 16:37:39 [87 ms] */ 
CREATE TABLE departamento(  
    codDepartamento SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-27 16:37:40 [77 ms] */ 
CREATE TABLE estado(
    siglaEstado CHAR(2) PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL UNIQUE
);
/* 2025-02-27 16:37:42 [50 ms] */ 
CREATE TABLE cidade(
    codCidade SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    siglaEstado CHAR(2) NOT NULL,
    CONSTRAINT FK_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES estado(siglaEstado)  
);
/* 2025-02-27 16:37:43 [94 ms] */ 
CREATE TABLE vendedor(
    codVendedor SERIAL PRIMARY KEY,
    nome VARCHAR(60),
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento BIGINT UNSIGNED,
    CONSTRAINT FK_codCidade FOREIGN KEY (codCidade) REFERENCES cidade(codCidade),
    CONSTRAINT FK_codDepartamento FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento)
);
/* 2025-02-27 16:38:49 [84 ms] */ 
CREATE TABLE cliente(
    codCliente SERIAL PRIMARY KEY,
    endereco VARCHAR(60),
    codCidade BIGINT UNSIGNED,
    telefone VARCHAR(20),
    tipo CHAR(1) CHECK(tipo in ('F', 'J')),
    dataCadastro DATE DEFAULT(CURRENT_DATE),
    cep CHAR(8),
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade)
);
/* 2025-02-27 17:18:37 [71 ms] */ 
CREATE TABLE cidade(
    codCidade SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    siglaEstado CHAR(2) NOT NULL,
    CONSTRAINT FK_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES estado(siglaEstado)  
);
/* 2025-02-27 17:18:42 [55 ms] */ 
CREATE TABLE cliente(
    codCliente SERIAL PRIMARY KEY,
    endereco VARCHAR(60),
    codCidade BIGINT UNSIGNED,
    telefone VARCHAR(20),
    tipo CHAR(1) CHECK(tipo in ('F', 'J')),
    dataCadastro DATE DEFAULT(CURRENT_DATE),
    cep CHAR(8),
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade)
);
/* 2025-02-27 17:18:44 [95 ms] */ 
CREATE TABLE clienteFisico(
    codCliente BIGINT UNSIGNED PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(8),
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente)
);
/* 2025-02-27 17:19:38 [64 ms] */ 
CREATE TABLE clienteJuridico(
    codCliente BIGINT UNSIGNED PRIMARY KEY,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE,
    razaoSocial VARCHAR(80),
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente)
);
/* 2025-02-27 17:29:45 [60 ms] */ 
CREATE TABLE classe(
    codClasse SERIAL PRIMARY KEY,
    sigla VARCHAR(12),
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(80)
);
/* 2025-02-27 17:29:47 [68 ms] */ 
CREATE TABLE produto(
    codProduto SERIAL PRIMARY KEY,
    descricao VARCHAR(40) NOT NULL,
    unidadeMedida CHAR(2),
    embalagem VARCHAR(15) DEFAULT 'Fardo',
    codClasse BIGINT UNSIGNED,
    precoVenda NUMERIC(14,2),
    estoqueMinimo NUMERIC(14,2),
    FOREIGN KEY (codClasse) REFERENCES classe(codClasse)
);
/* 2025-02-27 23:30:06 [99 ms] */ 
CREATE TABLE produtoLote(
    codProduto BIGINT UNSIGNED,
    numeroLote SERIAL PRIMARY KEY,
    quantidadeAdquirida NUMERIC(14,2),
    quantidadeVendida NUMERIC(14,2),
    precoCusto NUMERIC(14,2),
    dataValidade DATE,
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto)
);
/* 2025-02-27 23:36:09 [59 ms] */ 
CREATE TABLE venda(
    codVenda SERIAL PRIMARY KEY,
    codCliente BIGINT UNSIGNED,
    codVendedor BIGINT UNSIGNED,
    dataVenda DATE DEFAULT(CURRENT_DATE),
    enderecoEntrega VARCHAR(60),
    status VARCHAR(30),
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente),
    FOREIGN KEY (codVendedor) REFERENCES vendedor(codVendedor)
);
/* 2025-02-27 23:56:34 [58 ms] */ 
CREATE TABLE itemVenda(
    codVenda BIGINT UNSIGNED,
    codProduto BIGINT UNSIGNED,
    numeroLote BIGINT UNSIGNED,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0),
    FOREIGN KEY (codVenda) REFERENCES venda(codVenda),
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto),
    FOREIGN KEY (codProduto, numeroLote) REFERENCES produtoLote(codProduto, numeroLote)
);
/* 2025-02-27 23:56:47 [115 ms] */ 
CREATE TABLE fornecedor(
    codFornecedor SERIAL PRIMARY KEY,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE,
    razaoSocial VARCHAR(80) NOT NULL UNIQUE,
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE,
    endereco VARCHAR(60),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade)
);
/* 2025-02-27 23:56:55 [100 ms] */ 
CREATE TABLE pedido(
    codPedido SERIAL PRIMARY KEY,
    dataRealizacao DATE DEFAULT(CURRENT_DATE),
    dataEntrega DATE,
    codFornecedor BIGINT UNSIGNED,
    valor NUMERIC(20, 2),
    FOREIGN KEY (codFornecedor) REFERENCES fornecedor(codFornecedor)
);
/* 2025-02-27 23:57:58 [64 ms] */ 
CREATE TABLE itemPedido(
    codPedido BIGINT UNSIGNED,
    codProduto BIGINT UNSIGNED,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0),
    FOREIGN KEY (codPedido) REFERENCES pedido(codPedido),
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto)
);
/* 2025-02-28 00:30:26 [382 ms] */ 
CREATE TABLE contasPagar(
    codTitulo SERIAL PRIMARY KEY,
    dataVencimento DATE NOT NULL,
    parcela INT,
    codPedido BIGINT UNSIGNED,
    valor NUMERIC(20, 2),
    dataPagamento DATE,
    localPagamento VARCHAR(80),
    juros NUMERIC(12,2),
    correcaoMonetaria NUMERIC(12,2),
    FOREIGN KEY (codPedido) REFERENCES pedido(codPedido)
);
/* 2025-02-28 00:33:10 [130 ms] */ 
CREATE TABLE contasReceber(
    codTitulo SERIAL PRIMARY KEY,
    dataVencimento DATE NOT NULL,
    codVenda BIGINT UNSIGNED,
    parcela INT,
    valor NUMERIC(20,2),
    dataPagamento DATE,
    localPagamento VARCHAR(80),
    juros NUMERIC(12,2),
    correcaoMonetaria NUMERIC(12,2),
    FOREIGN KEY (codVenda) REFERENCES venda(codVenda)
);
/* 2025-02-28 00:53:23 [78 ms] */ 
CREATE TABLE departamento(  
    codDepartamento SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-28 00:53:45 [130 ms] */ 
CREATE TABLE vendedor(
    codVendedor SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento BIGINT UNSIGNED,
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade),
    FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento)
);
/* 2025-02-28 01:04:36 [92 ms] */ 
CREATE TABLE vendedor(
    codVendedor SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento BIGINT UNSIGNED,
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento) ON DELETE SET NULL ON UPDATE CASCADE
);
/* 2025-02-28 01:05:08 [164 ms] */ 
CREATE TABLE vendedor(
    codVendedor SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    dataNascimento DATE,
    endereco VARCHAR(60),
    cep CHAR(8),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    dataContratacao DATE DEFAULT(CURRENT_DATE),
    codDepartamento BIGINT UNSIGNED,
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (codDepartamento) REFERENCES departamento(codDepartamento) ON DELETE SET NULL on update CASCADE
);
/* 2025-02-28 01:06:51 [112 ms] */ 
CREATE TABLE cliente(
    codCliente SERIAL PRIMARY KEY,
    endereco VARCHAR(60),
    codCidade BIGINT UNSIGNED,
    telefone VARCHAR(20),
    tipo CHAR(1) CHECK(tipo in ('F', 'J')),
    dataCadastro DATE DEFAULT(CURRENT_DATE),
    cep CHAR(8),
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade) on delete no action on update cascade
);
