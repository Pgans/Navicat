SELECT  'จำนวนคลอด'AS 'เด็กคลอดปี2560',
COUNT(CASE WHEN(a.sex ='1') THEN '1' END) AS 'ชาย', 
COUNT(CASE WHEN(a.sex ='2') THEN '2' END) AS 'หญิง' ,
COUNT(a.SEX ) AS 'รวม'
FROM mb_nbb a
WHERE a.BDATE BETWEEN '2016-10-01' AND '2017-09-30'