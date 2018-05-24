SET @an = '076540';
SELECT DISTINCT
gcoffice.offid as hcode
,concat(gcoffice.offid,'-3-',a.refer_id) refer_no
,b.adm_id as an
,c.hn as hn
,b.adm_dt as datetime_admit
,''datetime_dch
,concat('1',c.unit_reg, b.ward_no) as wardstay
,b.ward_no as ward_code
,d.unit_name as ward_name
,g.icd9_code as procedcode
,g.nickname as proced_name
,''timestart
,''timefinish
,g.cost as serviceprice
,a.staff_id as provider
,concat(trim(p.fname),' ', trim(p.lname)) as provider_name
,s.licence as provider_licenseno
,s.cid as provider_cid
FROM gcoffice, refers a
INNER JOIN ipd_reg b ON a.visit_id= b.visit_id and b.is_cancel = 0
LEFT JOIN opd_visits c ON a.visit_id = c.visit_id and c.is_cancel=0
INNER JOIN service_units d ON d.unit_id = b.ward_no 
INNER JOIN opd_diagnosis e ON e.VISIT_ID = c.VISIT_ID and e.is_cancel =0
INNER JOIN opd_operations f ON f.visit_id = c.visit_id and f.is_cancel =0
INNER JOIN icd9cm g ON g.icd9 = f.icd9 
INNER JOIN staff s ON s.staff_id = a.staff_id
LEFT JOIN population p ON p.cid = s.cid 
WHERE b.adm_id =@an
and a.is_cancel = 0