SELECT DISTINCT
gcoffice.offid AS hcode
,CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
,b.UNIT_REG department
,DATE_FORMAT(c.XREQ_DATETIME,'%Y%m%d') report_date
,DATE_FORMAT(c.XREQ_DATETIME,'%H%m') report_time
,d.XL_NAME xray_items_name
,'' xray_type_name
,a.VISIT_ID vn
,i.ADM_ID an
,c.XREQ_NO xn
,b.HN hn
,DATE_FORMAT(c.XREQ_DATETIME,'%Y%m%d') datetime_invest
,d.XL_ID inverstcode
,'' investname
,d.XL_ID position_code
,d.XL_NAME position_name
,DATE_FORMAT(c.XRPT_DATETIME,'%Y%m%d') datetime_report
,''investvalue
,'' investunit
,'' investresult
,''invest_type
,'' invest_local_code
,'' normal_value
,c.STAFF_ID provider
,'' provider_name
,s.LICENCE provider_licenseno
,s.CID provider_cid
,CONCAT(trim(p.FNAME),' ',trim(p.LNAME)) request_doctor_name
,'' confirm
,'' room_name
FROM gcoffice , refers a
INNER JOIN opd_visits b ON a.VISIT_ID = b.VISIT_ID AND b.IS_CANCEL = 0
INNER JOIN xray_requests c ON c.VISIT_ID = b.VISIT_ID AND c.IS_CANCEL = 0
INNER JOIN xray_lists d ON d.XL_ID = c.XL_ID 
LEFT JOIN ipd_reg i ON i.VISIT_ID = b.VISIT_ID AND i.IS_CANCEL = 0
LEFT JOIN staff s ON s.STAFF_ID = c.STAFF_ID
LEFT JOIN population p ON p.CID = s.CID
WHERE a.RF_DT > '2018.01.01'
GROUP BY d.XL_NAME
LIMIT 20