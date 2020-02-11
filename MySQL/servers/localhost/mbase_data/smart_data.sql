SELECT  (select hcode from setup limit 1) as hcode,
        concat((select hcode from setup limit 1),'-1-',r.rfrno) as refer_no, 
        DATE_FORMAT(r.vstdate,'%Y-%m-%d') as refer_date, 
         time(r.vsttime*100) as refer_time, 
         if(o.an != 0, '2' , if(sunstr(o.cln,1,1)='2','3','1')) as station_id, 
         o.cln as location_id, 
         p.pop_id as cid, 
         o.an as an,
         p.hn, 
         p.hn as pid, 
         p.pname, 
         p.fname, 
         p.lname, 
         concat(timestampdiff(year,p.brthdate,o.vstdttm),'-',mod(timestampdiff(month,p.brthdate,o.vstdttm),12),'-00') as age, 
         p.addrpart, 
         p.moopart, 
         p.tmbpart, 
         p.amppart, 
         p.chwpart, 
         o.pttype as pttype_id, 
         t.namepttype as pttype_name,
         s.card_id as pttypeno, 
         s.hospmain, 
         s.hospsub, 
         if(ta.trauma = 'T','1','2')as typept_id, 
         if(ta.trauma = 'T','Trauma','Non Trauma') as typept_name,
         ta.triage as strength_id, 
        (case ta.triage 
                    when 1 then 'Resucitate'
                    when 2 then 'Emergency'
                    when 3 then 'Urgency'
                    when 4 then 'Semi Urgency'
                    when 5 then 'Non Urgency'
                    else '' end 
                    ) as strength_name,
         dr.lcno as doctor_id, 
         concat(dr.fname ,' ',dr.lname) as doctor_name,
         r.rfrlct as refer_hospcode, 
         r.rfrcs as cause_referout_id, 
         '' as cause_referout_name,
         DATE_ADD(r.vstdate, INTERVAL 1 year) as expire_date,
         rs.loads as loads_id, 
         lo.nameloads as loads_name,
         '' as refer_type,
         '' as refer_type_name,
         '' as refer_his_no,
         '' as refer_station_id,
         '' as refer_station_name,
         '' as serviceplan_id,
         '' as serviceplan_name
         from 
         hi.ovst as o 
         inner join hi.orfro as r on o.vn=r.vn  
         inner join hi.pt as p on o.hn=p.hn 
         inner join hi.pttype as t on o.pttype = t.pttype 
         left join hi.cln as c on o.cln=c.cln 
         left join hi.idpm as w on r.ward=w.idpm 
         left join hi.insure as s on o.pttype = s.pttype and o.hn=s.hn 
         left join hi.ovstdx as x on o.vn=x.vn and cnt=1 
         left join hi.dct as dr on (case length(o.dct) when 4 then substr(o.dct,3,2) = dr.dct when 5 then o.dct=dr.lcno end) 
         left join hi.optriage as ta on o.vn=ta.vn 
         left join hi.referoutstatus as rs on r.rfrno= rs.rfrno 
         left join hi.l_loads as lo on rs.loads = lo.codeloads
         where o.hn = '${hn}' and r.vn = '${vn}'