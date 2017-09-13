SELECT COUNT(cid)from person WHERE nation != 099;
SELECT cid, nation FROM person WHERE nation !=099;

DELETE FROM person WHERE hospcode != '10953' OR discharge = '1' ;
UPDATE person SET pid = (select hn FROM mathhn WHERE person.cid = mathhn.cid and mathhn.cid is not null limit 1);

UPDATE person SET pid = hn WHERE pid is null;
SELECT * FROM person WHERE hn = 1911;

***************************************************************
SELECT * FROM person WHERE pid = 5016
SELECT * FROM person WHERE hn in (5016,6508,8755,16083);
SELECT * FROM person WHERE hn = '6508';



//เพ่มColumn
ALTER TABLE drugallergy ADD COLUMN hn VARCHAR(255)  NULL AFTER d_update;
UPDATE drugallergy SET hn = pid ;
#UPDATE drugallergy INNER JOIN person ON drugallergy.hn = person.hn SET drugallergy.pid = person.pid WHERE person.pid is not null;
UPDATE drugallergy SET pid = (SELECT pid FROM person WHERE person.hn = drugallergy.hn);
ALTER TABLE drugallergy DROP COLUMN hn;

//disability
DELETE FROM disability WHERE hospcode != '10953';
ALTER TABLE disability ADD COLUMN hn  varchar(255) NULL AFTER d_update;
UPDATE disability SET hn = pid;
UPDATE disability INNER JOIN person ON disability.hn = person.hn SET disability.pid = person.pid WHERE person.pid is not null;