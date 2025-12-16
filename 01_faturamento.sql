


-- =====================================================
-- ANÁLISE DE FATURAMENTO
-- Base: Northwind
-- =====================================================

-- Pergunta:
-- Qual foi o faturamento total da empresa?
SELECT
    ROUND(SUM((unitPrice * quantity) * (1 - discount)), 2) AS faturamento_total
FROM northwind.orderdetail;

-- Insight:
-- A empresa faturou aproximadamente 1.265.793,04 no período analisado.

-- -----------------------------------------------------

-- Pergunta:
-- Qual pedido gerou o maior faturamento?
SELECT
    orderId,
    ROUND(SUM((unitPrice * quantity) * (1 - discount)), 2) AS faturamento_pedido
FROM northwind.orderdetail
GROUP BY orderId
ORDER BY faturamento_pedido DESC;

-- Insight:
-- O pedido 10865 foi o que gerou maior faturamento (≈ 16.387,50).

-- -----------------------------------------------------

-- Pergunta:
-- Qual categoria foi mais lucrativa?
SELECT
    cat.categoryName,
    ROUND(SUM(ord.unitPrice * ord.quantity * (1 - ord.discount)), 2) AS faturamento_categoria
FROM northwind.orderdetail AS ord
JOIN northwind.product AS prod
    ON prod.productId = ord.productId
JOIN northwind.category AS cat
    ON cat.categoryId = prod.categoryId
GROUP BY cat.categoryName
ORDER BY faturamento_categoria DESC;

-- Insight:
-- A categoria mais lucrativa foi Beverages (≈ 267.868,18).