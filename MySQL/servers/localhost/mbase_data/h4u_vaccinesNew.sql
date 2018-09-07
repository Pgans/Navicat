SELECT
    a.VISIT_ID as seq,
    DATE(a.REG_DATETIME) date_serv,
    TIME(a.REG_DATETIME)  time_serv,
    c.DRUG_THO as  vaccine_code,
		c.DRUG_NAME as vaccine_name
    FROM  opd_visits a
    INNER JOIN prescriptions b ON a.VISIT_ID = b.VISIT_ID  AND b.IS_CANCEL = 0
    INNER JOIN drugs_tho  c  ON b.DRUG_ID  = c.DRUG_ID
		AND c.DRUG_THO IN('010','041','042','043','DHB','DHB2','DHB3','101','021','031','044','051','061','071','085','MEAS')
		OR c.DRUG_THO BETWEEN 'JE1' AND 'JE3'
		OR c.DRUG_THO BETWEEN 'OPV1' AND 'OPV5'
		OR c.DRUG_THO BETWEEN 'DTP1' AND 'DTP5'
		OR c.DRUG_THO BETWEEN 'TT1' AND 'TT5'
    WHERE a.IS_CANCEL = 0
		AND c.DRUG_ID <> ' '
    AND a.HN  = '043986'