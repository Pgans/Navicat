SELECT  c.STAFF_ID,a.POS_NAME, e.FNAME,c.RATESHIFT, c.NSHIFT,c.NHOUR, c.NREFER,c.NNIGHT
FROM positions a, staff b, ot_details c, invoices d, population e
WHERE 
b.STAFF_ID = c.STAFF_ID
AND a.POS_ID = b.POS_ID
AND b.POS_ID = '002'
AND c.IVS_ID = d.IVS_ID
AND d.INS_DATE BETWEEN '20141001' AND '20150930'
AND d.IS_CANCEL = 0
AND b.CID = e.CID