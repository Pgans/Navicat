SELECT ADM_ID,UNIT_ID, cost_units.CU_NAME, COUNT( cost_units.CU_NAME) AS 'จำนวนผู้ป่วย'
FROM ipd_reg, cost_units
WHERE ipd_reg.WARD_NO = cost_units.UNIT_ID
AND ipd_reg.DSC_DT BETWEEN '20131001' AND '20140930'
AND ipd_reg.IS_CANCEL = 0
GROUP BY cost_units.CU_NAME

