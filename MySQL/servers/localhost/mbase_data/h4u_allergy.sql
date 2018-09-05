SELECT
	b.DRUG_NAME AS drug_name,
	a.ALLERGY_NOTE AS symptom
FROM
	cid_drug_allergy a
INNER JOIN drugs b ON a.DRUG_ID = b.DRUG_ID
LIMIT 30