SELECT VISIT_ID, ADM_ID , ADM_DT , DSC_DT,DSC_STATUS,DSC_TYPE, WARD_NO, DSC_DR,ADM_DR, P_DIAG
FROM ipd_reg
WHERE DSC_DT > '20170201'
AND WARD_NO = '22'
AND IS_CANCEL = 0
AND LEFT(P_DIAG,6) = '[Z380]'
GROUP BY ADM_ID  ORDER BY ADM_ID
