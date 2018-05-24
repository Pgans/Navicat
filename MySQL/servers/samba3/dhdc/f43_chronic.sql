SELECT  DISTINCT gcoffice.offid AS HOSPCODE, a.HN AS PID,DATE_FORMAT(b.REG_DATE,'%Y-%m-%d') AS DATE_DIAG, b.ICD10 AS CHRONIC,
 '' AS HOSP_DX, 
(
CASE WHEN TRIM(b.HOSP_ID) > ' ' THEN b.HOSP_ID
	ELSE '10953'
END
) AS HOSP_RX, DATE_FORMAT(b.DSC_DATE,'%Y-%m-%d') AS DATE_DISCH,
(
CASE WHEN DAY(b.DSC_DATE) = 0 THEN '03'
	ELSE '04'
END) AS TYPEDISCH, DATE_FORMAT(NOW(),'%Y%m%d%H%i%s') AS D_UPDATE, b.CID
FROM  mbase_data.gcoffice, mbase_data.cid_hn a, mbase_data.chronic_reg b
WHERE   b.REG_DATE > '2018.01.01'
AND b.CID = a.CID  AND b.IS_CANCEL = 0
 ;
