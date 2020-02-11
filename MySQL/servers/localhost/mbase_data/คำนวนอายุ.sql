 SELECT 
        a.VISIT_ID as seq,
		CASE 
        WHEN PRENAME not in('') THEN PRENAME
        WHEN timestampdiff(year,p.birthdate,curdate()) < '20' AND sex='1' AND MARRIAGE = '4'THEN 'สามเณร'
        WHEN timestampdiff(year,birthdate,curdate()) >= '20' AND sex='1' AND MARRIAGE = '4'THEN 'พระภิกษุ'
        WHEN timestampdiff(year,birthdate,curdate()) < '15'  AND sex='1' THEN 'เด็กชาย'
        WHEN timestampdiff(year,birthdate,curdate()) >= '15' AND sex='1' THEN 'นาย'
        WHEN timestampdiff(year,birthdate,curdate()) < '15'  AND sex='2' THEN 'เด็กหญิง'
        WHEN timestampdiff(year,birthdate,curdate()) >= '15' AND sex='2' AND MARRIAGE='1' THEN 'นางสาว'
    ELSE 'นาง' END as title_name,c.fname as first_name,c.lname as last_name 
		
        FROM opd_visits a
        INNER JOIN cid_hn b ON a.hn = b.hn
        INNER JOIN population c ON b.cid = c.cid 
			
        WHERE a.REG_DATETIME BETWEEN '2019-01-01' AND '2019-01-02' LIMIT 5-- a.hn ='${hn}' and a.visit_id = '${seq}' 
		