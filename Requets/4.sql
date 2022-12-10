SELECT A.model,
    SUM(AutoToRentCost.total)
FROM (
    SELECT AutoToRentCostWithNull.auto_id,
    CASE WHEN AutoToRentCostWithNull.totalCost IS NULL THEN 0 ELSE AutoToRentCostWithNull.totalCost END as total
    FROM (
        SELECT R.auto_id,
        SUM(R.price) totalCost
        FROM "Rent" as R
        GROUP BY R.auto_id
        ) as AutoToRentCostWithNull
    ORDER BY total
) as AutoToRentCost RIGHT JOIN "Autos" as A on A.id = AutoToRentCost.auto_id
WHERE AutoToRentCost.total != 0
GROUP BY A.model