SELECT a.STAFF_ID,CONCAT(c.FNAME,'',TRIM(c.LNAME))AS Provider, COUNT(CASE WHEN SUBSTR(tname,1,3) ='ฝัง' THEN '1' END) AS 'ฝังเข็ม',
COUNT(CASE WHEN SUBSTR(tname,4,6) ='บริบาล' THEN '1' END) AS 'บริบาล', 
COUNT(case WHEN left(TNAME,6) = 'การนวด' THEN '2'END) AS 'การนวด',
#COUNT(CASE WHEN SUBSTR(tname,4,3) = 'นวด' THEN '3' END) AS 'การนวด',
#COUNT(case WHEN left(TNAME,3) = 'นวด' THEN '6'END) AS 'นวด', 
COUNT(CASE WHEN SUBSTR(tname,4,2) = 'อบ' THEN '4' END) AS 'อบ', 
COUNT(CASE WHEN SUBSTR(tname,4,5) = 'ประคบ' THEN '5' END) AS 'ประคบ', 
COUNT(CASE WHEN SUBSTR(tname,4,8) = 'ส่งเสริม' THEN '5' END) AS 'ส่งเสริม', 
COUNT(CODE) AS Total 
FROM mb_thaimedoper a
INNER JOIN staff b ON a.STAFF_ID = b.STAFF_ID
LEFT JOIN population c ON b.CID = c.CID
WHERE REGDATE BETWEEN '2018-08-01' AND '2018-08-02'
GROUP BY STAFF_ID ORDER BY STAFF_ID