SET @date1:= '2016-01-01';
SET @date2:= '2016-02-30';
##SET @mpid:= (SELECT a.mpid,b.name FROM newborn a, person b WHERE a.mpid = b.pid );
SELECT  b.HOSPCODE,b.PID , a.SEX,b.GA, e.HEADCIRCUM, b.BWEIGHT, '' AS 'รอบอก',e.HEIGHT,b.BDATE,
DATE_FORMAT(DATE_ADD(b.BDATE,INTERVAL 543 YEAR),'%d-%m-%Y') AS BDATE2 ,
c.DIAGTYPE,c.DIAGCODE,'' AS 'ชื่อแพทย์เด็ก',CONCAT(d.`NAME`,' ',d.LNAME) AS 'แพทย์ที่ทำคลอด',b.MPID
FROM person a, newborn b,nutrition e,diagnosis_ipd c
LEFT JOIN provider d ON c.PROVIDER = d.PROVIDER
WHERE b.BDATE BETWEEN @date1 AND @date2
AND a.PID = b.PID
AND b.PID = c.PID
AND b.PID = e.PID
GROUP BY b.PID




