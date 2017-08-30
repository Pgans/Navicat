SELECT  a.device_serial , device_name,b.category_id ,b.category_name, c.dep_id, c.dep_name, a.purchase_date,
a.due_date, a.price, a.sale_date
FROM devices a, categories b , departments c
WHERE a.category_id = b.category_id
AND a.dep_id = c.dep_id
AND a.sale_date = '0000-00-00'