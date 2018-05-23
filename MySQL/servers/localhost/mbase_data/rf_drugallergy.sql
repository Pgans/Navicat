
SELECT DISTINCT
gcoffice.offid as hcode
, concat( gcoffice.offid ,'-3-',a.refer_id ) refer_no
,date_format(e.ADRDATE,'%Y%m%d') begin_date
,date_format(e.UPD_DT,'%Y%m%d') daterecord
,f.didstd as  drugallergy
,'' dname
,'' typedx
,'' alevel
,'' symptom_name
,'' symptom
,'' informant
,'' informant_desc
,'' informhosp
FROM  gcoffice,  refers a
LEFT JOIN opd_visits b ON a.visit_id = b.visit_id  AND b.is_cancel = 0
INNER JOIN cid_hn c ON b.hn = c.hn 
LEFT JOIN population d ON c.cid = d,cid 
INNER JOIN cid_drug_allergy e ON d.cid = d.cid AND e.is_cancel = 0
INNER JOIN drugs f ON e.drug_id = f.drug_id  
WHERE  a.rf_dt > '2018.01.01' 
AND a.is_cancel = 0

SELECT

                             b.hn,DATE(a.upd_dt)AS REPORT_DATE,c.drug_name AS AGENT,a.allergy_note AS SYMPTOM,a.staff_id AS reporter,a. LEVEL AS relation_level,
                             a.aecode AS note,a.adrtype AS allergy_type,'' ASdisplay_order,a.adrdate AS BEGIN_DATE,'' AS allergy_group_id,'' AS seriousness_id,'' AS allergy_result_id

                            " '' AS allergy_relation_id,'' AS ward,'OPD' AS department,'' AS spclty,a.upd_dt AS entry_datetime,a.upd_dt AS update_datetime,'' ASdepcode," +

                            " '' AS no_alert,'' AS naranjo_result_id,'' AS force_no_order,'' AS opd_allergy_alert_type_id,'' AS hos_guid,'' AS adr_preventable_score," +

                            " '' AS preventable,a.cid AS patient_cid,'' AS adr_consult_dialog_id,'' AS opd_allergy_report_type_id,'' AS hos_guid_ext," +

                            " c.didstd AS agent_code24,'' AS SEIOUSNESS_NAME,'' AS opd_allergy_alert_group_name,'' AS relation_name,'' AS result_name," +

                            " CONCAT(" +

                            " TRIM(e.prename)," +

                            " TRIM(e.fname)," +

                            " ' '," +

                            " 	e.lname" +

                            "  )AS reporter_name" +

                            "  FROM" +

                            "     cid_drug_allergy a,cid_hn b,drugs c,staff d,population e" +

                            "  WHERE" +

                            "     a.cid = b.cid" +

                            "  AND a.drug_id = c.drug_id" +

                            "  AND a.staff_id = d.staff_id" +

                            " AND d.cid = e.cid and b.HN=?p0";