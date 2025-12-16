

-- =====================================================
-- ANÁLISE DE REGIÕES
-- =====================================================

-- Pergunta:
-- Qual região gerou maior faturamento?

WITH territorio_unico AS (
    SELECT
        empT.employeeId,
        MIN(t.regionId) AS regionId
    FROM northwind.employeeterritory empT
    JOIN northwind.territory t
        ON empT.territoryId = t.territoryId
    GROUP BY empT.employeeId
), faturamento_pedido AS (
    SELECT
        ord.orderId,
        SUM((ord.unitPrice * ord.quantity) * (1 - ord.discount)) AS faturamento,
        tu.regionId
    FROM northwind.orderdetail ord
    JOIN northwind.salesorder sales
        ON ord.orderId = sales.orderId
    JOIN territorio_unico tu
        ON sales.employeeId = tu.employeeId
    GROUP BY ord.orderId, tu.regionId
)
SELECT
    r.regiondescription,
    ROUND(SUM(faturamento), 2) AS faturamento_total
FROM faturamento_pedido fp
JOIN northwind.region r
    ON fp.regionId = r.regionId
GROUP BY r.regiondescription
ORDER BY faturamento_total DESC;

-- Insight:
-- A região mais lucrativa foi Eastern (≈ 660.328,49).