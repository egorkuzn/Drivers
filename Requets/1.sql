SELECT DISTINCT C.id,
       C.surname,
       C.name,
       C.fathername
FROM     (SELECT "Rent".client_id,
    COUNT(DISTINCT "Rent".auto_id) as rentedCount
FROM "Rent"
GROUP BY "Rent".client_id) ClientToRentCount,
    "Clients" as C
WHERE C.id = ClientToRentCount.client_id AND ClientToRentCount.rentedCount > :X