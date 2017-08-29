//ALTER TABLE `women` DROP COLUMN `hn`
//ALTER TABLE policy DROP COLUMN hn ;
//เพิ่มfeild 2 COLUMNS;
ALTER TABLE policy ADD COLUMN pid_pcu  VARCHAR(6) NULL AFTER  d_update ;
ALTER TABLE policy ADD COLUMN hn  VARCHAR(6) NULL AFTER  pid_pcu ;

//UPDATE pid_pcu ด้วย pid จากข้อมูลใน JSON
UPDATE policy set pid_pcu=substr(POLICY_DATA,locate(":",POLICY_DATA,15)+2,locate(",",POLICY_DATA,25)-locate(":",POLICY_DATA,15)-3)
//policy แถวหลัง
SELECT substr(POLICY_DATA,locate(",",POLICY_DATA,25)-1,999)  FROM policy
//เอาhn รพ มาใส่  policy
UPDATE policy SET hn = (SELECT hn  FROM mathhn  WHERE pid_pcu = mathhn.pid)

//เปลี่ยน JSON (POLICY_DATA) เป็น hn รพ
UPDATE policy SET POLICY_DATA=concat(substr(POLICY_DATA,1,locate(":",POLICY_DATA,15)+1) ,hn, substr(POLICY_DATA,locate(",",POLICY_DATA,25)-1,999) ) WHERE 1