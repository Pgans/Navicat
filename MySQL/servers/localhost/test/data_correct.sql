 
 

SELECT LOCATE('"PID":',DATA_CORRECT,14)
FROM data_correct 
LIMIT 1 



-- UPDATE data_correct SET pid_pcu=substr(POLICY_DATA,locate(':',POLICY_DATA,15)+2,locate(',',POLICY_DATA,25)-locate(':',POLICY_DATA,15)-3)
-- "UPDATE policy SET hn = (SELECT hn  FROM mathhn  WHERE pid_pcu = mathhn.pid)"
-- "UPDATE policy SET POLICY_DATA=concat(substr(POLICY_DATA,1,locate(':',POLICY_DATA,15)+1) ,hn, substr(POLICY_DATA,locate(',',POLICY_DATA,25)-1,999) ) WHERE 1"
-- "ALTER TABLE `policy` DROP COLUMN `hn`"
-- "ALTER TABLE `policy` DROP COLUMN `pid_pcu`"
-- 
-- 
-- -- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "DELETE FROM policy WHERE hospcode !=%HCODE%"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "ALTER TABLE `policy` ADD COLUMN `pid_pcu`  varchar(6) NULL AFTER `d_update`"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "ALTER TABLE `policy` ADD COLUMN `hn`  varchar(6) NULL AFTER `pid_pcu`"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "UPDATE policy SET pid_pcu=substr(POLICY_DATA,locate(':',POLICY_DATA,15)+2,locate(',',POLICY_DATA,25)-locate(':',POLICY_DATA,15)-3)"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "UPDATE policy SET hn = (SELECT hn  FROM mathhn  WHERE pid_pcu = mathhn.pid)"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "UPDATE policy SET POLICY_DATA=concat(substr(POLICY_DATA,1,locate(':',POLICY_DATA,15)+1) ,hn, substr(POLICY_DATA,locate(',',POLICY_DATA,25)-1,999) ) WHERE 1"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "ALTER TABLE `policy` DROP COLUMN `hn`"
-- CALL %MYSQL_EXE% --user=%DB_USER% --password=%DB_PWD% -P%DB_PORT% -D%DB_DATA%  -e "ALTER TABLE `policy` DROP COLUMN `pid_pcu`"
-- 
-- 