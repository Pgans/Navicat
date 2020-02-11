SELECT x.VISIT_ID as seq,
date(x.XREQ_DATETIME) as xray_date,
xl.XL_NAME as xray_name 
FROM xray_requests x
INNER JOIN xray_lists xl ON xl.XL_ID = x.XL_ID
WHERE x.XREQ_DATETIME BETWEEN '2019-12-01' AND '2019-12-15'
#.XREQ_DATETIME BETWEEN '${start_date}' and '${end_date}'