SELECT
	a.ICD10 AS icd_code,
	CASE
WHEN a.ICD10 BETWEEN 'E10'
AND 'E14' THEN
	'โรคเบาหวาน'
WHEN a.ICD10 BETWEEN 'I10'
AND 'I15' THEN
	'โรคความดันโลหิตสูง'
WHEN a.ICD10 BETWEEN 'I20'
AND 'I25' THEN
	'โรคหัวใจขาดเลือด'
WHEN a.ICD10 BETWEEN 'I60'
AND 'I64' THEN
	'โรคหลอดเลือดสมอง'
WHEN a.ICD10 BETWEEN 'J41'
AND 'J45' THEN
	'โรคเรื้อรังทางเดินหายใจส่วนล่าง'
WHEN a.ICD10 = 'N18' THEN
	'โรคไตเรื้อรัง'
ELSE
	'ไม่ระบุ'
END AS icd_name,
 a.DX_DATE AS start_date
FROM
	chronic_reg a
WHERE
	a.DSC_DATE = 0
AND a.IS_CANCEL = 0
AND a.REG_DATE > '2018-04-01'
LIMIT 5000