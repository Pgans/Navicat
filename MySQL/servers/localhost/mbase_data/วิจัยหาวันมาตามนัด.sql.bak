SELECT  'รพ.ม่วงสามสิบ' AS '10953',ap.HN, o.VISIT_ID , ap.AP_MEMO, ap.AP_DATE AS วันนัด,o.REG_DATETIME AS วันมารับบริการ, CONCAT(trim(p.FNAME),'  ',p.LNAME) as ชื่อสกุล
,TIMESTAMPDIFF(year,p.BIRTHDATE,o.REG_DATETIME) AS อายุ
FROM appoints ap
LEFT  JOIN opd_visits o ON date(o.reg_datetime )= ap.AP_DATE AND ap.HN = o.HN AND o.IS_CANCEL = 0
LEFT JOIN cid_hn c ON  c.hn = ap.hn
LEFT JOIN f32 f ON c.cid = f.cid 
LEFT JOIN population p ON p.CID = f.cid

WHERE ap.AP_DATE BETWEEN '2018.11.01' AND '2019.12.31'
#AND ap.HN  N IN (SELECT hn FROM opd_visits WHERE REG_DATETIME BETWEEN '2018.11.01 00:01' AND '2019.12.31 23:59')
AND c.cid in (SELECT cid from f32)
GROUP BY o.VISIT_ID ORDER BY o.HN
