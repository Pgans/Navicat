Select CURDATE() AS regdate ,a.REG_DATETIME as reg_date,b.datetime_ae as acc_date, a.hn as hn, d.cid as cid, 
CASE 
	WHEN PRENAME not in('') THEN PRENAME
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='1' THEN 'ดช.'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='1' THEN 'นาย'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 < '15'  AND sex='2' THEN 'ดญ.'
	WHEN DATEDIFF(now(),BIRTHDATE)/365.25 >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นส.'
ELSE 'นาง'
END AS pname
, trim(d.fname) as fname, trim(d.lname) as lname, DATE_FORMAT(d.birthdate+INTERVAL 543 YEAR, '%d-%m-%Y') as 'birthdate', h.INSCL_NAME AS inscl_name,
 f.ward_no, g.hosp_id, e.PAID as paid, a.HISTORY AS history,
b.scene,
CASE
WHEN b.vehicle= 1 THEN 'จัก รยานและสามล้ อถีบ'
WHEN b.vehicle= 2 THEN 'จักรยานยนต์'
WHEN b.vehicle= 3 THEN 'สามล้อเครื่ือง'
WHEN b.vehicle= 4 THEN 'รถยนต์'
WHEN b.vehicle= 5 THEN 'รถปิคอัพ'
WHEN b.vehicle= 6 THEN 'รถตู้'
WHEN b.vehicle= 7 THEN 'รถโดยสารสองแถว'
WHEN b.vehicle= 8 THEN 'รถโดยสารใหญ่'
WHEN b.vehicle= 9 THEN 'รถบรรทุก'
WHEN b.vehicle= 10 THEN 'เรือโดยสาร'
WHEN b.vehicle= 11 THEN 'เรืออื่นๆ'
WHEN b.vehicle= 12 THEN 'อากาศยาน'
WHEN b.vehicle= 98 THEN 'อื่นๆ'
WHEN b.vehicle= 98 THEN 'ไม่ทราบ'
END AS vehicle
From accidents b left join opd_visits a on a.visit_id = b.visit_id
Left  join cid_hn c on a.hn=c.hn
Left  join population d on c.cid=d.cid
Left  join receipts e on a.visit_id = e.visit_id
Left  join ipd_reg  f on a.visit_id =  f.visit_id
Left  join refers g on a.visit_id = g.visit_id
LEFT JOIN main_inscls h on a.INSCL = h.INSCL
Where a.inscl in (18,19)
And a.reg_datetime > CURDATE()-15