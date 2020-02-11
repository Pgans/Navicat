SELECT o.VISIT_ID as seq , o.HISTORY as hpi 
FROM  opd_visits o
WHERE o.HN = '${seq}' group by o.HN   