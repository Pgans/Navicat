UPDATE policy SET pid_pcu=substr(POLICY_DATA,locate(':',POLICY_DATA,15)+2,locate(',',POLICY_DATA,25)-locate(':',POLICY_DATA,15)-3)

UPDATE policy SET hn = (SELECT hn  FROM mathhn  WHERE pid_pcu = mathhn.pid)

UPDATE policy SET POLICY_DATA=concat(substr(POLICY_DATA,1,locate(':',POLICY_DATA,15)+1) ,hn, substr(POLICY_DATA,locate(',',POLICY_DATA,25)-1,999) ) WHERE 1