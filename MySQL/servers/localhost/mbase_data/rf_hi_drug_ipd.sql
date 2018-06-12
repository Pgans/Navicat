
SET @hcode = (	SELECT hcode FROM 	hi.setup LIMIT 1);
SET @an = '60000123';
SELECT
	concat(@hcode, '-1-', r.rfrno) AS refer_no,
	i.an,
	i.hn,
	pc.prscno AS order_no,
	pd.meditem AS item_no,
	concat(
		date_format(i.rgtdate, '%Y%m%d'),
		TIME_FORMAT(i.rgttime, '%H%i%s')
	) AS datetime_admit,
	concat(
		date_format(pc.prscdate, '%Y%m%d'),
		TIME_FORMAT(pc.prsctime, '%H%i%s')
	) AS datetime_rx,

IF (
	idpm.op56 = '',
	'10100',
	idpm.op56
) AS wardstay,
 idpm.idpm AS ward_code,
 idpm.nameidpm AS ward_name,
 '1' AS typedrug,
 m.stdcode AS didstd,
 cast(
	m. NAME AS CHAR (255) CHARACTER
	SET utf8
) AS dname,
 DATE_FORMAT(min(pc.prscdate), '%Y%m%d') AS datestart,
 date_format(max(pc.prscdate), '%Y%m%d') AS datefinish,
 SUM(pd.qty) AS amount,
 m.medunit AS unit,
 '1' AS unit_packing,
 m.price AS drugprice,
 m.cost AS drugcost,
 dct.cid AS provider,
 concat(dct.fname, ' ', dct.lname) AS provider_name,
 dct.lcno AS provider_licenseno,
 dct.cid AS provider_cid,

IF (
	pd.xdoseno > 0,
	(SELECT	xdose.doseprn		FROM hi.xdose WHERE		xdose.xdoseno = pd.xdoseno	),
	(	SELECT		concat(	medusage.doseprn1,			' ',		medusage.doseprn2	)	
FROM		hi.medusage
WHERE
			medusage.dosecode = pd.xdoseno
	)
) AS drugusage_text
FROM
	hi.ipt i
INNER JOIN hi.iptdx ix ON i.an = ix.an
INNER JOIN hi.orfro r ON i.an = r.an
LEFT OUTER JOIN hi.idpm ON i.ward = idpm.idpm
INNER JOIN hi.prsc pc ON i.an = pc.an
INNER JOIN hi.prscdt pd ON pc.prscno = pd.prscno
INNER JOIN hi.meditem m ON pd.meditem = m.meditem
LEFT OUTER JOIN hi.dct ON (
	CASE
	WHEN LENGTH(ix.dct) = 5 THEN
		dct.lcno = ix.dct
	WHEN LENGTH(ix.dct) = 4 THEN
		dct.dct = substr(ix.dct, 3, 2)
	WHEN LENGTH(ix.dct) = 2 THEN
		dct.dct = ix.dct
	END
)
WHERE
	i.an = @an