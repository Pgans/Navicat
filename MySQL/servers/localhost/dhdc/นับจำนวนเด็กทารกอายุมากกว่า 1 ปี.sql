SELECT 'จำนวนเด็กที่อายุมาก1ปี ' AS 'เด็กทารก(Newborn)',COUNT(a.PID) AS Amount
FROM newborn a, person b
WHERE a.PID = b.PID
AND a.BDATE != b.BIRTH
