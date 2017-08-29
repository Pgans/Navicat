SELECT a.device_name, a.category_id, IF(MONTH(a.purchase_date)>9,YEAR(a.purchase_date)+544,YEAR(a.purchase_date)+543) AS fiscal
FROM devices a
WHERE a.sale_date = 0