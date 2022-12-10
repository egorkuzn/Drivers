SELECT A.model,
    COUNT(DISTINCT AutoToRentTimes.total)
FROM (
    SELECT A0.id,
    CASE WHEN AutoToRentTimesWithNull.rent_times IS NULL THEN 0 ELSE AutoToRentTimesWithNull.rent_times END as total
    FROM (
        SELECT R.auto_id,
        COUNT(*) rent_times
        FROM "Rent" as R
        GROUP BY R.auto_id
        ) as AutoToRentTimesWithNull RIGHT JOIN "Autos" as A0 on auto_id = id
    ORDER BY total
) as AutoToRentTimes RIGHT JOIN "Autos" as A on A.id = AutoToRentTimes.id
WHERE AutoToRentTimes.total != 0
GROUP BY A.model