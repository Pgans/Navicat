 
SELECT ICD10_TM , ICD_NAME , COUNT(VISIT_ID) AS Amount
FROM mb_referout_all_list
WHERE RF_DT BETWEEN '2017-10-01' AND '2017-12-31'
#AND DXT_ID = 1
AND HOSPID  IN (SELECT  a.HOSP_ID FROM hosp3400 a)
GROUP BY ICD10_TM ORDER BY Amount DESC ;


#SELECT * FROM mb_referout_all_list WHERE ICD10_TM = 'i10' AND RF_DT BETWEEN '2016-10-01' AND '2017-09-30'  AND DXT_ID = 1 AND HOSPID IN (SELECT a .HOSP_ID FROM hosp3400 a)