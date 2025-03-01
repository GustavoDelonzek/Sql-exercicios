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
/* 2025-02-28 08:27:20 [45 ms] */ 
CREATE TABLE departamento(  
    codDepartamento SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);
/* 2025-02-28 08:27:21 [70 ms] */ 
CREATE TABLE estado(
    siglaEstado CHAR(2) PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL UNIQUE
);
/* 2025-02-28 08:27:22 [75 ms] */ 
CREATE TABLE cidade(
    codCidade SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    siglaEstado CHAR(2) NOT NULL,
    CONSTRAINT FK_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES estado(siglaEstado) 
    ON DELETE no action 
    ON UPDATE CASCADE
);
/* 2025-02-28 08:27:24 [62 ms] */ 
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
/* 2025-02-28 08:27:25 [64 ms] */ 
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
/* 2025-02-28 08:27:26 [40 ms] */ 
CREATE TABLE clienteFisico(
    codCliente BIGINT UNSIGNED PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(8),
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente) ON DELETE NO ACTION ON UPDATE CASCADE
);
/* 2025-02-28 08:27:28 [87 ms] */ 
CREATE TABLE clienteJuridico(
    codCliente BIGINT UNSIGNED PRIMARY KEY,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE,
    razaoSocial VARCHAR(80),
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente) ON DELETE NO ACTION ON UPDATE CASCADE
);
/* 2025-02-28 08:27:29 [80 ms] */ 
CREATE TABLE classe(
    codClasse SERIAL PRIMARY KEY,
    sigla VARCHAR(12),
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(80)
);
/* 2025-02-28 08:27:30 [85 ms] */ 
CREATE TABLE produto(
    codProduto SERIAL PRIMARY KEY,
    descricao VARCHAR(40) NOT NULL,
    unidadeMedida CHAR(2),
    embalagem VARCHAR(15) DEFAULT 'Fardo',
    codClasse BIGINT UNSIGNED,
    precoVenda NUMERIC(14,2),
    estoqueMinimo NUMERIC(14,2),
    FOREIGN KEY (codClasse) REFERENCES classe(codClasse) ON DELETE SET NULL ON UPDATE SET NULL
);
/* 2025-02-28 08:27:32 [74 ms] */ 
CREATE TABLE produtoLote(
    codProduto BIGINT UNSIGNED,
    numeroLote SERIAL PRIMARY KEY,
    quantidadeAdquirida NUMERIC(14,2),
    quantidadeVendida NUMERIC(14,2),
    precoCusto NUMERIC(14,2),
    dataValidade DATE,
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto) ON DELETE CASCADE ON UPDATE CASCADE
);
/* 2025-02-28 08:27:33 [80 ms] */ 
CREATE TABLE venda(
    codVenda SERIAL PRIMARY KEY,
    codCliente BIGINT UNSIGNED,
    codVendedor BIGINT UNSIGNED DEFAULT 100,
    dataVenda DATE DEFAULT(CURRENT_DATE),
    enderecoEntrega VARCHAR(60),
    status VARCHAR(30),
    FOREIGN KEY (codVendedor) REFERENCES vendedor(codVendedor) ON DELETE SET DEFAULT ON UPDATE CASCADE, 
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente) ON DELETE CASCADE ON UPDATE NO ACTION
);
/* 2025-02-28 08:27:34 [83 ms] */ 
CREATE TABLE itemVenda(
    codVenda BIGINT UNSIGNED,
    codProduto BIGINT UNSIGNED,
    numeroLote BIGINT UNSIGNED,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0),
    FOREIGN KEY (codVenda) REFERENCES venda(codVenda) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codProduto, numeroLote) REFERENCES produtoLote(codProduto, numeroLote) ON DELETE NO ACTION ON UPDATE CASCADE
);
/* 2025-02-28 08:27:36 [101 ms] */ 
CREATE TABLE fornecedor(
    codFornecedor SERIAL PRIMARY KEY,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE,
    razaoSocial VARCHAR(80) NOT NULL UNIQUE,
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE,
    endereco VARCHAR(60),
    telefone VARCHAR(20),
    codCidade BIGINT UNSIGNED,
    FOREIGN KEY (codCidade) REFERENCES cidade(codCidade) ON DELETE NO ACTION ON UPDATE CASCADE
);
/* 2025-02-28 08:27:39 [88 ms] */ 
CREATE TABLE pedido(
    codPedido SERIAL PRIMARY KEY,
    dataRealizacao DATE DEFAULT(CURRENT_DATE),
    dataEntrega DATE,
    codFornecedor BIGINT UNSIGNED,
    valor NUMERIC(20, 2),
    FOREIGN KEY (codFornecedor) REFERENCES fornecedor(codFornecedor) ON DELETE CASCADE ON UPDATE SET NULL
);
/* 2025-02-28 08:27:40 [88 ms] */ 
CREATE TABLE itemPedido(
    codPedido BIGINT UNSIGNED,
    codProduto BIGINT UNSIGNED,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0),
    FOREIGN KEY (codPedido) REFERENCES pedido(codPedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto)
);
/* 2025-02-28 08:27:42 [81 ms] */ 
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
    FOREIGN KEY (codPedido) REFERENCES pedido(codPedido) ON DELETE CASCADE ON UPDATE CASCADE
);
/* 2025-02-28 08:27:43 [83 ms] */ 
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
    FOREIGN KEY (codVenda) REFERENCES venda(codVenda)ON DELETE CASCADE ON UPDATE CASCADE
);
/* 2025-02-28 08:34:54 [3 ms] */ 
SELECT  vendedor.codVendedor, vendedor.nome, cidade.nome, estado.nome from vendedor 
right join cidade 
on cidade.`codCidade` = vendedor.`codCidade`
right join estado
on estado.`siglaEstado` = cidade.`siglaEstado` LIMIT 100;
/* 2025-02-28 08:41:26 [8 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
RIGHT JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE status = 'Despachada' LIMIT 100;
/* 2025-02-28 08:57:47 [7 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
RIGHT JOIN cliente ON cliente.`codCliente` =`clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 08:59:10 [10 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, `clienteJuridico`.`razaoSocial`, `clienteJuridico`.cgc, `clienteJuridico`.ie FROM `clienteJuridico` LIMIT 100;
/* 2025-02-28 09:04:06 [7 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
RIGHT JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
RIGHT JOIN cidade ON cliente.`codCidade` = cidade.`codCidade` LIMIT 100;
/* 2025-02-28 09:19:08 [37 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
RIGHT JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
RIGHT JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
/* 2025-02-28 09:37:08 [7 ms] */ 
SELECT vendedor.nome FROM venda
RIGHT JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
RIGHT JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = "Gelinski" LIMIT 100;
/* 2025-02-28 09:41:52 [10 ms] */ 
SELECT produto.`codProduto`, `produtoLote`.`numeroLote` FROM produto
RIGHT JOIN `produtoLote` ON produto.`codProduto` = `produtoLote`.`codProduto`
WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-28 09:43:14 [9 ms] */ 
SELECT departamento.nome, vendedor.nome FROM departamento
RIGHT JOIN vendedor ON departamento.`codDepartamento` = vendedor.`codDepartamento` LIMIT 100;
/* 2025-02-28 09:54:46 [7 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
INNER JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE status = 'Despachada' LIMIT 100;
/* 2025-02-28 15:47:00 [40 ms] */ 
INSERT INTO departamento (nome, descricaoFuncional, localizacao) 
VALUES 
('Vendas', 'Responsável pela comercialização dos produtos', 'Avenida Paulista, 1000'),
('Financeiro', 'Responsável pelo controle financeiro', 'Rua dos Três Irmãos, 300');
/* 2025-02-28 15:47:01 [59 ms] */ 
INSERT INTO estado (siglaEstado, nome) 
VALUES 
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Minas Gerais');
/* 2025-02-28 15:47:02 [56 ms] */ 
INSERT INTO cidade (nome, siglaEstado) 
VALUES 
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG');
/* 2025-02-28 15:47:23 [57 ms] */ 
INSERT INTO vendedor (nome, dataNascimento, endereco, cep, telefone, codCidade, dataContratacao, codDepartamento) 
VALUES 
('Carlos Silva', '1985-07-23', 'Rua da Esperança, 150', '12345678', '11 98765-4321', 1, '2022-05-10', 1),
('Fernanda Souza', '1990-02-15', 'Avenida Paulista, 400', '23456789', '21 99876-5432', 2, '2023-01-20', 2);
/* 2025-02-28 15:47:57 [14 ms] */ 
INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua dos Três Irmãos, 80', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');
/* 2025-02-28 15:48:34 [56 ms] */ 
INSERT INTO clienteFisico (codCliente, nome, dataNascimento, cpf, rg) 
VALUES 
(1, 'João da Silva', '1995-08-20', '12345678901', '1234567'),
(2, 'Maria Oliveira', '1988-12-10', '98765432109', '9876543');
/* 2025-02-28 15:49:35 [14 ms] */ 
INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua dos Três Irmãos, 80', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');
/* 2025-02-28 15:49:36 [16 ms] */ 
INSERT INTO clienteJuridico (codCliente, nomeFantasia, razaoSocial, ie, cgc) 
VALUES 
(3, 'TechSolutions', 'Tech Solutions Ltda', '1234567890', '12345678000199'),
(4, 'FastFoods', 'Fast Foods S.A.', '9876543210', '98765432000188');
/* 2025-02-28 15:49:48 [15 ms] */ 
INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua dos Três Irmãos, 80', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');
/* 2025-02-28 15:50:03 [57 ms] */ 
INSERT INTO classe (sigla, nome, descricao) 
VALUES 
('ELE', 'Eletrônicos', 'Produtos eletrônicos em geral'),
('MOD', 'Moda', 'Roupas e acessórios');
/* 2025-02-28 15:50:04 [60 ms] */ 
INSERT INTO produto (descricao, unidadeMedida, embalagem, codClasse, precoVenda, estoqueMinimo) 
VALUES 
('Smartphone', 'UN', 'Caixa', 1, 1500.00, 10),
('Camisa Polo', 'UN', 'Pacote', 2, 100.00, 50);
/* 2025-02-28 15:50:06 [55 ms] */ 
INSERT INTO produtoLote (codProduto, quantidadeAdquirida, quantidadeVendida, precoCusto, dataValidade) 
VALUES 
(1, 100, 30, 1200.00, '2025-12-31'),
(2, 200, 100, 80.00, '2026-06-30');
/* 2025-02-28 15:50:07 [55 ms] */ 
INSERT INTO venda (codCliente, codVendedor, dataVenda, enderecoEntrega, status) 
VALUES 
(1, 1, '2024-02-28', 'Rua dos Três Irmãos, 80', 'Concluída'),
(3, 2, '2024-02-25', 'Avenida Rio Branco, 500', 'Em Processamento');
/* 2025-02-28 15:50:09 [61 ms] */ 
INSERT INTO itemVenda (codVenda, codProduto, numeroLote, quantidade) 
VALUES 
(1, 1, 1, 1),
(1, 2, 2, 3);
/* 2025-02-28 15:50:10 [62 ms] */ 
INSERT INTO fornecedor (nomeFantasia, razaoSocial, ie, cgc, endereco, telefone, codCidade) 
VALUES 
('Global Supplies', 'Global Supplies S.A.', '1239876543', '12398765000111', 'Rua das Flores, 100', '11 32123-4321', 1),
('EletroTec', 'EletroTec Ltda', '4561237890', '45612378000122', 'Av. dos Eletrônicos, 400', '21 34567-8765', 2);
/* 2025-02-28 15:50:11 [60 ms] */ 
INSERT INTO pedido (dataRealizacao, dataEntrega, codFornecedor, valor) 
VALUES 
('2024-02-20', '2024-02-25', 1, 15000.00),
('2024-02-18', '2024-02-22', 2, 5000.00);
/* 2025-02-28 15:50:13 [58 ms] */ 
INSERT INTO itemPedido (codPedido, codProduto, quantidade) 
VALUES 
(1, 1, 10),
(2, 2, 50);
/* 2025-02-28 15:50:14 [64 ms] */ 
INSERT INTO contasPagar (dataVencimento, parcela, codPedido, valor, dataPagamento, localPagamento, juros, correcaoMonetaria) 
VALUES 
('2024-03-01', 1, 1, 15000.00, '2024-03-01', 'Banco do Brasil', 0.00, 0.00),
('2024-03-05', 2, 2, 5000.00, '2024-03-05', 'Caixa Econômica', 0.00, 0.00);
/* 2025-02-28 15:50:15 [53 ms] */ 
INSERT INTO contasReceber (dataVencimento, codVenda, parcela, valor, dataPagamento, localPagamento, juros, correcaoMonetaria) 
VALUES 
('2024-03-01', 1, 1, 2000.00, '2024-03-01', 'Banco do Brasil', 0.00, 0.00),
('2024-03-05', 2, 2, 3000.00, '2024-03-05', 'Caixa Econômica', 0.00, 0.00);
/* 2025-02-28 15:50:20 [52 ms] */ 
SELECT * FROM produto LIMIT 100;
/* 2025-02-28 15:50:25 [8 ms] */ 
SELECT fornecedor.`codFornecedor`, fornecedor.`nomeFantasia`, fornecedor.endereco, fornecedor.telefone, fornecedor.`codCidade` FROM fornecedor LIMIT 100;
/* 2025-02-28 15:50:28 [6 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda` FROM venda WHERE venda.status = 'Despachada' LIMIT 100;
/* 2025-02-28 15:51:32 [58 ms] */ 
INSERT INTO venda (codCliente, codVendedor, dataVenda, enderecoEntrega, status) 
VALUES 
(1, 1, '2024-02-28', 'Rua Marechal Floriano, 56', 'Despachada'),
(3, 2, '2024-02-25', 'Avenida Rio Branco, 500', 'Em Processamento');
/* 2025-02-28 15:51:37 [6 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda` FROM venda WHERE venda.status = 'Despachada' LIMIT 100;
/* 2025-02-28 15:51:43 [7 ms] */ 
SELECT * FROM `clienteJuridico` LIMIT 100;
/* 2025-02-28 15:51:46 [40 ms] */ 
SELECT produtoLote.`numeroLote` FROM `produtoLote` WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-28 15:51:51 [7 ms] */ 
SELECT departamento.nome FROM departamento LIMIT 100;
/* 2025-02-28 15:52:08 [8 ms] */ 
SELECT  vendedor.codVendedor, vendedor.nome, cidade.nome, estado.nome from vendedor 
INNER JOIN cidade 
on cidade.`codCidade` = vendedor.`codCidade`
INNER JOIN estado
on estado.`siglaEstado` = cidade.`siglaEstado` LIMIT 100;
/* 2025-02-28 15:52:14 [3 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
INNER JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE status = 'Despachada' LIMIT 100;
/* 2025-02-28 15:52:22 [7 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` =`clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:52:51 [13 ms] */ 
INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua Marechal Floriano, 56', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');
/* 2025-02-28 15:52:56 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` =`clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:53:00 [5 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
INNER JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE status = 'Despachada' LIMIT 100;
/* 2025-02-28 15:53:01 [2 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` =`clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:53:11 [57 ms] */ 
INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua Marechal Floriano, 56', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');
/* 2025-02-28 15:53:30 [6 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:53:50 [9 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, `clienteJuridico`.`razaoSocial`, `clienteJuridico`.cgc, `clienteJuridico`.ie FROM `clienteJuridico` LIMIT 100;
/* 2025-02-28 15:53:53 [2 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
INNER JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
INNER JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
/* 2025-02-28 15:54:07 [7 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
RIGHT JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:54:40 [4 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
LEFT JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:54:46 [6 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:55:58 [6 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
RIGHT JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = "Rua Marechal Floriano, 56" LIMIT 100;
/* 2025-02-28 15:56:14 [2 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
RIGHT JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = 'Rua Marechal Floriano, 56' LIMIT 100;
/* 2025-02-28 15:56:23 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = 'Rua Marechal Floriano, 56' LIMIT 100;
/* 2025-02-28 15:57:14 [1 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
INNER JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE status = 'Despachada' LIMIT 100;
/* 2025-02-28 15:57:17 [7 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
INNER JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = 'Rua Marechal Floriano, 56' LIMIT 100;
/* 2025-02-28 15:57:28 [4 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = 'Rua Marechal Floriano, 56' LIMIT 100;
/* 2025-02-28 15:57:31 [5 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, `clienteJuridico`.`razaoSocial`, `clienteJuridico`.cgc, `clienteJuridico`.ie FROM `clienteJuridico` LIMIT 100;
/* 2025-02-28 15:57:32 [26 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = 'Rua Marechal Floriano, 56' LIMIT 100;
/* 2025-02-28 15:58:11 [7 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco = 'Rua Rio Branco, 500' LIMIT 100;
/* 2025-02-28 16:00:08 [8 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua Rio Branco, 500%' LIMIT 100;
/* 2025-02-28 16:01:19 [5 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, `clienteJuridico`.`razaoSocial`, `clienteJuridico`.cgc, `clienteJuridico`.ie FROM `clienteJuridico` LIMIT 100;
/* 2025-02-28 16:01:20 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua Rio Branco, 500%' LIMIT 100;
/* 2025-02-28 16:03:12 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Avenida Rio Branco, 500%' LIMIT 100;
/* 2025-02-28 16:03:52 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua Marechal Floriano, 56%' LIMIT 100;
/* 2025-02-28 16:05:16 [4 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua Marechal%' LIMIT 100;
/* 2025-02-28 16:05:25 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua%' LIMIT 100;
/* 2025-02-28 16:07:29 [6 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Marechal%' LIMIT 100;
/* 2025-02-28 16:09:16 [74 ms] */ 
INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua Marechal Floriano, 56', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Rua Marechal Floriano, 56', 2, '11 93456-7890', 'F', '2024-02-28', '12345678'),

