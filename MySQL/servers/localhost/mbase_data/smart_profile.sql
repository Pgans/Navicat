select o.HN as hn, 
           p.cid as cid,
					CASE 
        WHEN PRENAME not in('') THEN PRENAME
        WHEN TIMESTAMPDIFF(year,p.birthdate,NOW()) < '20' AND p.sex='1' AND p.MARRIAGE = '4'THEN 'สามเณร'

        WHEN TIMESTAMPDIFF(year,p.birthdate,NOW()) >= '20' AND p.sex='1' AND p.MARRIAGE = '4'THEN 'พระภิกษุ'

        WHEN TIMESTAMPDIFF(year,p.birthdate,NOW()) < '15'  AND p.sex='1' THEN 'เด็กชาย'

        WHEN TIMESTAMPDIFF(year,p.birthdate,NOW()) >= '15' AND p.sex='1' THEN 'นาย'

        WHEN TIMESTAMPDIFF(year,p.birthdate,NOW()) < '15'  AND p.sex='2' THEN 'เด็กหญิง'

        WHEN TIMESTAMPDIFF(year,p.birthdate,NOW()) >= '15' AND p.sex='2' AND p.MARRIAGE='1' THEN 'นางสาว'
    ELSE 'นาง'
    END AS title_name
          , p.FNAME as first_name
					, p.LNAME as last_name
					, SUBSTR(p.TOWN_ID,7,2) as moopart
					, trim(p.HOME_ADR) as addrpart
					, SUBSTR(p.TOWN_ID,5,2) as tmbpart
					, SUBSTR(p.TOWN_ID,3,2) as amppart
					, SUBSTR(p.TOWN_ID,1,2) as chwpart
					, p.BIRTHDATE as brthdate
          , concat(lpad(timestampdiff(year,p.birthdate,now()),3,'0'),'-'
        ,lpad(mod(timestampdiff(month,p.birthdate,now()),12),2,'0'),'-'
        ,lpad(if(day(p.birthdate)>day(now()),dayofmonth(now())-(day(p.birthdate)-day(now())),day(now())-day(p.birthdate)),2,'0')) as age
           , m.INSCL as pttype_id
					 , m.INSCL_NAME as pttype_name
           ,'' as pttype_no
					 , g.HOSPMAIN  as hospmain
					 , hop.HOSP_NAME as hospmain_name
					 , g.HOSPSUB as hospsub
					 , hs.HOSP_NAME as hospsub_name
           , g.UC_REGISTER as registdate
					 , date(o.REG_DATETIME) as visitdate
    FROM population as p 
        INNER JOIN cid_hn c on p.CID = c.CID
				INNER JOIN opd_visits o ON c.HN = o.HN
        LEFT JOIN towns t ON p.town_id = t.town_id
        LEFT  JOIN main_inscls m ON p.INSCL = m.INSCL
				LEFT JOIN uc_inscl g ON p.CID= g.CID 
			  LEFT JOIN hospitals hop ON g.HOSPMAIN = hop.HOSP_ID
				LEFT JOIN hospitals hs ON g.HOSPSUB = hs.HOSP_ID
        WHERE o.hn =  '117878'
			  ORDER BY o.REG_DATETIME DESC
        LIMIT 1