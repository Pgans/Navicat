SELECT a.PID , a.CID,b.DDEATH, a.NAME , a.LNAME, a.DISCHARGE
FROM person a, death b
WHERE a.PID = b.PID
AND a.DISCHARGE =9
GROUP BY a.CID,a.PID ORDER BY b.DDEATH ;