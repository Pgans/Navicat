

   # REPLACE INTO f_drug_ipd
        SELECT SQL_NO_CACHE
        '_SITECODE_' SITECODE,
        dipd.HOSPCODE,
        dipd.PID,
        dipd.AN,
        dipd.DATETIME_ADMIT,
        ifnull(dipd.WARDSTAY,'') WARDSTAY,
        dipd.TYPEDRUG,
        dipd.DIDSTD,
        dipd.DNAME,
        ifnull(dipd.DATESTART,'') DATESTART,
        dipd.DATEFINISH,
        dipd.AMOUNT,
        dipd.UNIT,
        dipd. UNIT_PACKING,
        dipd.DRUGPRICE,
        dipd.DRUGCOST,
        dipd.PROVIDER,
        dipd.D_UPDATE,
        md5(p.CID) PTLINK

        FROM        
            dhdc.drug_ipd dipd
				LEFT JOIN dhdc.person p ON dipd.PID = p.PID
	    LIMIT 50 ;