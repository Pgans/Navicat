SET @date1:= '20151001';
SET @date2:= '20160930';

SELECT 'ผู้มารับบริการOPD' AS 'ปี2559(ครั้ง)',
(SELECT COUNT(SEQ)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND INTIME = '1' AND CLINIC != '00111' ) AS 'ในเวลา',

(SELECT COUNT(SEQ)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND INTIME = '2' AND CLINIC != '00111') AS 'นอกเวลา',

(SELECT COUNT(SEQ)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND CLINIC != '00111') AS 'ทั้งหมด'

//ผู้มารับบริการOPD ตัดER
SET @date1:= '20151001';
SET @date2:= '20160930';
SELECT 'ผู้มารับบริการผู้ป้วยนอก' AS 'ปี2559(คน)',
(SELECT COUNT(DISTINCT HN)
FROM  mb_dxopd_service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
AND intime = '1' AND CLINIC != '00111') AS 'ใน',

(SELECT COUNT(DISTINCT HN)
FROM  mb_dxopd_service
WHERE  DATE_SERV BETWEEN @date1 AND @date2
AND intime = '2' AND CLINIC != '00111') AS 'นอก',

(SELECT COUNT(DISTINCT HN)
FROM  mb_dxopd_service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
 AND CLINIC != '00111') AS 'ทั้งหมด'
