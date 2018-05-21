
SELECT DISTINCT
gcoffice.offid AS hcode
,CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
,'' form_name
,DATE_FORMAT(l.COLLECTED_DT,'%Y%m%d') receive_date
,DATE_FORMAT(l.COLLECTED_DT,'%H%m') receive_time
,v.UNIT_REG department
,a.VISIT_ID vn
,i.ADM_ID  an
,DATE_FORMAT(l.LREQ_DT,'%Y%m%d') order_date
,DATE_FORMAT(l.LREQ_DT,'%H%m') order_time
,l.LREQ_DT datetime_invest
,l.LAB_ID inverstcode
,la.LAB_SNAME investname
,l.LRPT_DT datetime_report
,l.LAB_RESULT investvalue
,'' investunit
,l.LAB_RESULT investresult
,'' lab_items_sub_group_name
,l.TECH_ID provider
,CONCAT( trim(p.FNAME) ,'  ',trim(p.LNAME)) provider_name
,s.LICENCE provider_licenseno
,s.CID provider_cid
,'' confirm
,'' invest_type
,'' invest_local_code
,'' normal_value
FROM  gcoffice , refers a
INNER JOIN lab_requests l ON a.VISIT_ID = l.VISIT_ID AND l.IS_CANCEL = 0
LEFT  JOIN ipd_reg i ON a.VISIT_ID= i.VISIT_ID AND i.IS_CANCEL = 0
INNER JOIN lab_lists la ON l.LAB_ID = la.LAB_ID 
LEFT  JOIN staff s ON s.STAFF_ID = l.TECH_ID 
LEFT  JOIN population p ON s.CID = p.CID 
LEFT  JOIN opd_visits v ON v.VISIT_ID = l.VISIT_ID AND v.IS_CANCEL = 0
WHERE a.RF_DT > '2018.01.01'
AND a.RF_TYPE = 2
LIMIT 50