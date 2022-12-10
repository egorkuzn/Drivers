SELECT A.id,
       AutoToRentCost.avg_price
FROM (
    SELECT AutoToRentCostWithNull.auto_id,
    CASE WHEN AutoToRentCostWithNull.totalCost IS NULL THEN 0 ELSE AutoToRentCostWithNull.totalCost END as avg_price
    FROM (
        SELECT R.auto_id,
        AVG(R.price) as totalCost
        FROM "Rent" as R
        GROUP BY R.auto_id
        ) as AutoToRentCostWithNull
    ORDER BY avg_price
) as AutoToRentCost RIGHT JOIN "Autos" as A on A.id = AutoToRentCost.auto_id
ORDER BY AutoToRentCost.avg_price DESC
