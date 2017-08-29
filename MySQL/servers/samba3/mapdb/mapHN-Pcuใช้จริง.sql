1. INSERT INTO mathhn(cid,pid,d_update,dischargetype) SELECT person.idcard,person.pid,Now(),person.dischargetype FROM person WHERE  pcucodeperson = '99809';

#DELETE FROM person WHERE hospcode != '10953';
#2. DELETE FROM mathhn WHERE cid IN(SELECT cid FROM deaths);
#3. SELECT * FROM mathhn;

4. UPDATE mathhn SET hn = (SELECT cid_hn.hn FROM cid_hn WHERE cid_hn.cid = mathhn.cid );

5. UPDATE mathhn SET  typearea_pcu = (SELECT person.typelive FROM person WHERE person.idcard = mathhn.cid AND  pcucodeperson = '99809');

#6. UPDATE mathhn SET hn = pid WHERE hn is null;

7. UPDATE mathhn SET datedeath = (SELECT death_date FROM deaths WHERE deaths.cid = mathhn.cid) ;

8. DELETE  FROM mathhn WHERE datedeath < '2013-10-01';

  //คัด Hn ว่าง ที่ยังไม่มีใน mBsae
9. SELECT a.cid,a.hn from mathhn a, population b WHERE a.cid = b.cid AND a.hn is NULL AND a.cid NOT IN (SELECT cid from deaths);

//ตรวจสอบ Hn ท่ีว่างไมีรหัส99809 และไม่Deaths
10. SELECT * FROM mathhn WHERE hn is NULL AND left(cid,5) != '99809' AND datedeath is NULL  ;

11. UPDATE mathhn SET hn = pid WHERE hn is null;