

    #REPLACE INTO f_diagnosis_ipd
        SELECT
        '_SITECODE_' SITECODE
        ,dn.HOSPCODE 
        ,dn.PID
        ,ifnull(dn.AN,'') AN
        ,dn.DATETIME_ADMIT
        ,ifnull(dn.WARDDIAG,'') WARDDIAG
        ,ifnull(dn.DIAGTYPE,'') DIAGTYPE
        ,dn.DIAGCODE
        ,dn.PROVIDER
        ,dn.D_UPDATE
        ,ifnull(p.CID,'') ID
        ,md5(p.CID) PTLINK
        
        FROM dhdc.diagnosis_ipd dn
				LEFT JOIN dhdc.person p ON p.PID = dn.PID
				LIMIT 50 ;
				
     
        #where pt.hn=pk_hn;