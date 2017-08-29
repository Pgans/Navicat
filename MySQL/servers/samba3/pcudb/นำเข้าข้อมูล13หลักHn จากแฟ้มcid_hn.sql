insert into mathhn(cid,hn ) select mbase_data.cid_hn.CID, mbase_data.cid_hn.HN
from mbase_data.cid_hn where mbase_data.cid_hn.cid != '0000000000000' 

update mathhn set pid = (select pcudb.person.pid 
from pcudb.person 
where pcudb.person.cid = mathhn.cid
and pcudb.person.discharge='9');

update mathhn set typearea_pcu = (select pcudb.person.typearea from pcudb.person where pcudb.person.cid = mathhn.cid and hospcode = '99809');
insert into mathhn(cid,pid,typearea_pcu,d_update) select j.idcard,j.pid,j.typelive,NOW() from jhcisdb.person as j where pcucodeperson = '10957' and idcard not in (select cid from mathhn) ;
update mathhn set hn = (select h.hn from hi.pt as h where h.pop_id = cid LIMIT 1);
update mathhn set typearea_hosp = (select h.typearea from hi.pt as h where h.pop_id = cid LIMIT 1);