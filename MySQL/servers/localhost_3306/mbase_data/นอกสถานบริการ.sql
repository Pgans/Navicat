SELECT a.VISIT_ID,f.HN,c.MU_DATE,b.UNIT_ID,b.UNIT_NAME,e.MT_ID,e.MT_NAME,d.MU_ID,d.MU_NAME,d.TOWN_ID
FROM  mobile_visits a, service_units b, mobile_services c,mobile_units d,mobile_type e,opd_visits f
WHERE c.MU_DATE BETWEEN '20170301' AND '20170302'
AND b.UNIT_ID = c.UNIT_ID
AND c.IS_CANCEL =0
AND c.MS_ID = a.MS_ID
AND c.MU_ID = d.MU_ID
AND d.MT_ID = e.MT_ID
AND f.VISIT_ID = a.VISIT_ID
GROUP BY a.VISIT_ID