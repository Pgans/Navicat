

   # REPLACE INTO f_death
        SELECT
        '_SITECODE_' SITECODE
        ,d. HOSPCODE
        ,d. PID
        ,d.HOSPDEATH
        ,d.AN
        ,d.SEQ
        ,d.DDEATH
        ,d.CDEATH_A
        ,d.CDEATH_B
        ,d.CDEATH_C
        ,d.CDEATH_D
        ,d.ODISEASE
        ,d.CDEATH
        ,d.PREGDEATH
        ,d.PDEATH
        ,d.PROVIDER
        ,d.D_UPDATE
        ,p.cid  PTLINK
        
      FROM dhdc.death d, dhdc.person p
LIMIT 50 ; 
       # left join _HIS_DB_.person p on p.person_id=d.person_id
       # left join _HIS_DB_.patient pt on p.patient_hn=pt.hn        
       # left join _HIS_DB_.ovst o1 on o1.vstdate=d.death_date and o1.hn=p.patient_hn
       # left join _HIS_DB_.ovst_seq q1 on o1.vn=q1.vn
       # WHERE d.person_id=pk_person_id;
#END