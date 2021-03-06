SELECT a.CID, b.PID, c.PID
FROM person a 
INNER JOIN service b ON a.PID = b.PID
INNER JOIN diagnosis_opd c ON b.SEQ = c.SEQ 
AND c.DIAGCODE IN ('G40','G41')
AND c.DIAGCODE BETWEEN 'J41' AND 'J44'
AND c.DIAGCODE = 'J47'
AND c.DIAGCODE IN ('J10','J11','J12','J16','J18','J20','J21','J22')
WHERE  c.DATE_SERV  > '2017-10-01'
AND c.SEQ IN (SELECT SEQ FROM admission )
 ;