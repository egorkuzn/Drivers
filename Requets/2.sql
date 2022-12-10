SELECT id,
       surname,
       name,
       fathername,
       experience
FROM "Clients" as C
WHERE C.name = :X
  AND C.fathername = :Y