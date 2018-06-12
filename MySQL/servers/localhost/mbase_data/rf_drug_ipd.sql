SET @an ='077448';
SELECT DISTINCT
gcoffice.offid AS hcode
,CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
, i.ADM_ID an
,v.HN  hn
,'' order_no
,'' item_no
,r.ROUTE_THAI drugusage_text
,i.ADM_DT datetime_admit
,'' datetime_rx
,CONCAT('01',v.UNIT_REG,i.WARD_NO) wardstay
,i.WARD_NO ward_code
,su.UNIT_NAME  ward_name
,'' typedrug
, dr.DIDSTD didstd
,dr.DRUG_NAME dname
,'' datestart
,'' datefinish
,ps.RX_AMOUNT amount
,dr.UUNIT_ID  unit
,d.UUNIT_NAME unit_packing
,dp.price_1 drugprice
,dr.PRICE drugcost
,a.STAFF_ID provider
,CONCAT(TRIM(p.FNAME),' ',TRIM(p.LNAME) ) provider_name
,s.LICENCE provider_licenseno
,s.CID provider_cid
FROM gcoffice, ipd_reg i
INNER  JOIN refers a ON a.VISIT_ID = i.VISIT_ID AND i.IS_CANCEL = 0
INNER JOIN staff s ON s.STAFF_ID = a.STAFF_ID
LEFT JOIN population p ON p.CID = s.CID
INNER JOIN cid_hn c ON  c.CID = p.CID
LEFT JOIN opd_visits v ON v.HN = c.HN AND v.IS_CANCEL = 0
LEFT  JOIN prescriptions ps  ON i.VISIT_ID = ps.VISIT_ID 
LEFT  JOIN drugs dr ON dr.DRUG_ID = ps.DRUG_ID
LEFT OUTER JOIN usage_units d ON dr.PACKAGE = d.UUNIT_ID
LEFT JOIN service_units su ON i.WARD_NO = su.UNIT_ID
INNER JOIN routes r ON r.ROUTE_ID = ps.ROUTE_ID
LEFT  JOIN drug_price dp ON dp.drug_id = dr.DRUG_ID 
WHERE   
i.ADM_ID =@an
AND a.RF_TYPE = '2'
and i.IS_CANCEL = 0
GROUP BY dname