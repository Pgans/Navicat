SELECT cid_hn.CID,cid_hn.HN,lab_requests.LREQ_DT as 'วันตรวจLAB',
CASE
    WHEN PRENAME not in('') THEN PRENAME
    WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
    WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
    WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'เด็กชาย'
    WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'
    WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'เด็กหญิง'
    WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
ELSE 'นาง'
END AS 'Pname',population.FNAME,population.LNAME,SUBSTR(lab_requests.LAB_RESULT,7,4) AS 'ผล(a1c)',FLOOR(DATEDIFF(NOW(),population.BIRTHDATE)/365.25) AS 'อายุ',
 a.TOWN_NAME AS 'หมู่บ้าน', b.TOWN_NAME AS 'ตำบล',c.TOWN_NAME AS 'อำเภอ' , d.TOWN_NAME AS 'จังหวัด'
FROM lab_requests,population , cid_hn ,opd_visits,towns a,towns b, towns c ,towns d
WHERE population.CID = cid_hn.CID 
AND opd_visits.VISIT_ID = lab_requests.VISIT_ID
AND opd_visits.HN = cid_hn.HN
AND population.CID = cid_hn.CID
AND lab_requests.LREQ_DT > '20150101'
AND SUBSTR(lab_requests.LAB_RESULT,7,4) >= 8.0
AND lab_requests.LAB_ID = '123'
#AND LEFT(population.town_id,6) = '341401'
AND population.TOWN_ID = a.TOWN_ID
AND CONCAT(left(population.TOWN_ID,6),'00') = b.TOWN_ID
AND CONCAT(left(population.TOWN_ID,4),'0000') = c.TOWN_ID
AND CONCAT(left(population.TOWN_ID,2),'000000') = d.TOWN_ID
GROUP BY opd_visits.VISIT_ID ORDER BY left(population.TOWN_ID,6) = '341401' DESC;
