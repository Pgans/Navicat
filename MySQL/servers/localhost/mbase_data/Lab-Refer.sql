SELECT
      DATE_FORMAT(date(a.LREQ_DT),'%Y%m%d') as date_serv,DATE_FORMAT(time(a.LREQ_DT),'%h:%i:%s') as time_serv
      ,b.LAB_GROUP as labgroup,b.LAB_NAME as lab_name,
       
			 CASE
      WHEN CAST(a.LAB_RESULT AS DECIMAL(10,2)) > 0 THEN CAST(a.LAB_RESULT AS DECIMAL(10,2)) 
      WHEN LOCATE('=', a.LAB_RESULT) > 0 THEN CAST(SUBSTR(a.LAB_RESULT, LOCATE('=', a.LAB_RESULT)+1, 12) AS DECIMAL(10, 2))
      END as lab_result
, '' as unit,  b.normal_val as standard_result
      FROM lab_requests a
      INNER JOIN lab_lists b ON a.LAB_ID = b.LAB_ID AND b.IS_CANCEL =0
      WHERE a.VISIT_ID ='0000084844'



