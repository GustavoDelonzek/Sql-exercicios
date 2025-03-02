INSERT INTO departamento (nome, descricaoFuncional, localizacao) 
VALUES 
('Suporte', 'Responsável pelo suporte dos produtos', 'Avenida Calig, 3000');

INSERT INTO estado (siglaEstado, nome) 
VALUES 
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Minas Gerais');

INSERT INTO cidade (nome, siglaEstado) 
VALUES 
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG');

INSERT INTO vendedor (nome, dataNascimento, endereco, cep, telefone, codCidade, dataContratacao, codDepartamento) 
VALUES 
('ALemid', '1985-07-23', 'Rua da Esperança, 150', '12345678', '11 98765-4321', 1, '2022-05-10', 1);

INSERT INTO cliente (endereco, codCidade, telefone, tipo, dataCadastro, cep) 
VALUES 
('Rua Marechal Floriano, 56', 1, '11 93456-7890', 'F', '2024-02-28', '12345678'),
('Rua Marechal Floriano, 56', 2, '11 93456-7890', 'F', '2024-02-28', '12345678'),

('Avenida Rio Branco, 500', 2, '21 91234-5678', 'J', '2024-02-25', '23456789');

INSERT INTO clienteFisico (codCliente, nome, dataNascimento, cpf, rg) 
VALUES 
(3, 'Bernabeu', '1995-08-20', '32143242', '1234567'),
(4, 'Maria Oliveira', '1988-12-10', '124213432', '9876543');

INSERT INTO clienteJuridico (codCliente, nomeFantasia, razaoSocial, ie, cgc) 
VALUES 
(3, 'TechSolutions', 'Tech Solutions Ltda', '1234567890', '12345678000199'),
(4, 'FastFoods', 'Fast Foods S.A.', '9876543210', '98765432000188');

INSERT INTO classe (sigla, nome, descricao) 
VALUES 
('ELE', 'Eletrônicos', 'Produtos eletrônicos em geral'),
('MOD', 'Moda', 'Roupas e acessórios');

INSERT INTO produto (descricao, unidadeMedida, embalagem, codClasse, precoVenda, estoqueMinimo) 
VALUES 
('CArro', 'UN', 'a', 1, 155500.00, 10);

INSERT INTO produtoLote (codProduto, quantidadeAdquirida, quantidadeVendida, precoCusto, dataValidade) 
VALUES 
(1, 100, 30, 1200.00, '2025-12-31'),
(2, 200, 100, 80.00, '2026-06-30');

INSERT INTO venda (codCliente, codVendedor, dataVenda, enderecoEntrega, status) 
VALUES 
(1, 1, '2024-02-28', 'Rua Marechal Floriano, 56', 'Despachada'),
(3, 2, '2024-02-25', 'Avenida Rio Branco, 500', 'Em Processamento');

INSERT INTO itemVenda (codVenda, codProduto, numeroLote, quantidade) 
VALUES 
(1, 1, 1, 1),
(1, 2, 2, 3);

INSERT INTO fornecedor (nomeFantasia, razaoSocial, ie, cgc, endereco, telefone, codCidade) 
VALUES 
('CAroline Chapinhas', 'Chapinha Caroline S.A.', '234253', '2423423421', 'Rua das Flores, 100', '11 32123-4321', 1);

INSERT INTO pedido (dataRealizacao, dataEntrega, codFornecedor, valor) 
VALUES 
('2024-02-20', '2024-02-25', 1, 15000.00),
('2024-02-18', '2024-02-22', 2, 5000.00);

INSERT INTO itemPedido (codPedido, codProduto, quantidade) 
VALUES 
(1, 1, 10),
(2, 2, 50);

INSERT INTO contasPagar (dataVencimento, parcela, codPedido, valor, dataPagamento, localPagamento, juros, correcaoMonetaria) 
VALUES 
('2024-03-01', 1, 1, 15000.00, '2024-03-01', 'Banco do Brasil', 0.00, 0.00),
('2024-03-05', 2, 2, 5000.00, '2024-03-05', 'Caixa Econômica', 0.00, 0.00);

INSERT INTO contasReceber (dataVencimento, codVenda, parcela, valor, dataPagamento, localPagamento, juros, correcaoMonetaria) 
VALUES 
('2024-03-01', 1, 1, 2000.00, '2024-03-01', 'Banco do Brasil', 0.00, 0.00),
('2024-03-05', 2, 2, 3000.00, '2024-03-05', 'Caixa Econômica', 0.00, 0.00);
