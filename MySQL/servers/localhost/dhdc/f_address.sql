

   # REPLACE INTO f_address
        SELECT 
        '_SITECODE_' SITECODE
        ,p.HOSPCODE  HOSPCODE
        ,ad.ADDRESSTYPE   ADDRESSTYPE
        ,ifnull(hex(encode(ad.HOUSE_ID,'_SECRETKEY_')),'') HOUSE_ID
        ,ifnull(ad.HOUSETYPE,'1')  HOUSETYPE
        ,ifnull(hex(encode(ad.ROOMNO,'_SECRETKEY_')),'') ROOMNO
        ,ifnull(ad.CONDO,'') CONDO
        ,ifnull(hex(encode(ad.HOUSENO,'_SECRETKEY_')),'') HOUSENO
        ,ad.SOISUB
        ,ad.SOIMAIN
        ,ifnull(ad.ROAD,'') ROAD
        ,ad.VILLANAME
        ,ad.VILLAGE
        ,ad.TAMBON
        ,ad.AMPUR
        ,ad.CHANGWAT
        ,ifnull(hex(encode(ad.TELEPHONE,'_SECRETKEY_')),'') TELEPHONE
        ,ifnull(hex(encode(ad.MOBILE,'_SECRETKEY_')),'') MOBILE
        ,ifnull(ad.D_UPDATE,'') D_UPDATE
        ,md5(p.cid) PTLINK
        
       FROM dhdc.person p
        LEFT JOIN dhdc.address ad ON ad.PID = p.PID
       
       # WHERE (`p`.`person_id`=pk_person_id)
        #GROUP BY p.person_id
        #ORDER BY pt.tmbpart;  
LIMIT 50 ;