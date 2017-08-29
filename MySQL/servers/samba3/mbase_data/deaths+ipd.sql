SELECT
	`deaths`.`CID` AS `CID`,
	`cid_hn`.`HN` AS `HN`,
	`ipd_reg`.`ADM_ID` AS `AN`,
	date_format(
		`ipd_reg`.`ADM_DT`,
		'%Y-%m-%d'
	) AS `add_date`,
	date_format(
		`ipd_reg`.`DSC_DT`,
		'%Y-%m-%d'
	) AS `dsc_date`,
	`deaths`.`DEATH_DATE` AS `deathdate`,
	`population`.`FNAME`,
	`population`.`LNAME`,
	(
		CASE
		WHEN (`population`.`SEX` = 1) THEN
			'ชาย'
		WHEN (`population`.`SEX` = 2) THEN
			'หญิง'
		END
	) AS `เพศ`,
	floor(
		(
			(
				to_days(now()) - to_days(`population`.`BIRTHDATE`)
			) / 365.25
		)
	) AS `age`,
	`service_units`.`UNIT_ID` AS `UNIT_ID`,
	(
		CASE
		WHEN (`ipd_reg`.`DSC_STATUS` = '8') THEN
			'Dead Stillbirth'
		WHEN (`ipd_reg`.`DSC_STATUS` = '9') THEN
			'Dead'
		END
	) AS `สาเหตุ`,deaths.CDEATH,deaths.CDEATH_A,deaths.CDEATH_B,deaths.CDEATH_C

FROM
	(
		(
			(
				(
					`service_units`
					JOIN `population`
				)
				JOIN `opd_visits`
			)
			JOIN `ipd_reg`
		)
		JOIN (
			`cid_hn`
			JOIN `deaths` ON (
				(
					(
						`deaths`.`CID` = `cid_hn`.`CID`
					)
					AND (`deaths`.`IS_HOSP` = 1)
				)
			)
		)
	)
WHERE
	(
		(
			`cid_hn`.`HN` = `opd_visits`.`HN`
		)
		AND (
			`population`.`CID` = `deaths`.`CID`
		)
		AND (
			`opd_visits`.`VISIT_ID` = `ipd_reg`.`VISIT_ID`
		)
		AND (
			`ipd_reg`.`WARD_NO` = `service_units`.`UNIT_ID`
		)
		AND (
			(
				`ipd_reg`.`DSC_TYPE` IN ('6', '7')
			)
			OR (`ipd_reg`.`DSC_STATUS` = '9')
		)
		AND (
			`deaths`.`DEATH_DATE` BETWEEN '20151001' AND '20160930'
		)
	)