SELECT c.CID, b.PID , a.DDEATH , b.DATE_SERV
FROM death a, service b, person c
WHERE  b.DATE_SERV BETWEEN '20151001' AND '20160930' 
AND a.PID = b.PID
AND a.PID = c.PID
AND b.DATE_SERV > a.DDEATH
GROUP BY c.CID ;