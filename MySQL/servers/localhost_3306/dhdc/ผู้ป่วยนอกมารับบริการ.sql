SET @date1:= '20151001';
SET @date2:= '20160930';

SELECT 'ผู้มารับบริการผู้ป้วยนอก' AS 'ปี2559(ครั้ง)',
(SELECT COUNT(seq)
FROM  service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
AND intime = '1') AS 'ใน',

(SELECT COUNT(seq)
FROM  service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
AND intime = '2') AS 'นอก',

(SELECT COUNT(seq)
FROM  service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
) AS 'ทั้งหมด'



SET @date1:= '20151001';
SET @date2:= '20160930';

SELECT 'ผู้มารับบริการผู้ป้วยนอก' AS 'ปี2559(คน)',
(SELECT  COUNT(DISTINCT HN)
FROM  service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
AND intime = '1') AS 'ใน',

(SELECT COUNT(DISTINCT HN)
FROM  service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
AND intime = '2') AS 'นอก',

(SELECT COUNT(DISTINCT HN)
FROM  service 
WHERE  DATE_SERV BETWEEN @date1 AND @date2
) AS 'ทั้งหมด'

