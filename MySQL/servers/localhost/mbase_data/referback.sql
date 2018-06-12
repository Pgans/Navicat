

#SET @vn = ?p0;
SET @vn = '0001909085'; 
SELECT
 gcoffice.offid  AS hcode, CONCAT(gcoffice.offid,'-3-', a.refer_id) referback_no
,' ' referback_no_his
,DATE_FORMAT(a.RF_DT,'%Y%m%d')  refer_date
, DATE_FORMAT(a.RF_DT,'%H%i') refer_time
, p.CID cid,
CASE 
	WHEN PRENAME not in('') THEN PRENAME
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'เด็กชาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'เด็กหญิง'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS pname
,p.FNAME fname
,p.LNAME lname
,CONCAT(timestampdiff(year,p.BIRTHDATE,a.RF_DT) ,'-',timestampdiff(month,p.BIRTHDATE,a.RF_DT)-(timestampdiff(year,p.BIRTHDATE,a.RF_DT)*12) 
,'-',timestampdiff(day,date_add(p.BIRTHDATE,interval (timestampdiff(month,p.BIRTHDATE,a.RF_DT)) month),a.RF_DT)) AS age
,v.WEIGHT  as body_weight_kg
,v.HEIGHT as height_cm
,p.bl_group as  bloodgroup
,p.HOME_ADR addrpart
,substr(p.TOWN_ID,7,2) moopart
,substr(p.TOWN_ID,5,2) tmbpart
,substr(p.TOWN_ID,3,2)  amppart
,substr(p.TOWN_ID,1,2) chwpart
,CASE
WHEN m.INSCL IN (03,04) THEN '89'
END AS pttype_id
,u.UC_CARDID  pttypeno
,'' loads_id
,a.STAFF_ID doctor_id
,'' refer_hospcode
, '' eye_opening
,'' verbal_response
,'' motor_response
,'' pupil
,'' cause_referback_id
, '' diag_text
,' ' referback_result
, '' is_upload
, '' is_download
, '' is_receive
,'' hn
,'' station_ID
,'' location_ID
,'' word_call_man
,'' word_call_status
,'' refercenter_receive_doc
,'' refercenter_receive_date
,'' refercenter_receive_time
,'' refercenter_receive_man
,'' refercenter_receive_status
,'' end_refercenter_result
,'' end_refercenter_transport
,'' end_refercenter_date
,'' end_refercenter_time
,'' end_refercenter_man
,'' end_refercenter_status
,'' receive_patient_back_date
,'' receive_patient_back_time
,'' receive_patient_back_man
,'' receive_patient_back_status
,'' is_send_pacs
FROM  gcoffice , refers a
LEFT JOIN opd_visits v ON a.VISIT_ID = v.VISIT_ID AND v.IS_CANCEL = 0
INNER JOIN cid_hn c ON v.HN = c.HN
LEFT JOIN population p ON c.CID = p.CID
LEFT JOIN service_units s ON a.UNIT_ID = s.UNIT_ID
LEFT JOIN uc_inscl u ON p.CID = u.CID AND u.DATE_ABORT =0
LEFT JOIN main_inscls m ON v.INSCL = m.INSCL
WHERE 
a.VISIT_ID = @vn
AND a.RF_TYPE = 1
AND LEFT(a.HOSP_ID,3) NOT IN ( 037,036)
AND a.HOSP_ID NOT IN  (10953, 99809)