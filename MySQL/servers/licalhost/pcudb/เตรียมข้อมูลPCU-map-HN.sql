insert into mathhn(cid,pid,d_update) select person.idcard,person.pid,Now() from person where  idcard != '0000000000000' AND pcucodeperson = '99809' AND person.dischargetype = '9'

SELECT COUNT(cid) FROM  mathhn //นับจำนวนpersonทีคัดเลือกมาแล้ว

update mathhn set hn = (select cid_hn.hn from cid_hn where cid_hn.cid = mathhn.cid );

update mathhn set typearea_pcu = (select person.typelive from person where person.idcard = mathhn.cid and pcucodeperson = '99809');

update mathhn set typearea_hosp = (select h.typearea from hi.pt as h where h.pop_id = cid LIMIT 1);