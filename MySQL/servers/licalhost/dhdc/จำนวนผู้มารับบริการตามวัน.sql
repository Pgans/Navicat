SELECT k.DATE_SERV AS 'วันที่มารับบริการ', COUNT(k.SEQ) AS 'จำนวน'
FROM
(SELECT a.CID, b.DATE_SERV , b.SEQ, a.HN, a.`NAME`, a.LNAME , b.INTIME
FROM person a, service b 
WHERE  a.PID = b.PID
AND b.DATE_SERV BETWEEN '20160401' AND '20160430'
AND b.INTIME = 2) AS k  GROUP BY date_serv ORDER BY date_serv ASC;

SELECT a.CID, b.DATE_SERV , b.SEQ, a.HN, a.`NAME`, a.LNAME , b.INTIME
FROM person a, service b 
WHERE  a.PID = b.PID
AND b.DATE_SERV BETWEEN '20160401' AND '20160430'