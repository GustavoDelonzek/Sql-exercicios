CREATE TABLE departamento(  
    codDepartamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);

CREATE TABLE estado(
    siglaEstado CHAR(2),
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE cidade(
    codCidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    siglaEstado CHAR(2) NOT NULL
);

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

CREATE TABLE cliente(
    codCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(60),
    codCidade INT NOT NULL,
    telefone VARCHAR(20),
    tipo CHAR(1) CHECK(tipo in ('F', 'J')),
    dataCadastro DATE DEFAULT(CURRENT_DATE),
    cep CHAR(8)
);

CREATE TABLE clienteFisico(
    codInteiro INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE,
    cpf VARCHAR(11) NOT NULL UNIQUE PRIMARY KEY,
    rg VARCHAR(8)
);

CREATE TABLE clienteJuridico(
    codCliente INT NOT NULL,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE PRIMARY KEY,
    razaoSocial VARCHAR(80),
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE classe(
    codClasse INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sigla VARCHAR(12),
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(80)
);

CREATE TABLE produto(
    codProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(40) NOT NULL,
    unidadeMedida CHAR(2),
    embalagem VARCHAR(15) DEFAULT 'Fardo',
    codClasse INT,
    precoVenda NUMERIC(14,2),
    estoqueMinimo NUMERIC(14,2)
);

CREATE TABLE produtoLote(
    codProduto INT NOT NULL,
    numeroLote INT NOT NULL PRIMARY KEY,
    quantidadeAdquirida NUMERIC(14,2),
    quantidadeVendida NUMERIC(14,2),
    precoCusto NUMERIC(14,2),
    dataValidade DATE
);


CREATE TABLE venda(
    codVenda INT NOT NULL PRIMARY KEY,
    codProduto INT NOT NULL,
    codVendedor INT NOT NULL,
    dataVenda DATE DEFAULT(CURRENT_DATE),
    enderecoEntrega VARCHAR(60),
    status VARCHAR(30)
);

CREATE TABLE itemVenda(
    codVenda INT NOT NULL,
    codProduto INT NOT NULL,
    numeroLote INT NOT NULL,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0)
);

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


CREATE TABLE pedido(
    codPedido SERIAL,
    dataRealizacao DATE DEFAULT(CURRENT_DATE),
    dataEntrega DATE,
    codFornecedor INT NOT NULL,
    valor NUMERIC(20, 2)
);

CREATE TABLE itemPedido(
    codPedido INT NOT NULL,
    codProduto INT NOT NULL,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0)
);