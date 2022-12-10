SELECT "Rent".client_id,
    COUNT(*)
FROM "Rent"
GROUP BY "Rent".client_id