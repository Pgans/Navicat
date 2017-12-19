
        SELECT
        '_SITECODE_' SITECODE
      #  ,(select offid  from mbase_data.gcoffice) HOSPCODE
				,'10953' HOSPCODE
				,ifnull(hex(encode(p.CID)),'_SECRETKEY_')),'') CID
      #  ,cast(ifnull(hex(encode(p.cid,'_SECRETKEY_')),'') as char) CID
        ,ifnull(p.hn,'') PID
       # ,if(isnull(''),'',hex(encode('','_SECRETKEY_'))) HOUSENO
				,ifnull(hex(encode(p.townid)),'_SECRETKEY_')),'') VILLCODE
        ,ifnull(hex(encode(t.town_name,'_SECRETKEY_')),'') VILLNAME
        ,ifnull(hex(encode(ifnull(right(p.TOWN_ID, 2),'_SECRETKEY_')),'') Village
        ,substr(p.TOWN_ID, 5, 2) AS TAMBON
        ,substr(p.TOWN_ID, 3, 2) AS AMPUR
        ,left(p.TOWN_ID, 2) AS CHANGWAT
        ,CASE 
			WHEN DATEDIFF( NOW(), BIRTHDATE ) / 365.25 >= '20' AND sex='1' AND MARRIAGE = '4' THEN '831' 
			WHEN DATEDIFF( NOW(), BIRTHDATE ) / 365.25< '20' AND sex='1' AND MARRIAGE = '4' THEN '832' 
			WHEN DATEDIFF( NOW(), BIRTHDATE ) / 365.25 >= '15' AND sex='1' THEN '003' 
			WHEN DATEDIFF( NOW(), BIRTHDATE ) / 365.25 < '15' AND sex='1' THEN '001' 
			WHEN DATEDIFF( NOW(), BIRTHDATE ) / 365.25 < '15' AND sex='2' THEN '002' 
			WHEN DATEDIFF( NOW(), BIRTHDATE ) / 365.25 >= '15' AND sex='2' AND MARRIAGE ='1' THEN '004' 
			ELSE '005'
		 END 
	   AS PRENAME
        ,ifnull(hex(encode(IF(p.prename = '001','เด็กชาย',IF(p.prename = '002','เด็กหญิง', IF(p.prename = '003','นาย' ,IF(p.prename = '004','นางสาว',IF(p.prename = '005','นาง',''))))),'_SECRETKEY_')),'') Pname
        ,ifnull(hex(encode(p.fname,'_SECRETKEY_')),'') Name
        ,ifnull(hex(encode(p.lname,'_SECRETKEY_')),'') Lname
        ,ifnull(hex(encode(o.hn,'_SECRETKEY_')),'') HN
        ,ifnull(p.sex,' ') sex
        ,p.birthdate Birth
        ,CASE 
			WHEN p.marriage = '4' THEN '6' 
			ELSE p.marriage
		  END 
		  AS MSTSATUS
        ,CASE
			WHEN p.oc_id > '901' OR p.oc_id IN( '818', '507', '821', '718', '705', '404', '708', '216', '801', '504' ) THEN '000'
			WHEN p.oc_id IN( '501', '502', '503' ) THEN '001'
			WHEN p.oc_id IN( '403', '209', '207', '702', '709', '707', '816', '819', '803' ) THEN '002'
			WHEN p.oc_id IN( '401', '602', '606', '601' ) THEN '003'
			WHEN p.oc_id IN( '201', '106', '208', '110', '111', '112', '108', '805', '113', '203', '114', '102' ) THEN '004'
			WHEN p.oc_id IN( '302', '303' ) THEN '005'
			WHEN p.oc_id IN( '206', '210', '213', '214' ) THEN '006'
			WHEN p.oc_id IN( '202', '204', '205' ) THEN '007'
			WHEN p.oc_id IN( '402', '405' ) THEN '010'
			WHEN p.oc_id = '901' THEN '013'
			WHEN p.oc_id = '713' THEN '014'
			WHEN p.oc_id = '900' THEN '015'
		END 
	  AS  OCCUPTION_OLD
        ,'6111' AS OCCUTION_NEW
        ,CASE 
			WHEN population.natn_id > '' THEN CONCAT( '0', population.natn_id )
			ELSE '099'
		END 
	  AS RACE
        ,CASE 
			WHEN population.natn_id > '' THEN CONCAT( '0', population.natn_id )
			ELSE '099'
		  END 
      AS NATION
        ,CASE 
			WHEN population.religion > '00' THEN population.religion
			ELSE '01'
		 END 
	   AS  RELIGION
        ,CASE 
			WHEN RIGHT( population.educate, 2 ) BETWEEN '01' AND '06' THEN RIGHT( population.educate, 2 )
			WHEN RIGHT( population.educate, 2 ) BETWEEN '07' AND '08' THEN '06'
			ELSE '00'
		END
	  AS EDUCATION
        ,' ' FSTATUS
        ,p.FATHER
        ,p.MOTHER
        ,' ' Couple
        ,' ' Vstatus
        ,' ' MoveIn
        ,'9' Discharge
        ,' ' Ddischarge
        ,CASE 
			WHEN population.BG_ID IN( '01', '05', '09' ) THEN '1'
			WHEN population.BG_ID IN( 02, 06, 10 ) THEN '2'
			WHEN population.BG_ID IN( 03, 07, 11 ) THEN '3'
			WHEN population.BG_ID IN( 04, 08, 12 ) THEN '4'
			ELSE '0'
		END 
	  AS ABOGROUP,
        ,CASE 
			WHEN population.BG_ID IN( 09, 10, 11, 12 ) THEN '1'
			WHEN population.BG_ID IN( 05, 06, 07, 08 ) THEN '2'
			ELSE '0'
		END 
	  AS RHGROUP,
        ,' ' Labor
        ,' ' PassPort
        ,if(p.typearea in (1,2,3,4,5),p.typearea,'4') TypeArea
     #   ,ifnull(pt.death,'N') as DEATH
				,IF(d.death_date is null or TRIM(d.death_date)='','N','Y') DEATH
        ,IF(d.death_date is null or TRIM(d.death_date)='','0000-00-00',d.ddeath) DDEATH
        ,DATE_FORMAT( NOW(), '%Y%m%d%H%i%s' ) AS D_UPDATE
        ,md5(p.cid) PTLINK
        
       FROM population p, opd_visits o, towns t, deaths d
			AND p.town_id = t.town_id
			AND o.cid = p.cid
			AND o.is_cancel = 0
			AND d.cid = p.cid

LIMIT 50 ;


        
        #WHERE pt.hn=pk_hn
        #group by pt.hn;    
