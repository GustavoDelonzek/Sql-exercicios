SELECT codPedido, dataRealizacao, dataEntrega, nomeFantasia
FROM pedido
NATURAL JOIN fornecedor
WHERE EXTRACT(YEAR FROM dataRealizacao) = 2014;

SELECT v.nome, v.`dataNascimento`, c.nome 
FROM vendedor v 
JOIN cidade c ON c.`codCidade` = v.`codCidade`
WHERE c.nome = 'Apucarana';

SELECT venda.codVenda, venda.dataVenda, vendedor.nome, `produtoLote`.`numeroLote`, produto.descricao
FROM venda
NATURAL JOIN vendedor
NATURAL JOIN `itemVenda`
NATURAL JOIN produto
NATURAL JOIN `produtoLote`
WHERE produto.descricao = 'Smartphone';

SELECT classe.sigla, classe.nome, produto.`codProduto`, produto.descricao, produto.`estoqueMinimo`
FROM produto
INNER JOIN classe ON produto.`codClasse` = classe.`codClasse`
WHERE classe.nome = 'Eletrônicos';

SELECT fornecedor.`nomeFantasia`, pedido.`codPedido`, pedido.`dataRealizacao`, pedido.`dataEntrega`
FROM pedido
INNER JOIN fornecedor ON fornecedor.`codFornecedor` = pedido.`codFornecedor`
WHERE fornecedor.`nomeFantasia` = 'EletroTec';

SELECT produto.descricao, produto.`codProduto`, venda.`codVenda`
FROM produto
LEFT JOIN `itemVenda` ON produto.`codProduto` = `itemVenda`.`codProduto`
LEFT JOIN venda ON `itemVenda`.`codVenda` = venda.`codVenda`;

SELECT fornecedor.`nomeFantasia`, pedido.`codPedido`, pedido.`dataEntrega`
FROM fornecedor
LEFT JOIN pedido ON pedido.`codFornecedor` = fornecedor.`codFornecedor`;

SELECT departamento.nome, departamento.localizacao, vendedor.nome, vendedor.`dataNascimento`
FROM vendedor
RIGHT JOIN departamento ON vendedor.`codDepartamento` = departamento.`codDepartamento`
