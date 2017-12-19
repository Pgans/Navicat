SELECT a.IVS_ID
FROM invoices a, expense_categories b
WHERE a.IVS_DATE BETWEEN '2016.10.01' AND '2017.09.30'
AND a.IS_CANCEL = 0
AND a.EXP_ID = b.EXP_ID
AND left(b.EXP_NAME, 5) = 'วัสดุ'
AND a.EXP_ID NOT IN ('045','023', '129')
AND a.IVS_ID IN (SELECT IVS_ID  FROM order_details)