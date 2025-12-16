


-- =====================================================
-- ANÁLISE DE CLIENTES
-- =====================================================

-- Pergunta:
-- Qual é o número total de pedidos?
SELECT COUNT(*) AS total_pedidos
FROM northwind.salesorder;

-- Insight:
-- A empresa realizou um total de 830 pedidos.

-- -----------------------------------------------------

-- Pergunta:
-- Quais são os clientes que mais compram?
SELECT
    cus.custId,
    cus.companyName,
    COUNT(sales.orderId) AS total_pedidos
FROM northwind.salesorder AS sales
JOIN northwind.customer AS cus
    ON sales.custId = cus.custId
GROUP BY cus.custId, cus.companyName
ORDER BY total_pedidos DESC
LIMIT 5;

-- Insight:
-- Top 5 clientes com maior volume de pedidos identificados.