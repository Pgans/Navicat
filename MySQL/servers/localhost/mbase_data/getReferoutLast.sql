
    SELECT 
r.VISIT_ID as seq,
o.HN as hn,
CASE 
           WHEN p.PRENAME not in('') THEN p.PRENAME
           WHEN TIMESTAMPDIFF(year,p.BIRTHDATE,NOW()) < '20' AND p.sex='1' AND p.MARRIAGE = '4'THEN 'สามเณร'
           WHEN TIMESTAMPDIFF(year,p.BIRTHDATE,NOW()) >= '20' AND p.sex='1' AND p.MARRIAGE  = '4'THEN 'พระภิกษุ'
           WHEN TIMESTAMPDIFF(year,p.BIRTHDATE,NOW()) < '15'  AND p.sex='1' THEN 'เด็กชาย'
           WHEN TIMESTAMPDIFF(year,p.BIRTHDATE,NOW()) >= '15' AND p.sex='1' THEN 'นาย'
           WHEN TIMESTAMPDIFF(year,p.BIRTHDATE,NOW()) < '15'  AND p.sex='2' THEN 'เด็กหญิง'
           WHEN TIMESTAMPDIFF(year,p.BIRTHDATE,NOW()) >= '15' AND p.sex='2' AND p.MARRIAGE ='1' THEN 'นางสาว'
           ELSE 'นาง' 
END AS title_name, 
p.FNAME as first_name, 
p.LNAME as last_name,
r.REFER_ID as referno,
date(r.RF_DT) as ReferDate,
r.HOSP_ID as to_hcode,
CASE 
			WHEN o.VISIT_ID in (SELECT ac.VISIT_ID from accidents ac)  THEN '1'
			WHEN o.VISIT_ID not in (SELECT ac.VISIT_ID from accidents ac)  THEN '2'
      END  as pttype_id,
CASE 
			WHEN o.VISIT_ID in (SELECT ac.VISIT_ID from accidents ac)  THEN 'truama'
			WHEN o.VISIT_ID not in (SELECT ac.VISIT_ID from accidents ac)  THEN 'non truama'
       END as pttype_name,
        o.PT_STATES as strength_id,
                 (case o.PT_STATES 
                     when 1 then 'Resucitate'
                     when 2 then 'Emergency'
                     when 3 then 'Urgency'
                     when 4 then 'Semi Urgency'
                     when 5 then 'Non Urgency'
                     else '' end 
                     ) as strength_name,
        h.HOSP_NAME as to_hcode_name,
        r.crf_reason  as refer_cause,
        time(r.RF_DT) as ReferTime,
        r.STAFF_ID as doctor,
        CONCAT(trim(p1.fname),' ',p1.lname) as doctor_name
   FROM 
				refers as r
				LEFT JOIN opd_visits o ON r.VISIT_ID = o.VISIT_ID AND o.IS_CANCEL = 0
				LEFT JOIN cid_hn c ON o.HN = c.HN 
				LEFT JOIN population p ON c.CID = p.CID
				LEFT JOIN staff s ON s.STAFF_ID = r.STAFF_ID
				LEFT JOIN population p1 ON s.CID = p1.CID
				LEFT JOIN hospitals h ON r.HOSP_ID = h.HOSP_ID
        WHERE date(r.RF_DT) between '2019-12-20' and '2019-12-21'
    AND r.is_cancel = 0
    AND r.RF_TYPE = 2
    GROUP BY r.VISIT_ID 