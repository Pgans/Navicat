

		#REPLACE INTO f_labfu
        SELECT SQL_NO_CACHE DISTINCT
				'10953' SITECODE,
				lab.HOSPCODE,
				lab.PID,
				lab.SEQ,
			  lab.DATE_SERV,
				lab.LABTEST,
				' ' AS LABCODE, 
				' ' AS LABNAME,
				lab.LABRESULT,
				'' LABUNIT,
				'' LABGROUP,
				'' CONFIRM,
				lab.D_UPDATE,
				md5(p.cid) AS PTLINK
		FROM  dhdc.labfu lab
		LEFT JOIN dhdc.person p ON lab.PID = p.PID
	LIMIT 50 ;