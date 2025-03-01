SELECT  vendedor.codVendedor, vendedor.nome, cidade.nome, estado.nome from vendedor 
INNER JOIN cidade 
on cidade.`codCidade` = vendedor.`codCidade`
INNER JOIN estado
on estado.`siglaEstado` = cidade.`siglaEstado`;


SELECT venda.`codVenda`, venda.`dataVenda`, vendedor.nome FROM venda 
INNER JOIN vendedor
ON venda.`codVendedor` = vendedor.`codVendedor`
WHERE venda.status = 'Despachada';

SELECT `clienteFisico`.nome, `clienteFisico`.cpf, cliente.endereco FROM `clienteFisico`
JOIN cliente ON cliente.`codCliente` = `clienteFisico`.`codCliente`
WHERE cliente.endereco LIKE '%Rua%';

SELECT `clienteJuridico`.`nomeFantasia`, `clienteJuridico`.`razaoSocial`, `clienteJuridico`.cgc, `clienteJuridico`.ie FROM `clienteJuridico`;

SELECT `clienteJuridico`.`nomeFantasia`, cliente.endereco, cliente.telefone, cidade.nome, cidade.`siglaEstado` FROM `clienteJuridico`
 JOIN cliente ON `clienteJuridico`.`codCliente` = cliente.`codCliente`
 JOIN cidade ON cliente.`codCidade` = cidade.`codCidade`
WHERE cliente.`dataCadastro` BETWEEN '1999-01-01' AND '2003-06-30' ;

SELECT vendedor.nome FROM venda
 JOIN vendedor ON venda.`codVendedor` = vendedor.`codVendedor`
 JOIN `clienteJuridico` ON venda.`codCliente` = `clienteJuridico`.`codCliente`
WHERE `clienteJuridico`.`nomeFantasia` = 'Gelinski';

SELECT produto.`codProduto`, `produtoLote`.`numeroLote` FROM produto
JOIN `produtoLote` ON produto.`codProduto` = `produtoLote`.`codProduto`
WHERE `produtoLote`.`dataValidade` < CURRENT_DATE;

SELECT departamento.nome, vendedor.nome FROM departamento
INNER JOIN vendedor ON departamento.`codDepartamento` = vendedor.`codDepartamento`;