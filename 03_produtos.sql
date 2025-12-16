


-- =====================================================
-- ANÁLISE DE PRODUTOS
-- =====================================================

-- Pergunta:
-- Qual produto vendeu mais em quantidade?
SELECT
    prod.productName,
    SUM(ord.quantity) AS total_unidades
FROM northwind.orderdetail AS ord
JOIN northwind.product AS prod
    ON ord.productId = prod.productId
GROUP BY prod.productName
ORDER BY total_unidades DESC;

-- Insight:
-- O produto mais vendido foi "Product WHBYK" com 1577 unidades.

-- -----------------------------------------------------

-- Pergunta:
-- Qual produto apresentou baixa performance de vendas?
SELECT
    prod.productName,
    SUM(ord.quantity) AS total_unidades
FROM northwind.orderdetail AS ord
JOIN northwind.product AS prod
    ON ord.productId = prod.productId
GROUP BY prod.productName
ORDER BY total_unidades ASC;

-- Insight:
-- O produto com menor saída foi "Product AOZBW" com 95 unidades.