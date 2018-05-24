#SET @vn = ?p0;
SET @vn = '0001941388'; 
SELECT
gcoffice.offid  hcode
, CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
, '1' refertype_id
,DATE_FORMAT(a.RF_DT,'%Y%m%d')  refer_date
,DATE_FORMAT(a.RF_DT,'%H%i') refer_time
,CASE
WHEN a.UNIT_ID IN ( 02,12,13,14,15,16,17,18,19,20,27) THEN '1'
WHEN a.UNIT_ID = 11 THEN '3'
WHEN a.UNIT_ID IN (38,39) THEN '2'
WHEN a.UNIT_ID = 22 THEN '4'
END AS  station_id
,CASE
WHEN a.UNIT_ID = 01 THEN '001'
WHEN a.UNIT_ID = 02 THEN '002'
WHEN a.UNIT_ID = 08 THEN '007'
WHEN a.UNIT_ID = 11 THEN '023'
WHEN a.UNIT_ID = 26  THEN '015'
WHEN a.UNIT_ID = 22 THEN '036'
WHEN a.UNIT_ID IN (38,39) THEN '026'
WHEN a.UNIT_ID IN (03,04,05) THEN '004'
WHEN a.UNIT_ID =31 THEN '013'
WHEN a.UNIT_ID IN (12,13,14,15,16,17,18,19,20,27) THEN '020'
END AS location_id
,v.HN  pid
,c.CID cid
,v.HN hn
, i.ADM_ID an
,a.VISIT_ID vn
,CASE 
	WHEN PRENAME not in('') THEN PRENAME
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'เด็กชาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'เด็กหญิง'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS pname
, p.FNAME fname
, p.LNAME lname
,CONCAT(timestampdiff(year,p.BIRTHDATE,a.RF_DT) ,'-',timestampdiff(month,p.BIRTHDATE,a.RF_DT)-(timestampdiff(year,p.BIRTHDATE,a.RF_DT)*12) 
,'-',timestampdiff(day,date_add(p.BIRTHDATE,interval (timestampdiff(month,p.BIRTHDATE,a.RF_DT)) month),a.RF_DT)) AS age
,v.WEIGHT body_weight_kg
,v.HEIGHT height_cm
,p.bl_group  bloodgroup
,p.HOME_ADR addrpart
,SUBSTR(p.TOWN_ID,7,2) moopart
,SUBSTR(p.TOWN_ID,5,2) tmbpart
,SUBSTR(p.TOWN_ID,3,2) amppart
,SUBSTR(p.TOWN_ID,1,2) chwpart
,CASE
WHEN m.INSCL IN (03,04) THEN '89'
END AS pttype_id
,u.UC_CARDID pttypeno
,u.HOSPMAIN  hospmain
,u.HOSPSUB hospsub
,'' typept_id
,'' strength_id
, a.STAFF_ID doctor_id
,'' refer_hospcode
, '' cause_referout_id
,'' expire_date
,'' loads_id
,'' is_coordinate_doctor
,'' is_coordinate_nurse
,'' coordinate_id
,'' is_coordinate_result
,'' hospcode_deny_complete
,'' is_upload
,'' is_download
,'' is_receive
,'' is_cancel
,'' is_referboard
,'' is_deny
,'' refer_type
,'' refer_station_id
,'' diag_text
,'' serviceplan_id
,'' caretype_id
,'' refer_result
,'' is_appoint
,'' is_refer_result
,'' is_send_back
,'' is_send_pack
,'' is_care_plan
FROM gcoffice, refers a
LEFT JOIN opd_visits v ON a.VISIT_ID = v.VISIT_ID AND v.IS_CANCEL = 0
LEFT JOIN cid_hn c ON v.HN = c.HN 
LEFT JOIN population p ON c.CID = p.CID
LEFT JOIN ipd_reg i ON v.VISIT_ID = i.VISIT_ID AND i.IS_CANCEL = 0
LEFT JOIN uc_inscl u ON p.CID = u.CID AND u.DATE_ABORT = 0
LEFT JOIN main_inscls m ON v.INSCL = m.INSCL
WHERE  a.RF_TYPE= 2
AND a.VISIT_ID = @vn
