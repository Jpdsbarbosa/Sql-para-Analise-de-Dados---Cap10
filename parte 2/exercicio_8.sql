-- SQL Para Análise de Dados e Data Science - Capítulo 10


-- Criação da tabela 
CREATE TABLE cap10.vendas (
    ID INT PRIMARY KEY,
    DataVenda DATE,
    Produto VARCHAR(50),
    Quantidade INT,
    ValorUnitario DECIMAL(10, 2),
    Vendedor VARCHAR(50)
);


-- Insert
INSERT INTO cap10.vendas (ID, DataVenda, Produto, Quantidade, ValorUnitario, Vendedor) VALUES
(1, '2023-11-01', 'Produto A', 10, 100.00, 'Zico'),
(2, '2023-11-01', 'Produto B', 5, 200.00, 'Romário'),
(3, '2023-11-02', 'Produto A', 7, 100.00, 'Ronaldo'),
(4, '2023-11-02', 'Produto C', 3, 150.00, 'Bebeto'),
(5, '2023-11-03', 'Produto B', 8, 200.00, 'Romário'),
(6, '2023-11-03', 'Produto A', 5, 100.00, 'Zico'),
(7, '2023-11-04', 'Produto C', 10, 150.00, 'Bebeto'),
(8, '2023-11-04', 'Produto A', 2, 100.00, 'Ronaldo'),
(9, '2023-11-05', 'Produto B', 6, 200.00, 'Romário'),
(10, '2023-11-05', 'Produto C', 4, 150.00, 'Bebeto');


-- Pergunta 1: Qual o total de vendas por produto?
select
	produto,
	sum(quantidade * valorunitario) as total
from 
	cap10.vendas
group by
	produto

-- Pergunta 2: Qual o total de vendas por vendedor?
select
	vendedor,
	sum(quantidade * valorunitario) as total
from 
	cap10.vendas
group by
	vendedor

-- Pergunta 3: Qual o total de vendas por dia?
select
	datavenda,
	sum(quantidade * valorunitario) as total
from 
	cap10.vendas
group by
	datavenda

-- Pergunta 4: Como as vendas se acumulam por dia e por produto (incluindo subtotais diários)?

select
	case
		when grouping(datavenda) = 1 then 'Total de Vendas'
		else cast(datavenda as varchar)
	end as datavenda,
	case
		when grouping(produto) = 1 then 'Todos os Produtos'
		else produto
	end as Produto,
	sum(valorunitario * quantidade) as Valor_Venda
from
	cap10.vendas
group by
	rollup(datavenda, Produto)
order by
	grouping(datavenda, Produto)
	


-- Pergunta 5: Qual a combinação de vendedor e produto gerou mais vendas (incluindo todos os subtotais possíveis)?

select
	case
		when grouping(produto) = 1 then 'Todos os Produtos'
		else produto
	end as produto,
	case
		when grouping(vendedor) = 1 then 'Total Vendido'
		else vendedor
	end as vendedor,
	sum(valorunitario * quantidade) as valor_venda
from
	cap10.vendas
group by
	cube(produto, vendedor)
order by
	valor_venda desc



-- Imagine que você queira analisar as vendas totais por Produto, por Vendedor e também o total geral de todas as vendas. 
-- Como seria a Query SQL?

select
	coalesce(Produto, 'Todos') as Produto,
	coalesce(Vendedor, 'Todos') as Vendedor,
	sum(quantidade * valorunitario) as TotalVendas
from
	cap10.vendas
group by
	grouping sets (
	(produto),
	(vendedor),
	()
)





