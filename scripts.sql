-- somando total pedidos

select sum(valor_pedido) as total
from cap10.dsa_pedidos

-- soma (total) do valor de pedidos por cidade

select c.cidade_cliente, sum(p.valor_pedido)
from cap10.dsa_pedidos p
left join cap10.dsa_clientes c on p.id_cliente = c.id_cli
group by c.cidade_cliente
order by 2


-- soma (total) do valor dos pedidos por estado e cidade (com cláusula WHERE)

select c.cidade_cliente, c.estado_cliente, sum(p.valor_pedido) as total
from cap10.dsa_pedidos p, cap10.dsa_clientes c
where c.id_cli = p.id_cliente
group by c.cidade_cliente, c.estado_cliente
order by total desc

-- soma (total) do valor de pedidos por cidade (inner join)

select 
	c.cidade_cliente, c.estado_cliente, sum(p.valor_pedido) as total
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c 
	on p.id_cliente = c.id_cli
group by 
	c.cidade_cliente, c.estado_cliente
order by 
	total desc


-- Soma (total) do valor dos pedidos por estado e cidade. Retornar cidades sem pedidos

select c.cidade_cliente, c.estado_cliente, 
	case
		when floor(sum(p.valor_pedido)) is null then 0 
		else floor(sum(p.valor_pedido))
	end as total
from cap10.dsa_pedidos p
right join cap10.dsa_clientes c
on p.id_cliente = c.id_cli
group by c.cidade_cliente, c.estado_cliente
order by total desc


-- custo total dos pedidos por estado

select 
	c.estado_cliente, sum(pr.custo) as custo_total
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c on c.id_cli = p.id_cliente
inner join 
	cap10.dsa_produtos pr on p.id_produto = pr.id_prod
group by 
	c.estado_cliente
order by 
	custo_total desc
	
-- Você foi informado que a tabela de dados está desatualizada e os produtos vendidos para os clientes do estado de SP
-- tiveram aumento de custo de 10%.
-- Demonstre isso no relatório sem modificar os dados na tabela.


select 
	c.estado_cliente, 
	sum(
		case
			when c.estado_cliente = 'SP' then pr.custo * 1.10 
			else pr.custo
		end
	) as custo_total
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c on c.id_cli = p.id_cliente
inner join 
	cap10.dsa_produtos pr on p.id_produto = pr.id_prod
group by 
	c.estado_cliente
order by 
	custo_total desc
	
-- custo total dos pedidos por estado com produto cujo título tenha "análise" ou "Apache" no nome

select 
	c.estado_cliente,
	sum(pr.custo) as custo_total
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c on c.id_cli = p.id_cliente
inner join 
	cap10.dsa_produtos pr on p.id_produto = pr.id_prod
where 
	pr.nome_produto like '%Análise%' or pr.nome_produto like '%Apache%'
group by 
	c.estado_cliente
order by 
	custo_total desc
	
-- custo total dos pedidos por estado com produto cujo título tenha "análise" ou "Apache" no nome
-- somente se o custo total for menor que 120000
-- Demonstre no relatório, sem modificas od dados na tabela, o aumento de 10% para pedidos de clientes de sp


select 
	c.estado_cliente,
	sum(
		case
			when c.estado_cliente = 'SP' then pr.custo * 1.1 
			else pr.custo
		end
	) as custo_total
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c on c.id_cli = p.id_cliente
inner join 
	cap10.dsa_produtos pr on p.id_produto = pr.id_prod
where 
	pr.nome_produto like '%Análise%' or pr.nome_produto like '%Apache%'
group by 
	c.estado_cliente
having
	sum(pr.custo) < 120000
order by 
	custo_total desc
	
	
	
-- Custo total dos pedidos por estado com produto cujo título tenha 'Análise' ou 'Apache' no nome
-- Somente se o custo total estiver entre 150000 e 250000
-- Demonstre no relatório, sem modificar os dados na tabela, o aumento de 10% no custo para pedidos de clientes de SP

select 
	c.estado_cliente,
	sum(
		case
			when c.estado_cliente = 'SP' then pr.custo * 1.1 
			else pr.custo
		end
	) as custo_total
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c on c.id_cli = p.id_cliente
inner join 
	cap10.dsa_produtos pr on p.id_produto = pr.id_prod
where 
	pr.nome_produto like '%Análise%' or pr.nome_produto like '%Apache%'
group by 
	c.estado_cliente
having
	sum(pr.custo) between 150000 and 250000
order by 
	custo_total desc

-- Custo total dos pedidos por estado com produto cujo título tenha 'Análise' ou 'Apache' no nome
-- Somente se o custo total estiver entre 150000 e 250000
-- Demonstre no relatório, sem modificar os dados na tabela, o aumento de 10% no custo para pedidos de clientes de SP 
-- Inclua no relatório uma coluna chamada status_aumento com o texto 'Com Aumento de Custo' se o estado for SP e o texto
-- 'Sem Aumento de Custo' se for qualquer outro estado


select 
	c.estado_cliente,
	sum(
		case
			when c.estado_cliente = 'SP' then pr.custo * 1.1 
			else pr.custo
		end
	) as custo_total,
	case
		when c.estado_cliente = 'SP' then 'Com Aumento de Custo'
		else 'Sem Aumento de Custo'
	end as status_aumento
from 
	cap10.dsa_pedidos p
inner join 
	cap10.dsa_clientes c on c.id_cli = p.id_cliente
inner join 
	cap10.dsa_produtos pr on p.id_produto = pr.id_prod
where 
	pr.nome_produto like '%Análise%' or pr.nome_produto like '%Apache%'
group by 
	c.estado_cliente
having
	sum(pr.custo) between 150000 and 250000
order by 
	custo_total desc

