
SELECT  DISTINCT a.PID, a.DIAGCODE ,a.DATE_SERV, b.NAME, b.LNAME , DATEDIFF('2018-03-31',b.BIRTH)/365.25 AS AGES
FROM diagnosis_opd a
LEFT JOIN person b ON a.PID = b.PID
WHERE  a.DATE_SERV BETWEEN '2017-04-01' AND '2018-03-31'
AND a.DIAGTYPE = 1
AND (a.DIAGCODE IN ('G40','G41')
OR a.DIAGCODE BETWEEN 'J41' AND 'J44'
OR a.DIAGCODE = 'J47'
OR a.DIAGCODE IN ('J10','J11','J12','J16','J18','J20','J21','J22')
OR a.DIAGCODE IN ('J45','J46')
OR a.DIAGCODE IN ('E100','E101','E106','E109','E110','E111','E116','E119','E130','E131','E136','E139','E140','E141','E146','E149')
OR a.DIAGCODE IN ('I10','I11')
)
AND a.SEQ IN (SELECT SEQ FROM admission)
AND  DATEDIFF('2018-03-31',b.BIRTH)/365.25 BETWEEN '15' AND '74'
