--- referee_id = NULL and referee_id IS NULL are not the same

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;