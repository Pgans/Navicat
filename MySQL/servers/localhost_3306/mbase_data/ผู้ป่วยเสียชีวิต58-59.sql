SELECT a.CID ,b.HN , a.DEATH_DATE, c.FNAME, c.LNAME, FLOOR(DATEDIFF(NOW(),c.BIRTHDATE)/365.25) AS 'AGE',
CASE
WHEN c.SEX = 1 THEN 'ชาย'
WHEN c.SEX = 2 THEN 'หญิง'
END AS 'SEX', CDEATH
FROM deaths a, cid_hn b, population c
WHERE  a.DEATH_DATE BETWEEN '20101001' AND 'now()'
AND is_cancel = 0
AND IS_HOSP = 1
AND a.CID = b.CID
AND b.CID = c.CID 
;