SELECT DISTINCT  b.IREQ_ID , a.IREQ_DATE,a.OUT_DATE,c.IVT_ID,c.IVT_NAME ,e.UUNIT_NAME, b.IREQ_AMOUNT, b.PRICE, b.PU_ID
FROM ivt_requests a, ivt_req_details b, inventory c, ivt_categories d, ivt_units e
WHERE a.IREQ_DATE > '20161001'
AND a.IREQ_ID = b.IREQ_ID
AND a.IS_CANCEL = 0
AND b.IVT_ID = c.IVT_ID
AND b.IS_CANCEL = 0
AND c.IVC_ID = d.IVC_ID
AND d.IVC_ID = 04
AND c.UUNIT_ID = e.UUNIT_ID


