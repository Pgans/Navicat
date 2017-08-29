SELECT opd_operations.VISIT_ID,opd_visits.HN, opd_operations.OP_DT, population.FNAME, population.LNAME , opd_operations.ICD9_ID

FROM population, cid_hn, opd_visits

INNER JOIN opd_operations ON opd_visits.VISIT_ID = opd_operations.VISIT_ID

AND opd_operations.OP_DT BETWEEN "2014.10.01" AND "2014.12.31"

AND opd_operations.ICD9_ID = "58001"

AND opd_visits.VISIT_ID = opd_operations.VISIT_ID

WHERE population.cid = cid_hn.CID

AND opd_visits.HN= cid_hn.HN

GROUP BY opd_visits.VISIT_ID ORDER BY opd_operations.OP_DT