('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');
/* 2025-02-28 16:09:36 [73 ms] */ 
INSERT INTO clienteFisico (codCliente, nome, dataNascimento, cpf, rg) 
VALUES 
(3, 'Bernabeu', '1995-08-20', '32143242', '1234567'),
(4, 'Maria Oliveira', '1988-12-10', '124213432', '9876543');
/* 2025-02-28 16:09:42 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Marechal%' LIMIT 100;
/* 2025-02-28 16:09:48 [5 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua%' LIMIT 100;
/* 2025-02-28 16:10:59 [8 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
INNER JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
INNER JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
/* 2025-02-28 16:11:02 [2 ms] */ 
SELECT vendedor.nome FROM venda
INNER JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
RIGHT JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = "Gelinski" LIMIT 100;
/* 2025-02-28 16:11:48 [6 ms] */ 
SELECT departamento.nome, vendedor.nome FROM departamento
INNER JOIN vendedor ON departamento.`codDepartamento` = vendedor.`codDepartamento` LIMIT 100;
/* 2025-02-28 16:11:57 [4 ms] */ 
SELECT vendedor.nome FROM venda
INNER JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
RIGHT JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = "Gelinski" LIMIT 100;
/* 2025-02-28 16:11:59 [5 ms] */ 
SELECT produto.`codProduto`, `produtoLote`.`numeroLote` FROM produto
RIGHT JOIN `produtoLote` ON produto.`codProduto` = `produtoLote`.`codProduto`
WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-28 16:12:05 [7 ms] */ 
SELECT produto.`codProduto`, `produtoLote`.`numeroLote` FROM produto
JOIN `produtoLote` ON produto.`codProduto` = `produtoLote`.`codProduto`
WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-28 16:12:13 [5 ms] */ 
SELECT vendedor.nome FROM venda
 JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
 JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = "Gelinski" LIMIT 100;
