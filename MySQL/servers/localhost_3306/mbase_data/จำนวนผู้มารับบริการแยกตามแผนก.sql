SELECT cost_units.CU_NAME, COUNT(opd_visits.HN)AS 'จำนวน'
FROM population ,cid_hn , opd_visits
INNER JOIN cost_units ON cost_units.UNIT_ID = opd_visits.UNIT_ID
WHERE population.CID = cid_hn.CID
AND cid_hn.HN = opd_visits.HN
AND opd_visits.REG_DATETIME BETWEEN '20141001' AND '20141002'
AND opd_visits.IS_CANCEL = 0
GROUP BY cost_units.UNIT_ID ORDER BY COUNT(opd_visits.HN) DESC ;