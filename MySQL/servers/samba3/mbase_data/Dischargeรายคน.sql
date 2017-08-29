SELECT ipd.ADM_ID AS AN, o.hn AS HN,c.CID,p.FNAME,p.LNAME,if(p.SEX= 1,'ชาย' ,'หญิง') as SEX,
DATE_FORMAT(ipd.ADM_DT,'%d-%m-%Y') as ADMITT ,DATE_FORMAT(ipd.DSC_DT,'%d-%m-%Y') AS DISCHARGE,
CASE ipd.WARD_NO
	WHEN 22 THEN 'ห้องคลอด'
	WHEN 23 THEN 'ผู้ป่วยใน'
	WHEN 38 THEN 'ผู้ป่วยในชาย'
	WHEN 39 THEN 'ผู้ป่วยในหญิง'
END AS WARD
FROM ipd_reg AS ipd,opd_visits AS o
INNER JOIN cid_hn as c ON o.HN=c.HN
INNER JOIN population as p ON c.CID=p.CID
WHERE ipd.VISIT_ID = o.visit_id AND ipd.DSC_DT BETWEEN '2014-07-01' AND '2014-07-30'
;
