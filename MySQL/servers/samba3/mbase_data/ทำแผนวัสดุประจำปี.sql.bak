SELECT a.ivt_id, b.ivt_name, sum(a.quantity) AS amount, d.uunit_name, FORMAT(avg(a.pack_price),2) AS avg_price, FORMAT(SUM(a.QUANTITY) * avg(a.pack_price ),2) AS total

 FROM order_details a, inventory b, invoices c, ivt_units d 
 WHERE c.ivs_date BETWEEN '2016.10.01' and '2017.09.30' 
and a.ivs_id = c.ivs_id and a.ivt_id = b.ivt_id and b.ivc_id = '04' and c.exp_id = '013' 
and a.uunit_id = d.uunit_id GROUP BY a.ivt_id ORDER BY b.ivt_name

