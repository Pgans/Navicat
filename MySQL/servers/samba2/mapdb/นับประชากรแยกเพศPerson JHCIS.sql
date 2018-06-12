SELECT (FLOOR(DATEDIFF(NOW(),birth)/365))as อายุ  , 
concat(COUNT(case WHEN person.sex='1'then 1 end))as ชาย,
concat(COUNT(case WHEN person.sex='2'then 1 end))as หญิง,
COUNT(pid) AS รวม
FROM person 
GROUP BY FLOOR(DATEDIFF(NOW(),birth)/365);