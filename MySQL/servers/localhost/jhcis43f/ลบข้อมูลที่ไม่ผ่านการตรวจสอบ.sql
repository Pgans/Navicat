
DELETE FROM disability WHERE disabid = ' ' ;

DELETE FROM epi  WHERE  (vaccinetype in ('102','103','104') OR vaccinetype = '') ;  //บาดทะยักตัดออกในปี2560 และ43แฟ้มห้ามีค่าว่างในVaccinetype

***ตรวจสอบ pid ในแฟ้ม Chronic ที่ไม่มีใน Person  
SELECT * FROM chronic WHERE pid NOT IN (SELECT pid FROM person);

DELETE FROM chronic WHERE pid NOT IN (SELECT pid FROM person) ;
******************************
//policy 
ALTER TABLE policy ADD COLUMN hn varchar(255) NULL AFTER d_update ;
"ALTER TABLE `anc` ADD COLUMN `hn`  varchar(255) NULL AFTER `d_update`"

UPDATE policy SET 


