CREATE TABLE departamento(  
    codDepartamento SERIAL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricaoFuncional VARCHAR(80),
    localizacao TEXT
);

CREATE TABLE estado(
    siglaEstado CHAR(2) PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE cidade(
    codCidade SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    siglaEstado CHAR(2) NOT NULL,
    CONSTRAINT FK_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES estado(siglaEstado) 
    ON DELETE no action 
    ON UPDATE CASCADE
);

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

CREATE TABLE clienteFisico(
    codCliente BIGINT UNSIGNED PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(8),
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE clienteJuridico(
    codCliente BIGINT UNSIGNED PRIMARY KEY,
    nomeFantasia VARCHAR(80) NOT NULL UNIQUE,
    razaoSocial VARCHAR(80),
    ie VARCHAR(20) NOT NULL UNIQUE,
    cgc VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE classe(
    codClasse SERIAL PRIMARY KEY,
    sigla VARCHAR(12),
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(80)
);

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

--Certo até aqui
CREATE TABLE produtoLote(
    codProduto BIGINT UNSIGNED,
    numeroLote SERIAL PRIMARY KEY,
    quantidadeAdquirida NUMERIC(14,2),
    quantidadeVendida NUMERIC(14,2),
    precoCusto NUMERIC(14,2),
    dataValidade DATE,
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto) ON DELETE CASCADE ON UPDATE CASCADE
);


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

CREATE TABLE itemVenda(
    codVenda BIGINT UNSIGNED,
    codProduto BIGINT UNSIGNED,
    numeroLote BIGINT UNSIGNED,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0),
    FOREIGN KEY (codVenda) REFERENCES venda(codVenda) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codProduto, numeroLote) REFERENCES produtoLote(codProduto, numeroLote) ON DELETE NO ACTION ON UPDATE CASCADE
);

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


CREATE TABLE pedido(
    codPedido SERIAL PRIMARY KEY,
    dataRealizacao DATE DEFAULT(CURRENT_DATE),
    dataEntrega DATE,
    codFornecedor BIGINT UNSIGNED,
    valor NUMERIC(20, 2),
    FOREIGN KEY (codFornecedor) REFERENCES fornecedor(codFornecedor) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE itemPedido(
    codPedido BIGINT UNSIGNED,
    codProduto BIGINT UNSIGNED,
    quantidade NUMERIC(14,2) NOT NULL CHECK(quantidade > 0),
    FOREIGN KEY (codPedido) REFERENCES pedido(codPedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codProduto) REFERENCES produto(codProduto)
);

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