
SET @hcode = (
	SELECT
		hcode
	FROM
		hi.setup
	LIMIT 1);



SET @vn = '825981';

SELECT
	@hcode AS hcode,
	r.refer_no AS referback_no,
	concat(@hcode, '-3-', o.vn) AS referback_no_his,
	DATE_FORMAT(o.vstdttm, '%Y%m%d') AS refer_date,
	DATE_FORMAT(o.vstdttm, '%H%i') AS refer_time,
	p.pop_id AS cid,
	p.hn,
	p.pname,
	p.fname,
	p.lname,
	timestampdiff(YEAR, p.brthdate, o.vstdttm) AS age,
	p.addrpart,
	p.moopart,
	p.tmbpart,
	p.amppart,
	p.chwpart,
	o.pttype AS pttype_id,
	s.card_id AS pttypeno,
	dr.lcno AS doctor_id,
	r.rfrlct AS refer_hospcode,
	r.rfrcs AS cause_referout_id,
	rs.loads AS loads_id,
	rs.is_dr AS is_coodinate_doctor,
	rs.is_nr AS is_coodinate_nurse
FROM
	hi.ovst AS o
INNER JOIN hi.orfri AS r ON o.vn = r.vn
INNER JOIN hi.pt AS p ON o.hn = p.hn
INNER JOIN hi.pttype AS t ON o.pttype = t.pttype
LEFT JOIN hi.cln AS c ON o.cln = c.cln
LEFT JOIN hi.insure AS s ON o.pttype = s.pttype
AND o.hn = s.hn
LEFT JOIN hi.dct AS dr ON CASE length(o.dct)
WHEN 4 THEN
	substr(o.dct, 3, 2) = dr.dct
WHEN 5 THEN
	o.dct = dr.lcno
END
LEFT JOIN hi.referbackstatus AS rs ON r.rfrno = rs.rfrno
WHERE
	o.vn = @vn