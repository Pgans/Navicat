SELECT a.VISIT_ID as seq,b.ADM_ID as an,c.hn as pid, c.hn as hn, 
            a.REFER_ID as referno,
        a.HOSP_ID as to_hcode,
			CASE 
			WHEN a.VISIT_ID in (SELECT ac.VISIT_ID from accidents ac)  THEN '1'
			WHEN a.VISIT_ID not in (SELECT ac.VISIT_ID from accidents ac)  THEN '2'
      END  as pttype_id,
			CASE 
			WHEN a.VISIT_ID in (SELECT ac.VISIT_ID from accidents ac)  THEN 'truama'
			WHEN a.VISIT_ID not in (SELECT ac.VISIT_ID from accidents ac)  THEN 'non truama'
       END as pttype_name,
                c.PT_STATES as strength_id,
                 (case c.PT_STATES 
                     when 1 then 'Resucitate'
                     when 2 then 'Emergency'
                     when 3 then 'Urgency'
                     when 4 then 'Semi Urgency'
                     when 5 then 'Non Urgency'
                     else '' end 
                     ) as strength_name,
        a.UNIT_ID as location_name,
        CASE 
        WHEN a.UNIT_ID in ('22','23','38','39') THEN 'IPD'
        WHEN a.UNIT_ID = '11'   THEN 'ER'
        WHEN a.UNIT_ID not in ('11','22','23','38','39') THEN 'OPD'
        END as station_name,h.HOSP_NAME as to_hcode_name, a.crf_reason as refer_cause,
        date(a.RF_DT) as ReferDate, time(a.RF_DT) as ReferTime, a.STAFF_ID as doctor,
        CONCAT(trim(e.fname),' ',e.lname) as doctor_name
        FROM refers a
        LEFT JOIN ipd_reg b ON a.visit_id = b.visit_id AND b.is_cancel = 0
        LEFT JOIN opd_visits c ON a.visit_id = c.visit_id AND c.is_cancel =0
        LEFT JOIN cid_hn d ON c.hn = d.hn 
        LEFT JOIN population e ON d.cid = d.cid
        INNER JOIN hospitals h ON a.hosp_id = h.hosp_id
				LEFT JOIN opd_diagnosis od ON c.VISIT_ID = od.VISIT_ID AND od.IS_CANCEL = 0  AND od.DXT_ID = 1
				INNER JOIN staff s ON od.STAFF_ID = s.staff_id AND s.cid = e.cid 
        WHERE  #a.VISIT_ID  ='${seq}'
        a.VISIT_ID = 0002220251
        AND a.is_cancel =0
        #AND a.RF_TYPE = 2
        GROUP BY a.VISIT_ID