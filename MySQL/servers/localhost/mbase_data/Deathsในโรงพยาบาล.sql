SELECT c.CID, c.HN ,a.ADM_ID AS AN,g.FNAME, g.LNAME, DATE_FORMAT(a.ADM_DT,'%Y-%m-%d')AS ADM_DATE ,
 DATE_FORMAT(a.DSC_DT,'%Y-%m-%d')AS DSC_DATE ,f.DEATH_DATE,
a.DSC_STATUS AS STATUS, a.DSC_TYPE AS TYPE,a.WARD_NO,a.P_DIAG,f.CDEATH,f.CDEATH_A
FROM ipd_reg a,opd_visits e,deaths f,cid_hn c
INNER JOIN population g ON c.CID = g.CID 
WHERE a.DSC_DT BETWEEN '2016.10.01 00:01' AND '2017.09.30 23:59'
AND a.IS_CANCEL = 0
AND a.DSC_STATUS > 7
AND a.VISIT_ID = e.VISIT_ID
AND e.HN = c.HN
AND f.CID = c.CID 
GROUP BY f.CID ORDER BY a.WARD_NO 