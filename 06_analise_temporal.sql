


-- =====================================================
-- ANÁLISE TEMPORAL
-- =====================================================

-- Pergunta:
-- Qual foi o faturamento por mês?
SELECT
    DATE_FORMAT(sales.orderDate, '%Y-%m') AS mes,
    ROUND(SUM((ord.unitPrice * ord.quantity) * (1 - ord.discount)), 2) AS faturamento_mensal
FROM northwind.orderdetail ord
JOIN northwind.salesorder sales
    ON ord.orderId = sales.orderId
GROUP BY mes
ORDER BY mes;

-- -----------------------------------------------------

-- Pergunta:
-- Quantidade de pedidos por mês?
SELECT
    DATE_FORMAT(orderDate, '%Y-%m') AS mes,
    COUNT(*) AS total_pedidos
FROM northwind.salesorder
GROUP BY mes;

-- -----------------------------------------------------

-- Pergunta:
-- Qual foi o mês mais forte e o mais fraco?
SELECT
    DATE_FORMAT(orderDate, '%Y-%m') AS mes,
    COUNT(*) AS total_pedidos
FROM northwind.salesorder
GROUP BY mes
ORDER BY total_pedidos DESC;

-- Insight:
-- Mês mais forte: Abril de 2008
-- Mês mais fraco: Maio de 2008

-- -----------------------------------------------------

-- Pergunta:
-- Como foi o crescimento ao longo do tempo?
WITH faturamento_mes AS (
    SELECT
        DATE_FORMAT(sales.orderDate, '%Y-%m') AS mes,
        ROUND(SUM((ord.unitPrice * ord.quantity) * (1 - ord.discount)), 2) AS faturamento
    FROM northwind.orderdetail ord
    JOIN northwind.salesorder sales
        ON ord.orderId = sales.orderId
    GROUP BY mes
)
SELECT
    mes,
    faturamento,
    faturamento - LAG(faturamento) OVER (ORDER BY mes) AS crescimento_absoluto,
    ROUND(
        (faturamento - LAG(faturamento) OVER (ORDER BY mes))
        / LAG(faturamento) OVER (ORDER BY mes) * 100, 2
    ) AS crescimento_percentual
FROM faturamento_mes
ORDER BY mes;