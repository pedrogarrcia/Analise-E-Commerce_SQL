


-- =====================================================
-- ANÁLISE DE TICKET MÉDIO
-- =====================================================

-- Pergunta:
-- Qual é o ticket médio por pedido?
SELECT
    orderId,
    ROUND(SUM((unitPrice * quantity) * (1 - discount)), 2) AS ticket_medio
FROM northwind.orderdetail
GROUP BY orderId;

-- -----------------------------------------------------

-- Pergunta:
-- Qual é o ticket médio por cliente?
SELECT
    cus.custId,
    cus.companyName,
    ROUND(
        SUM(ord.unitPrice * ord.quantity * (1 - ord.discount))
        / COUNT(DISTINCT ord.orderId), 2
    ) AS ticket_medio
FROM northwind.orderdetail AS ord
JOIN northwind.salesorder AS sales
    ON ord.orderId = sales.orderId
JOIN northwind.customer AS cus
    ON sales.custId = cus.custId
GROUP BY cus.custId, cus.companyName
ORDER BY ticket_medio DESC;