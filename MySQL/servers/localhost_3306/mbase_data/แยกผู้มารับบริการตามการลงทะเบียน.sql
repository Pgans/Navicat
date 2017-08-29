SELECT DISTINCT cost_units.UNIT_ID, cost_units.CU_NAME, COUNT(CU_NAME)
FROM population, cid_hn,opd_visits
INNER JOIN cost_units ON opd_visits.UNIT_ID = cost_units.UNIT_ID
WHERE population.CID = cid_hn.CID
AND cid_hn.HN = opd_visits.HN
AND opd_visits.REG_DATETIME BETWEEN '20141001' AND '20150930'
AND opd_visits.IS_CANCEL = 0
LIMIT 100;