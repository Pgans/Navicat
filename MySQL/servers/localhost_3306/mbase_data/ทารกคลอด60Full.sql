SELECT b.HN, a.ADM_ID , DATE_FORMAT(a.ADM_DT,'%Y-%m-%d')AS REGDATE , DATE_FORMAT(a.DSC_DT,'%Y-%m-%d')AS DSC ,
a.DSC_STATUS, a.DSC_TYPE, a.WARD_NO, a.DSC_DR,a.ADM_DR, a.P_DIAG
FROM ipd_reg a  
LEFT JOIN opd_visits b ON a.VISIT_ID = b.VISIT_ID AND b.IS_CANCEL = 0
WHERE  a.ADM_DT BETWEEN '20170101' AND '20170131'
AND a.WARD_NO = '22'
AND (LEFT(P_DIAG,6) = '[Z380]' OR LEFT(P_DIAG,5) = '[P599')
GROUP BY b.HN