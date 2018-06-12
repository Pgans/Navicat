
SET @hcode = (
	SELECT
		hcode
	FROM
		hi.setup
	LIMIT 1
);


SET @vn = '188714';

SELECT
	@hcode AS hcode,
	concat(@hcode, '-1-', r.rfrno) AS refer_no,
	'2' AS refertype_id,
	date_format(r.vstdate, '%Y%m%d') AS refer_date,
	time_format(r.vsttime, '%H:%i') AS refer_time,

IF (
	o.an != 0,
	'2',

IF (o.cln = '20100', '3', '1')
) AS station_id,
 o.cln AS location_id,
 p.pop_id AS cid,
 p.hn,
 p.hn AS pid,
 o.an,
 o.vn,
 p.pname,
 p.fname,
 p.lname,
 concat(
	timestampdiff(YEAR, p.brthdate, o.vstdttm),
	'-',
	MOD (
		timestampdiff(MONTH, p.brthdate, o.vstdttm),
		12
	),
	'-00'
) AS age,
 p.addrpart,
 p.moopart,
 p.tmbpart,
 p.amppart,
 p.chwpart,
 o.pttype AS pttype_id,
 t.namepttype AS pttype_name,
 s.card_id AS pttypeno,
 s.hospmain,
 s.hospsub,

IF (ta.trauma = 'T', '1', '2') AS typept_id,
 ta.triage AS strength_id,
 dr.lcno AS doctor_id,
 r.rfrlct AS refer_hospcode,
 r.rfrcs AS cause_referout_id,
 rs.loads AS loads_id,
 rs.is_dr AS is_coodinate_doctor,
 rs.is_nr AS is_coodinate_nurse,
 r.rfrno AS refer_station_id,
 dxt.diagtext AS diag_text
FROM
	hi.orfro AS r
INNER JOIN hi.ovst AS o ON o.vn = r.vn
AND o.vn =@vn
INNER JOIN hi.pt AS p ON o.hn = p.hn
INNER JOIN hi.pttype AS t ON o.pttype = t.pttype
LEFT JOIN hi.cln AS c ON o.cln = c.cln
LEFT JOIN hi.idpm AS w ON r.ward = w.idpm
LEFT JOIN hi.insure AS s ON o.pttype = s.pttype
AND o.hn = s.hn
LEFT JOIN hi.ovstdx AS x ON o.vn = x.vn
AND cnt = 1
LEFT JOIN hi.dct AS dr ON CASE length(o.dct)
WHEN 4 THEN
	substr(o.dct, 3, 2) = dr.dct
WHEN 5 THEN
	o.dct = dr.lcno
END
LEFT JOIN hi.optriage AS ta ON o.vn = ta.vn
LEFT JOIN hi.referoutstatus AS rs ON r.rfrno = rs.rfrno
LEFT JOIN hi.visitdiagtext AS dxt ON o.vn = dxt.vn vn Version 1.0 2018 - 05 - 17 09 : 37 : 11 0 MySQL