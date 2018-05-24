SET @vn = '0001907500';
SET @vni = (select   visit_id FROM ipd_reg limit 1);
SELECT DISTINCT
gcoffice.offid AS hcode
,CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
, a.VISIT_ID vn
, c.HN hn
,'' order_no
,'' item_no
,'' rxdate
,'' rxtime
,date_format(v.REG_DATETIME,'%y%m%d') date_serv
,CONCAT('01', v.UNIT_REG, a.UNIT_ID)  clinic
,dr.DIDSTD didstd
,dr.DRUG_NAME dname
,b.RX_AMOUNT amount
,dr.UUNIT_ID unit
,d.UUNIT_NAME unit_packing
,dp.price_1 drugprice
,dr.PRICE drugcost
,a.STAFF_ID  provider
,CONCAT(TRIM(p.FNAME),' ',TRIM(p.LNAME) ) provider_name
,s. LICENCE provider_licenseno
,s.CID provider_cid
,r.ROUTE_THAI drugusage_text
FROM gcoffice, refers a
INNER JOIN staff s ON a.STAFF_ID  = s.STAFF_ID
INNER JOIN population p ON p.CID = s.CID
INNER JOIN cid_hn c ON c.CID = p.CID
INNER  JOIN opd_visits v ON a.VISIT_ID = v.VISIT_ID AND  v.IS_CANCEL = 0
INNER JOIN prescriptions b ON v.visit_id = b.visit_id  AND b.IS_CANCEL = 0
INNER JOIN drugs  dr ON b.drug_id = dr.drug_id 
LEFT OUTER JOIN usage_units d ON dr.PACKAGE = d.UUNIT_ID
INNER JOIN service_units sv ON sv.UNIT_ID = a.UNIT_ID
INNER JOIN routes r ON r.ROUTE_ID = b.ROUTE_ID
INNER JOIN drug_price dp ON dp.drug_id = dr.DRUG_ID 
WHERE a.VISIT_ID =@vn
AND v.VISIT_ID NOT IN (@vni)

