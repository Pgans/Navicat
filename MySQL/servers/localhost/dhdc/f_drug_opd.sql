

   # REPLACE INTO f_drug_opd
        SELECT
        '_SITECODE_' SITECODE,
        dr.HOSPCODE,
        dr.PID,
        dr.SEQ,
        dr.DATE_SERV,
        dr.CLINIC,
        dr.DIDSTD,
        dr.DNAME,
        dr.AMOUNT,
        dr.UNIT,
        dr.UNIT_PACKING,
        dr.DRUGPRICE, 
        dr.DRUGCOST, 
        dr.PROVIDER,
        dr.D_UPDATE ,
        md5(p.cid) PTLINK
        FROM dhdc.drug_opd dr
        INNER JOIN dhdc.person p ON dr.PID =  p.PID
        LIMIT  50 ; 