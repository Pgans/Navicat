
SELECT COUNT(VISIT_ID) AS 'จำนวน(ครั้ง)'
FROM opd_visits
WHERE opd_visits.REG_DATETIME BETWEEN '20141001' AND '20150930'
AND opd_visits.IS_CANCEL = 0