/* 2025-02-28 16:12:16 [4 ms] */ 
SELECT produto.`codProduto`, `produtoLote`.`numeroLote` FROM produto
JOIN `produtoLote` ON produto.`codProduto` = `produtoLote`.`codProduto`
WHERE `dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-02-28 16:12:20 [5 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
INNER JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
INNER JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
/* 2025-02-28 16:12:35 [5 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
 JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
 JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
/* 2025-02-28 16:14:16 [6 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
 JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
 JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2026-06-30' LIMIT 100;
/* 2025-02-28 16:14:23 [5 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
 JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
 JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
/* 2025-02-28 16:15:16 [5 ms] */ 
SELECT cf.nome, cf.cpf, c.endereco 
FROM clienteFisico cf
JOIN cliente c ON c.codCliente = cf.codCliente
WHERE c.endereco LIKE '%Rua%' LIMIT 100;
/* 2025-02-28 16:15:21 [1 ms] */ 
SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua%' LIMIT 100;
/* 2025-03-01 18:25:23 [18 ms] */ 
SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
INNER JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE venda.status = 'Despachada' LIMIT 100;
/* 2025-03-01 18:26:24 [11 ms] */ 
SELECT vendedor.nome FROM venda
 JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
 JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = 'Gelinski' LIMIT 100;
/* 2025-03-01 18:26:27 [12 ms] */ 
SELECT produto.`codProduto`, `produtoLote`.`numeroLote` FROM produto
JOIN `produtoLote` ON produto.`codProduto` = `produtoLote`.`codProduto`
WHERE `produtoLote`.`dataValidade` < CURRENT_DATE LIMIT 100;
/* 2025-03-01 18:26:36 [11 ms] */ 
SELECT departamento.nome, vendedor.nome FROM departamento
INNER JOIN vendedor ON departamento.`codDepartamento` = vendedor.`codDepartamento` LIMIT 100;
/* 2025-03-01 18:26:39 [7 ms] */ 
SELECT vendedor.nome FROM venda
 JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
 JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = 'Gelinski' LIMIT 100;
/* 2025-03-01 18:26:46 [13 ms] */ 
SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
 JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
 JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' LIMIT 100;
