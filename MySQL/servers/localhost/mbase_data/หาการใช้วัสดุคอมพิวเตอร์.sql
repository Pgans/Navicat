SELECT a.IREQ_ID, a.IREQ_DATE, a.REQ_STAFF, b.PRICE,IREQ_AMOUNT
FROM  ivt_requests a, ivt_req_details b
WHERE a.IREQ_DATE > '20170101'
AND a.IREQ_ID = b.IREQ_ID
AND a.IS_CANCEL = 0