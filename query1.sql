SELECT * FROM produto;

SELECT fornecedor.`codFornecedor`, fornecedor.`nomeFantasia`, fornecedor.endereco, fornecedor.telefone, fornecedor.`codCidade` FROM fornecedor;

SELECT venda.`codVenda`, venda.`dataVenda` FROM venda WHERE venda.status = 'Despachada';

SELECT * FROM `clienteJuridico`;

SELECT produtoLote.`numeroLote` FROM `produtoLote` WHERE `dataValidade` < CURRENT_DATE;

SELECT departamento.nome FROM departamento;