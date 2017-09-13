SELECT count(VISIT_ID) AS 'จำนวนผู้ป่วยใน(ครั้ง)'
FROM ipd_reg
WHERE  ipd_reg.ADM_DT BETWEEN '20141001'  AND '20150930'
AND ipd_reg.IS_CANCEL = 0;