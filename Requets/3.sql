SELECT DISTINCT AutoToRentTimes.id as car_id,
       AutoToRentTimes.total as rent_times_count
FROM (
    SELECT min(AutoToRentTimes.total) as minimumRent
    FROM (
        SELECT A.id,
               CASE WHEN AutoToRentTimesWithNull.rent_times IS NULL THEN 0 ELSE AutoToRentTimesWithNull.rent_times END as total
        FROM (
            SELECT R.auto_id,
                   COUNT(*) rent_times
            FROM "Rent" as R
            GROUP BY R.auto_id
        ) as AutoToRentTimesWithNull RIGHT JOIN
            "Autos" as A on auto_id = id
        ORDER BY rent_times
    ) as AutoToRentTimes
) as TheLimit,
    (
        SELECT A.id,
               CASE WHEN AutoToRentTimesWithNull.rent_times IS NULL THEN 0 ELSE AutoToRentTimesWithNull.rent_times END as total
        FROM (
            SELECT R.auto_id,
                   COUNT(*) rent_times
            FROM "Rent" as R
            GROUP BY R.auto_id
        ) as AutoToRentTimesWithNull RIGHT JOIN
            "Autos" as A on auto_id = id
        ORDER BY rent_times
    ) as AutoToRentTimes
WHERE AutoToRentTimes.total = TheLimit.minimumRent;