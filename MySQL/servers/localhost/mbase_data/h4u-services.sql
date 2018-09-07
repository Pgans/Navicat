SELECT a.VISIT_ID as seq, DATE(a.REG_DATETIME) as date_serv, TIME(a.REG_DATETIME)as time_serv,
      b.UNIT_NAME as department
      FROM opd_visits as a 
      INNER JOIN service_units b ON a.UNIT_REG = b.UNIT_ID
      WHERE a.is_cancel = 0
      AND DATE(a.REG_DATETIME) > '2017.10.01'
      AND a.HN ='015006'