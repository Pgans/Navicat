
SELECT DISTINCT
gcoffice.offid AS hcode
,CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
,'' form_name
,DATE_FORMAT(l.LREQ_DT,'%Y%m%d') receive_date
,DATE_FORMAT(l.LREQ_DT,'%H%m') receive_time
,'' department
,a.VISIT_ID vn
,i.ADM_ID  an
,DATE_FORMAT(l.LREQ_DT,'%Y%m%d') order_date
,DATE_FORMAT(l.LREQ_DT,'%H%m') order_time
,'' datetime_invest
,'' inverstcode
,'' investname
,'' datetime_report
,'' investvalue
,'' investunit
,'' investresult
,'' lab_items_sub_group_name
,'' provider
,'' provider_name
,'' provider_licenseno
,'' provider_cid
,'' confirm
,'' invest_type
,'' invest_local_code
,'' normal_value
FROM  gcoffice , refers a
INNER JOIN lab_requests l ON a.VISIT_ID = l.VISIT_ID AND l.IS_CANCEL = 0
LEFT  JOIN ipd_reg i ON a.VISIT_ID= i.VISIT_ID AND i.IS_CANCEL = 0
WHERE a.RF_DT > '2018.01.01'
AND a.RF_TYPE = 2
LIMIT 8