-- Faturamento total por ano

select ano, sum(faturamento) as faturamento_anual
from cap10.dsa_vendas
group by ano

-- Faturamento Total e o total geral (usando rollup) - com null

select
	ano,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano)
	
	

-- Faturamento Total e o total geral (usando rollup) - corrigindo o null

select
	-- converto o ano para char no formato '9999' (que significa que eu quero 4 caracteres) e se for nulo chamarei de Total
	coalesce(to_char(ano, '9999'), 'Total') as Ano,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano)
order by
	ano
	
	
-- Faturamento Total e o total geral por ano e pais

select
	-- converto o ano para char no formato '9999' (que significa que eu quero 4 caracteres) e se for nulo chamarei de Total
	coalesce(to_char(ano, '9999'), 'Total') as Ano,
	coalesce(pais, 'Total') as pais,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano, pais)
order by
	ano, pais
	
	
	
-- Faturamento total por ano

select ano, sum(faturamento) as faturamento_anual
from cap10.dsa_vendas
group by ano

-- Faturamento Total e o total geral (usando rollup) - com null

select
	ano,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano)
	
	

-- Faturamento Total e o total geral (usando rollup) - corrigindo o null

select
	-- converto o ano para char no formato '9999' (que significa que eu quero 4 caracteres) e se for nulo chamarei de Total
	coalesce(to_char(ano, '9999'), 'Total') as Ano,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano)
order by
	ano
	
	
-- Faturamento Total e o total geral por ano e pais

select
	-- converto o ano para char no formato '9999' (que significa que eu quero 4 caracteres) e se for nulo chamarei de Total
	coalesce(to_char(ano, '9999'), 'Total') as Ano,
	coalesce(pais, 'Total') as pais,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano, pais)
order by
	ano, pais
	
	
-- Cube	
	
-- Faturamento Total e o total geral por ano e pais e
-- total geral do ano e do pais (CUBE)
-- cube busca todas as combinações validas para ano e para pais

select
	-- converto o ano para char no formato '9999' (que significa que eu quero 4 caracteres) e se for nulo chamarei de Total
	coalesce(to_char(ano, '9999'), 'Total') as Ano,
	coalesce(pais, 'Total') as pais,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	cube(ano, pais)
order by
	ano, pais
	
	
	
-- Grouping Sets

-- Faturamento total por ano e produto e total geral
-- ordenando pelo agrupamento de produto
-- a função grouping em SQL é usada para determinar se uma coluna ou expressão em uma consulta
-- esta sendo agrupada ou se está em uma linha de subtotal ou total
-- podemos usar a função grouping para fazer a ordenação do resultado

select
	case
		when ano is null then 'Total Geral'
		else cast(ano as varchar)
	end as ano,
	case
		when produto is null then 'Todos os Produtos'
		else produto
	end as produto,
	sum(faturamento) as faturamento_total
from
	cap10.dsa_vendas
group by
	rollup(ano, produto)
order by
	grouping(produto), ano, faturamento_total


-- A função GROUPING em SQL é usada para determinar se uma coluna ou expressão em uma consulta
-- esta sendo agrupada ou se esta em uma linha de subtotal ou total (se esta sendo agrupado retorna 1, ao contrário 0)
-- faturamento total por ano e país e total geral com agrupamento do resultado

SELECT
    CASE 
        WHEN GROUPING(ano) = 1 THEN 'Total de Todos os Anos'
        ELSE CAST(ano AS VARCHAR)
    END AS ano,
    CASE 
        WHEN GROUPING(pais) = 1 THEN 'Total de Todos os Países'
        ELSE pais
    END AS pais,
    CASE 
        WHEN GROUPING(produto) = 1 THEN 'Total de Todos os Produtos'
        ELSE produto
    END AS produto,
    SUM(faturamento) AS faturamento_total 
FROM 
    cap10.dsa_vendas
GROUP BY 
    ROLLUP(ano, pais, produto)
ORDER BY 
    GROUPING(produto, ano, pais), faturamento_total;


-- STRING_AGG
-- Faturamento total por país em 2024 mostrando todos os produtos vendidos como uma lista
SELECT 
    pais,
    STRING_AGG(produto, ', ') AS produtos_vendidos,
    SUM(faturamento) AS faturamento_total 
FROM 
    cap10.dsa_vendas
WHERE ano = 2024
GROUP BY 
    pais;


