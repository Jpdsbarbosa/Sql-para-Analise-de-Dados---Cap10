-- Criação da tabela Clientes
CREATE TABLE IF NOT EXISTS cap10.dsa_vendas (
    ano INT NULL,
    pais VARCHAR(50) NULL,
    produto VARCHAR(50) NULL,
    faturamento INT NULL
);


-- Insere registros
INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Brasil', 'Geladeira', 1130);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Brasil', 'TV', 980);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Argentina', 'Geladeira', 2180);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Argentina', 'TV', 2240);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Portugal', 'Smartphone', 2310);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Portugal', 'TV', 1900);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2021, 'Inglaterra', 'Notebook', 1800);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Brasil', 'Geladeira', 1400);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Brasil', 'TV', 1345);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Argentina', 'Geladeira', 2180);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Argentina', 'TV', 1390);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Portugal', 'Smartphone', 2480);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Portugal', 'TV', 1980);

INSERT INTO cap10.dsa_vendas (ano, pais, produto, faturamento)
VALUES (2024, 'Inglaterra', 'Notebook', 2300);