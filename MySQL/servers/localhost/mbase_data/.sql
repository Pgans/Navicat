select a.ivt_id, b.ivt_name, sum(a.quantity) AS amount, d.uunit_name, avg(a.pack_price) AS avg_price 
from order_details a, inventory b, invoices c, ivt_units d 
where c.ivs_date between '2016.10.01' and '2017.09.30' 
and a.ivs_id = c.ivs_id 
and a.ivt_id = b.ivt_id 
and b.ivc_id = '04' and c.exp_id = '013' 
and a.uunit_id = d.uunit_id 
group by a.ivt_id order by b.ivt_name

SELECT 
FROM order_de
WHERE
