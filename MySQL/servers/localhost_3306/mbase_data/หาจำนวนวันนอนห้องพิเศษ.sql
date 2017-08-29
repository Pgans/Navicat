

SELECT   'จำนวนวันนอน' AS 'กิจกรรม' , COUNT(MALE.HN) AS 'ผู้ป่วยในชาย',  COUNT(FMALE.HN) AS 'ผู้ป่วยในหญิง'
FROM (
(SELECT a.VISIT_ID ,b.HN, a.IN_DT, a.OUT_DT, DATEDIFF(a.OUT_DT,a.IN_DT) AS 'SLEEPDATE', c.WARD_NO
FROM vip_room a, opd_visits b , ipd_reg c
WHERE  a.IN_DT BETWEEN '20161001' AND '20170930'
AND a.VISIT_ID = b.VISIT_ID
AND a.VISIT_ID = c.VISIT_ID
AND c.WARD_NO = '38'
GROUP BY a.VISIT_ID) AS MALE ,

(SELECT a.VISIT_ID ,b.HN, a.IN_DT, a.OUT_DT, DATEDIFF(a.OUT_DT,a.IN_DT) AS 'SLEEPDATE', c.WARD_NO
FROM vip_room a, opd_visits b , ipd_reg c
WHERE  a.IN_DT BETWEEN '20161001' AND '20170930'
AND a.VISIT_ID = b.VISIT_ID
AND a.VISIT_ID = c.VISIT_ID
AND c.WARD_NO = '39'
GROUP BY a.VISIT_ID) AS FMALE );







