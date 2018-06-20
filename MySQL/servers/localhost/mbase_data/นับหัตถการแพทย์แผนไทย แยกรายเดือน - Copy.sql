SELECT month(REGDATE)AS MONTH, 
		COUNT(CASE WHEN SUBSTR(tname,1,3) ='ฝัง' THEN '1' END) AS 'ฝังเข็ม',
		COUNT(CASE WHEN SUBSTR(tname,4,6) ='บริบาล'  THEN '1' END) AS 'บริบาล', 
		COUNT(CASE WHEN SUBSTR(tname,4,3) = 'นวด' THEN '3' END) AS 'การนวด',
		COUNT(CASE WHEN SUBSTR(tname,4,2) = 'อบ' THEN '4' END) AS 'อบ',
		COUNT(CASE WHEN SUBSTR(tname,4,5) = 'ประคบ' THEN '5' END) AS 'ประคบ',
		COUNT(CASE WHEN SUBSTR(tname,4,8) = 'ส่งเสริม' THEN '5' END) AS 'ส่งเสริม',
		COUNT(CODE) AS Total 
FROM mb_thaimedoper 
WHERE REGDATE > '2018-05-01'
GROUP BY MONTH ORDER BY MONTH