<<<<<<< HEAD

SET @vn = '0001907464';
SELECT DISTINCT
gcoffice.offid as hcode
,concat(gcoffice.offid,'-3-', a.refer_id)  as refer_no
,d.birthdate as birthday
,d.telephone as tel
,d.marriage as marrystatus
,d.natn_id as nationality
,d.oc_id as citizenship
,d.religion as  religion
,d.oc_id as  occupation
,d.mother AS mather_name
,d.father as father_name
,d.contact as contact_name
,'' contact_relation
,d.CONTACT_ADR as contact_addr
FROM gcoffice , refers a
LEFT JOIN opd_visits b ON a.visit_id = b.visit_id AND b.is_cancel = 0
LEFT JOIN cid_hn c ON b.hn = c.hn 
LEFT JOIN population d ON c.cid = d.cid 
WHERE a.visit_id =@vn
AND a.is_cancel = 0

xxxx
=======
SET @vn = '0001907272'; 
SELECT DISTINCT gcoffice.offid as hcode ,concat(gcoffice.offid,'-3-', a.refer_id) as refer_no ,d.birthdate as birthday ,d.telephone as tel 
,d.marriage as marrystatus ,d.natn_id as nationality ,d.oc_id as citizenship ,d.religion as religion 
,d.oc_id as occupation ,d.mother AS mather_name ,d.father as father_name ,d.contact as contact_name 
,'' contact_relation ,d.CONTACT_ADR as contact_addr
 FROM gcoffice , refers a 
LEFT JOIN opd_visits b ON a.visit_id = b.visit_id AND b.is_cancel = 0 
LEFT JOIN cid_hn c ON b.hn = c.hn 
LEFT JOIN population d ON c.cid = d.cid 
WHERE a.visit_id =@vn
AND a.is_cancel = 0
>>>>>>> 5de76d7f130a0a924cad0a4c422c12b1397ac875
