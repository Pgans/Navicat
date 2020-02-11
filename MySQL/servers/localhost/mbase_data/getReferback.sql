SELECT r.VISIT_ID as seq,
 o.HN as hn,
 CASE 
           WHEN p.PRENAME not in('') THEN p.PRENAME
           WHEN DATEDIFF(now(),p.BIRTHDATE)/365.25 < '20' AND p.sex='1' AND p.MARRIAGE = '4'THEN 'สามเณร'
           WHEN DATEDIFF(now(),p.BIRTHDATE)/365.25 >= '20' AND p.sex='1' AND p.MARRIAGE = '4'THEN 'พระภิกษุ'
           WHEN DATEDIFF(now(),p.BIRTHDATE)/365.25 < '15'  AND p.sex='1' THEN 'เด็กชาย'
           WHEN DATEDIFF(now(),p.BIRTHDATE)/365.25 >= '15' AND p.sex='1' THEN 'นาย'
           WHEN DATEDIFF(now(),p.BIRTHDATE)/365.25 < '15'  AND p.sex='2' THEN 'เด็กหญิง'
           WHEN DATEDIFF(now(),p.BIRTHDATE)/365.25 >= '15' AND p.sex='2' AND p.MARRIAGE='1' THEN 'นางสาว'
           ELSE 'นาง' 
END AS title_name, 
p.FNAME as first_name, 
p.LNAME as last_name,
r.REFER_ID as referno,
date(r.RF_DT) as ReferDate,
r.HOSP_ID as to_hcode,
            h.HOSP_NAME as to_hcode_name,
        r.crf_reason  as refer_cause,
        time(r.RF_DT) as ReferTime,
        r.STAFF_ID as doctor,
        CONCAT(trim(p1.fname),' ',p1.lname) as doctor_name
  FROM refers as r
       LEFT JOIN opd_visits o ON r.VISIT_ID = o.VISIT_ID AND o.IS_CANCEL = 0
        LEFT JOIN cid_hn c ON o.HN = c.HN 
				LEFT JOIN population p ON c.CID = p.CID
				LEFT JOIN staff s ON s.STAFF_ID = r.STAFF_ID
				LEFT JOIN population p1 ON s.CID = p1.CID
				LEFT JOIN hospitals h ON r.HOSP_ID = h.HOSP_ID
 WHERE 
#o.dchdate between '${start_date}' and '${end_date}'
date(r.RF_DT) between '2019-10-01' and '2019-10-05'
AND r.is_cancel = 0
AND r.RF_TYPE = 1
GROUP BY r.VISIT_ID