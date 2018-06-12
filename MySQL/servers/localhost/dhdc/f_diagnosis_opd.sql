
    #REPLACE INTO f_diagnosis_opd
        SELECT
        '_SITECODE_' SITECODE
        ,odx.HOSPCODE
        ,odx.PID
        ,odx.SEQ
        ,ifnull(odx.DATE_SERV,'') DATE_SERV
        ,ifnull(odx.DIAGTYPE,'') DIAGTYPE
        ,ifnull(odx.DIAGCODE,'') DIAGCODE
        ,ifnull(odx.CLINIC,'') CLINIC
        ,ifnull(odx.PROVIDER,'') PROVIDER
        ,odx.D_UPDATE
        ,md5(p.cid) PTLINK
        
       FROM dhdc.diagnosis_opd odx
        LEFT JOIN dhdc.person p ON odx.PID = p.PID
        #left join _HIS_DB_.ovst_seq q on q.vn=o.vn
      LIMIT 100 ; 