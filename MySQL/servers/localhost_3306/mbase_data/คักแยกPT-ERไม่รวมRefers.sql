SELECT a.PT_STATES, COUNT(a.PT_STATES)
FROM opd_visits a
WHERE a.UNIT_REG = '11'
#AND a.VISIT_ID = b.VISIT_ID
AND a.REG_DATETIME BETWEEN '20160801' AND '20160831'
AND a.IS_CANCEL =0
AND a.VISIT_ID NOT IN (SELECT VISIT_ID FROM refers)
GROUP BY a.PT_STATES ;
