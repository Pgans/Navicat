
#นับจำนวนครั้ง
SET @date1 := '2015-10-01';
SET @date2 := '2016-09-30';

SELECT 'ผู้มารับบริการER' AS 'ปี2559(ครั้ง)',
(SELECT COUNT(SEQ)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND INTIME = '1' AND CLINIC = '00111' AND left(DIAGCODE,1) ='Z' ) AS 'ในเวลา',

(SELECT COUNT(SEQ)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND INTIME = '2' AND CLINIC = '00111'  ) AS 'นอกเวลา',

(SELECT COUNT(SEQ)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
 AND CLINIC = '00111' AND left(DIAGCODE,1) ='Z') AS 'ทั้งหมด'


#นับจำนวนคน
SET @date1:= '2015-10-01';
SET @date2:= '2016-09-30';

SELECT 'ผู้มารับบริการER' AS 'ปี2559(คน)',
(SELECT COUNT(DISTINCT HN)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND INTIME = '1' AND CLINIC = '00111'  ) AS 'ในเวลา',

(SELECT COUNT(DISTINCT HN)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
AND INTIME = '2' AND CLINIC = '00111' ) AS 'นอกเวลา',

(SELECT COUNT(DISTINCT HN)
FROM mb_dxopd_service
WHERE DATE_SERV BETWEEN @date1 AND @date2
 AND CLINIC = '00111' ) AS 'ทั้งหมด'