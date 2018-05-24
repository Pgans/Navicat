-- */select a.ivt_id, b.ivt_name, sum(a.quantity) AS amount, d.uunit_name, avg(a.pack_price) AS avg_price
--  from order_details a, inventory b, invoices c, ivt_units d 
-- where c.ivs_date between '2016.10.01' and '2017.09.30' 
-- and a.ivs_id = c.ivs_id and a.ivt_id = b.ivt_id and b.ivc_id = '04' and c.exp_id = '013' 
-- and a.uunit_id = d.uunit_id group by a.ivt_id order by b.ivt_name*/
-- 
SELECT  c.IVS_DATE,a.IVT_ID, b.IVT_NAME, a.QUANTITY, d.UUNIT_NAME, a.PACK_PRICE
FROM order_details  a, inventory b, invoices c, ivt_units d
WHERE  c.IVS_DATE BETWEEN  '2016.10.01' AND  '2017.09.30'
AND a.IVS_ID = c.IVS_ID AND a.IVT_ID  = b.IVT_ID 
AND c.EXP_ID BETWEEN  '013' AND '025'
AND a.UUNIT_ID =d.UUNIT_ID
GROUP BY a.IVT_ID ORDER BY c.IVS_DATE  ;
 
