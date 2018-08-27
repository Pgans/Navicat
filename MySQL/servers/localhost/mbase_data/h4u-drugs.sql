   SELECT   
     a.VISIT_ID as "seq",
    DATE(a.REG_DATETIME) as "date_serv",
     TIME(a.reg_datetime) as time_serv, CONCAT(c.DRUG_NAME,' ',CONVERT(c.STRENGTH,INT),' ',  g.strength_name, ' ','(' ,h.DFORM_NAME,')') as drug_name, 
      b.rx_amount AS qty, 
   d.UUNIT_THAI  as unit,
 CONCAT(e.ROUTE_THAI,' ',CONVERT(b.RX_DOSE,INT), ' ',  d.UUNIT_THAI,' ',f.FRQ_THAI )  as  usage_line1

FROM  gcoffice  , hospitals ,opd_visits  a 
INNER JOIN  prescriptions b ON a.VISIT_ID = b.VISIT_ID AND a.IS_CANCEL = 0 AND  b.IS_CANCEL = 0 
LEFT JOIN drugs c ON  b.DRUG_ID  = c.DRUG_ID
LEFT JOIN  usage_units d ON  c.UUNIT_ID = d.UUNIT_ID
LEFT  JOIN  routes e  ON  b.ROUTE_ID  = e.ROUTE_ID
LEFT JOIN frequency f on b.FRQ_ID = f.FRQ_ID
LEFT JOIN strength_units g on c.STRENGTH_UNIT = g.strength_unit
LEFT JOIN dosage_forms h ON c.DFORM_ID = h.DFORM_ID
WHERE a.REG_DATETIME BETWEEN '2018.01.01' AND '2018.01.02' 
ORDER BY "seq"
LIMIT 500