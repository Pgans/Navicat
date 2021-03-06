SELECT DISTINCT c.VISIT_ID , c.HN, a.CID,FLOOR(DATEDIFF(NOW(),a.BIRTHDATE)/365.25) AS AGE,f.ICD_NAME , f.ICD10_TM,
 aa.TOWN_NAME AS MOOBAN,bb.TOWN_NAME AS TUMBON, cc.TOWN_NAME
FROM population a, cid_hn b , opd_visits c, opd_diagnosis e, icd10new f,towns aa,towns bb,towns cc
WHERE c.REG_DATETIME BETWEEN '20150101' AND '20150131'
AND c.IS_CANCEL = 0
AND a.CID = b.CID
AND b.HN = c.HN
AND c.VISIT_ID = e.VISIT_ID
AND e.ICD10 = f.ICD10
AND e.DXT_ID = 1
AND a.TOWN_ID = aa.TOWN_ID
#AND CONCAT(left(a.TOWN_ID,6),'00') = bb.TOWN_ID
AND CONCAT(left(a.TOWN_ID,4),'0000') = cc.TOWN_ID
AND c.VISIT_ID NOT IN (SELECT VISIT_ID FROM ipd_reg)
#AND a.TOWN_ID BETWEEN '34140000' AND '34141410'
GROUP BY c.VISIT_ID

