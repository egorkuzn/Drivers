SELECT C.id,
       C.surname,
       C.name,
       C.fathername
FROM     (SELECT "Rent".client_id,
    COUNT(*) as rentedCount
FROM "Rent"
GROUP BY "Rent".client_id) ClientToRentCount,
    "Clients" as C
WHERE C.id = ClientToRentCount.client_id AND ClientToRentCount.rentedCount > :X