SELECT c.PID, c.DATE_SERV, c.SEQ,CONCAT(a.`NAME`,'  ',a.LNAME) AS 'ชื่อ-สกุล', FLOOR(DATEDIFF(NOW(),a.BIRTH)/365.25) AS 'อายุ(ปี)',
CASE 
WHEN c.DENTTYPE = 1 THEN 'กลุ่มหญิงตั้งครรภ์'
WHEN c.DENTTYPE = 2 THEN 'กลุ่มเด็กวัยก่อนเรียน'
WHEN c.DENTTYPE = 3 THEN 'กลุ่มเด็กวัยเรียน'
WHEN c.DENTTYPE = 4 THEN 'กลุ่มสูงอายุ'
ELSE 'กลุ่มอื่นๆ'
END AS 'ประเภทผู้ได้รับตรวจฟัน',
CASE 
WHEN c.SERVPLACE = 1 THEN 'ใน'
WHEN c.SERVPLACE = 2 THEN 'นอก'
END AS 'ใน-นอกสถานบริการ', CONCAT(b.`NAME`,'  ' ,b.LNAME) AS Provider,b.PROVIDERTYPE AS'รหัสบุคลากร'
FROM person a, provider b, dental c
 WHERE   a.PID  = c.PID
AND b.PROVIDER = c.PROVIDER
;
