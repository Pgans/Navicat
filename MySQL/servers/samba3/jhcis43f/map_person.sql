SELECT COUNT(cid)from person WHERE nation != 099;
SELECT cid, nation FROM person WHERE nation !=099;

DELETE FROM person WHERE hospcode != '10953';
UPDATE person SET pid = (select hn FROM mathhn WHERE person.cid = mathhn.cid and mathhn.cid is not null limit 1);

UPDATE person SET pid = hn WHERE pid is null;

SELECT pid , hn, FROM mathhn WHERE cid = 1104200017285
