SELECT p2.name AS person1,p1.name AS person2, p1.address AS common_address
FROM person p1 JOIN person p2
ON p1.address = p2.address AND p1.id < p2.id
ORDER BY person1, person2,common_address;