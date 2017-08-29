1. INSERT INTO mathhn(cid,pid,d_update) SELECT person.idcard,person.pid,Now() FROM person WHERE  pcucodeperson = '99809' AND dischargetype != '1';

#DELETE FROM person WHERE hospcode != '10953';
2. DELETE FROM mathhn WHERE cid IN(SELECT cid FROM deaths);
3. SELECT * FROM mathhn;

4. UPDATE mathhn SET hn = (SELECT cid_hn.hn FROM cid_hn WHERE cid_hn.cid = mathhn.cid );

5. UPDATE mathhn SET  typearea_pcu = (SELECT person.typelive FROM person WHERE person.idcard = mathhn.cid AND  pcucodeperson = '99809');
6. UPDATE mathhn SET hn = pid WHERE hn is null;
 