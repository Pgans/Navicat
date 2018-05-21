SELECT
 CONCAT(gcoffice.offid,'-3-',a.REFER_ID) refer_no
,i.ADM_ID an
,v.HN hn
,'' order_no
,pr.DRUG_ID item_no
,d.ATTENTION drugusage_text
, i.ADM_DT datetime_admit
,'' datetime_rx
, CONCAT('01',v.UNIT_REG,i.WARD_NO) AS wardstay
,i.WARD_NO  ward_code
,s.UNIT_NAME ward_name
,'' typedrug
,d.DIDSTD  didstd
,d.DRUG_NAME DNAME
,'' datestart
,'' datefinish
,'' amount
,'' unit
,d.PACKAGE  unit_packing
, d.PRICE drugprice
,'' drugcost
, a.STAFF_ID provider
,p.FNAME provider_name
,ss.LICENCE provider_licenseno
,ss.CID provider_cid
FROM  gcoffice ,staff ss, refers a
INNER JOIN ipd_reg i ON a.VISIT_ID = i.VISIT_ID AND i.IS_CANCEL =0 
INNER JOIN opd_visits v ON  a.VISIT_ID = v.VISIT_ID AND v.IS_CANCEL = 0
INNER JOIN cid_hn c ON c.HN = v.HN
INNER JOIN population p ON c.CID = p.CID
INNER JOIN prescriptions pr ON a.VISIT_ID = pr.VISIT_ID  AND pr.IS_CANCEL=0
INNER JOIN drugs d ON pr.DRUG_ID = d.DRUG_ID 
INNER JOIN service_units s ON s.UNIT_ID = i.WARD_NO
WHERE a.RF_DT > '2018.01.01'
AND a.STAFF_ID = ss.STAFF_ID
