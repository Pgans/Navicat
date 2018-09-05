<<<<<<< HEAD
SELECT
	b.DRUG_NAME AS drug_name,
	a.ALLERGY_NOTE AS symptom
FROM
	cid_drug_allergy a
INNER JOIN drugs b ON a.DRUG_ID = b.DRUG_ID
=======
SELECT
	b.DRUG_NAME AS drug_name,
	a.ALLERGY_NOTE AS symptom
FROM
	cid_drug_allergy a
INNER JOIN drugs b ON a.DRUG_ID = b.DRUG_ID
>>>>>>> 37961524e922a0d776d0b123b6e7b1d5d337148f
LIMIT 30