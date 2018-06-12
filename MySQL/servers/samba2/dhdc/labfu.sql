SELECT  PID, DATE_SERV,LABTEST ,LABRESULT
FROM labfu a
WHERE  a.DATE_SERV BETWEEN '2018-03-01' AND '2018-03-31'
AND a.LABTEST IN ( '0440206','044020', '0440204', '0440203',  '0581902',  '0581904' )
AND a.LABRESULT = 0



รหัส LAB ที่ใช้มีดังนี้  
(1) urine albumin-to-creatinine ratio (ACR) รหัส 0440206  
(2) urine protein-to-creatinine ratio (UPCR) รหัส 0440205  
(3) microalbuminuria รหัส 0440204  
(4) macroalbuminuria รหัส 0440203  
(5) serum creatinine รหัส 0581902  
(6) eGFR รหัส 0581904


