
SELECT  a.VISIT_ID, b.HN , c.INSCL_NAME, a.datetime_ae
CASE
WHEN a.vehicle= 1 THEN 'จัก รยานและสามล้ อถีบ'
WHEN a.vehicle= 2 THEN 'จักรยานยนต์'
WHEN a.vehicle= 3 THEN 'สามล้อเครื่ือง'
WHEN a.vehicle= 4 THEN 'รถยนต์'
WHEN a.vehicle= 5 THEN 'รถปิคอัพ'
WHEN a.vehicle= 6 THEN 'รถตู้'
WHEN a.vehicle= 7 THEN 'รถโดยสารสองแถว'
WHEN a.vehicle= 8 THEN 'รถโดยสารใหญ่'
WHEN a.vehicle= 9 THEN 'รถบรรทุก'
WHEN a.vehicle= 10 THEN 'เรือโดยสาร'
WHEN a.vehicle= 11 THEN 'เรืออื่นๆ'
WHEN a.vehicle= 12 THEN 'อากาศยาน'
WHEN a.vehicle= 98 THEN 'อื่นๆ'
WHEN a.vehicle= 98 THEN 'ไม่ทราบ'
END AS vehicle 
FROM accidents a
LEFT JOIN opd_visits b ON a.VISIT_ID = b.visit_id AND b.is_cancel = 0
LEFT JOIN main_inscls c ON c.INSCL = b.INSCL
WHERE  a.datetime_ae > CURDATE() 
AND a.is_cancel =0
