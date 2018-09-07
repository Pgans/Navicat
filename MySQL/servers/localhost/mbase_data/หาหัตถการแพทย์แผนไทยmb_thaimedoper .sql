SELECT REGDATE,
 COUNT( CASE WHEN (CODE = '99.92') THEN '1' END ) AS 'ฝังเข็ม',
 COUNT( CASE WHEN ( LEFT (TNAME, 9) = 'การบริบาล' ) THEN '1' END ) AS 'บริบาล',
 COUNT( CASE WHEN ( LEFT (TNAME, 6) = 'การนวด' ) THEN '1' END ) AS 'นวด',
 COUNT( CASE WHEN ( LEFT (TNAME, 5) = 'การอบ' ) THEN '1' END ) AS 'อบ',
 COUNT( CASE WHEN ( LEFT (TNAME, 8) = 'การประคบ' ) THEN '1' END ) AS 'ประคบ', 
COUNT( CASE WHEN ( LEFT (TNAME, 6) = 'การส่ง' ) THEN '1' END ) AS 'ส่งเสริม', 
COUNT(`CODE`) AS Total 
FROM mb_thaimedoper 
WHERE REGDATE BETWEEN '2018.01.01' AND '2018.01.05' AND INOUTS = 1 GROUP BY REGDATE ORDER BY REGDATE