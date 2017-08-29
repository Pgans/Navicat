SELECT c.VISIT_ID,DATE_FORMAT(c.REG_DATETIME,'%Y%m%d') AS 'reg_date', b.hn, a.fname, a.lname,e.UNIT_ID
FROM population a, cid_hn b, opd_visits c, service_units e,mobile_visits d
INNER JOIN mobile_services f ON f.MS_ID = d.MS_ID AND f.UNIT_ID = '26'
WHERE 
c.reg_datetime BETWEEN '20160601' AND '20160615'
AND c.IS_CANCEL = 0
AND a.cid = b.cid
AND b.hn = c.hn
AND c.visit_id = d.visit_id
AND c.unit_id = e.unit_id;

