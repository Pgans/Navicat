SELECT a.HOSPCODE,a.PID AS HN, a.SEX, a.GA, a.HC,a.BWEIGHT, a.`รอบอก`,  a.`ตัวยาว`,a.BDATE,a.DIAGTYPE,a.DIAGCODE,
a.`ชื่อแพทย์เด็ก`,a.`แพทย์ที่ทำคลอด`,b.`NAME` AS 'ชื่อแม่', b.LNAME AS 'นามสกุลแม่', a.MPID AS 'HNแม่'
FROM mb_newborn_diag a, person b
WHERE  a.BDATE BETWEEN '01-01-2557' AND '30-09-2559'
AND a.MPID = b.PID ORDER BY a.PID


