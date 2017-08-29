CREATE OR REPLACE VIEW `thaicancerbase_his` AS
SELECT
	'' AS `PatienID`,
	`b`.`HN` AS `hn_code`,
	(
		CASE
		WHEN (
			(
				(
					(
						to_days(now()) - to_days(`a`.`BIRTHDATE`)
					) / 365.25
				) < '15'
			)
			AND (`a`.`SEX` = 1)
		) THEN
			4
		WHEN (
			(
				(
					(
						to_days(now()) - to_days(`a`.`BIRTHDATE`)
					) / 365.25
				) >= '15'
			)
			AND (`a`.`SEX` = 1)
		) THEN
			1
		WHEN (
			(
				(
					(
						to_days(now()) - to_days(`a`.`BIRTHDATE`)
					) / 365.25
				) < '15'
			)
			AND (`a`.`SEX` = 2)
		) THEN
			2
		WHEN (
			(
				(
					(
						to_days(now()) - to_days(`a`.`BIRTHDATE`)
					) / 365.25
				) >= '15'
			)
			AND (`a`.`SEX` = 2)
			AND (`a`.`MARRIAGE` = 1)
		) THEN
			3
		WHEN (
			(
				(
					(
						to_days(now()) - to_days(`a`.`BIRTHDATE`)
					) / 365.25
				) >= '15'
			)
			AND (`a`.`SEX` = 2)
			AND (`a`.`MARRIAGE` = 2)
		) THEN
			2
		ELSE
			6
		END
	) AS `title_code`,
	`a`.`FNAME` AS fname,
	`a`.`LNAME` AS lname,
	`a`.`CID` AS `PID`,
	(
		CASE
		WHEN (`a`.`SEX` = 1) THEN
			1
		WHEN (`a`.`SEX` = 2) THEN
			2
		ELSE
			9
		END
	) AS `sex_code`,
	date_format(`a`.`BIRTHDATE`, '%Y%m%d') AS `birthdate`,
	`a`.`MARRIAGE` AS `marry_status`,
	(
		CASE
		WHEN (`a`.`NATN_ID` = '99') THEN
			'1'
		WHEN (`a`.`NATN_ID` = '44') THEN
			'2'
		WHEN (`a`.`NATN_ID` = '56') THEN
			'3'
		ELSE
			'8'
		END
	) AS `nationality`,
	(
		CASE
		WHEN (`a`.`NATN_ID` = '99') THEN
			'1'
		WHEN (`a`.`NATN_ID` = '44') THEN
			'2'
		WHEN (`a`.`NATN_ID` = '56') THEN
			'3'
		ELSE
			'8'
		END
	) AS `citizenship`,
	`a`.`RELIGION` AS `religion`,
	`a`.`HOME_ADR` AS `Addr`,
	right (`a`.`TOWN_ID`, 2) AS `Vill`,
	LEFT (`a`.`TOWN_ID`, 6) AS `AddCode`,
	`a`.`RL_PHONE` AS `Tel`,
	date_format(
		`a`.`MOD_DATE`,
		'%Y%m%d%H%i%S'
	) AS `last_update`
FROM
	(
		`population` `a`
		JOIN `cid_hn` `b`
	)
WHERE
	(`a`.`CID` = `b`.`CID`)