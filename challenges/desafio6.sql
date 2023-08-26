SELECT
    ROUND(MIN(plans.plan_price), 2) AS faturamento_minimo,
    ROUND(MAX(plans.plan_price), 2) AS faturamento_maximo,
    ROUND(AVG(plans.plan_price), 2) AS faturamento_medio,
    ROUND(SUM(plans.plan_price), 2) AS faturamento_total
FROM
    users
JOIN
    plans ON users.plan_id = plans.plan_id;
