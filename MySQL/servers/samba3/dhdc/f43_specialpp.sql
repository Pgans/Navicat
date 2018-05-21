SELECT DISTINCT gcoffice.offid, 
c.HN AS PID,  a.visit_id AS SEQ,   DATE_FORMAT(b.REG_DATETIME,'%Y-%m-%d') AS DATE_SERV,
CASE 
WHEN a.visit_id NOT IN (SELECT VISIT_ID FROM mbase_data.mobile_visits) THEN '1'
WHEN a.visit_id  IN (SELECT VISIT_ID FROM mbase_data.mobile_visits) THEN '2'
END AS SERVPLACE,
ppspecial AS PPSPECIAL,
CASE 
WHEN a.visit_id NOT IN (SELECT VISIT_ID FROM mbase_data.mobile_visits) THEN '10953'
WHEN a.visit_id  IN (SELECT VISIT_ID FROM mbase_data.mobile_visits) THEN '  '
END  AS PPSPLACE,
a.staff_id AS PROVIDER,
DATE_FORMAT(NOW(),'%Y%m%d%H%i%s') AS D_UPDATE, c.CID 
FROM mbase_data.gcoffice, mbase_data.specialpp a
LEFT JOIN mbase_data.opd_visits b  ON a.visit_id = b.VISIT_ID AND b.IS_CANCEL = 0
LEFT JOIN mbase_data.cid_hn c ON b.HN = c.HN
WHERE  a.is_cancel = 0
AND  b.REG_DATETIME >'2017.10.01 00:01'

