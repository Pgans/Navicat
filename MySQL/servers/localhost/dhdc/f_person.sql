SELECT
         '_SITECODE_' SITECODE
        ,p.HOSPCODE  HOSPCODE
        ,cast(ifnull(hex(encode(p.cid,'_SECRETKEY_')),'') as char) CID
        #,ifnull((select pid_export from f_person_tmp where hn=pt.hn),IFNULL(p.person_id,'0')) PID
		,if(isnull(ad.HOUSENO),'',hex(encode(ad.HOUSENO,'_SECRETKEY_'))) HOUSENO
		,ifnull(hex(encode(CONCAT(ad.changwat,ad.ampur,ad.tambon,lpad(ad.village,2,'0')),'_SECRETKEY_')),'') VILLCODE
		,ifnull(hex(encode(ad.villaname,'_SECRETKEY_')),'') VILLNAME
		,ifnull(hex(encode(ifnull(right(concat('0',ad.village),2),''),'_SECRETKEY_')),'') Village
		,ifnull(ad.tambon,'') TAMBON
		,ifnull(ad.ampur,'') Ampur
		,ifnull(ad.changwat,'') Changwat
		#,cast(ifnull(p.house_id,0) as decimal(15,0)) HouseID
		,ifnull(p.prename,'') PreName
		,ifnull(hex(encode(IF(p.prename = '001','เด็กชาย',IF(p.prename = '002','เด็กหญิง', IF(p.prename = '003','นาย' ,IF(p.prename = '004','นางสาว',IF(p.prename = '005','นาง',''))))),'_SECRETKEY_')),'') Pname
		,ifnull(hex(encode(p.`name`,'_SECRETKEY_')),'') Name
		,ifnull(hex(encode(p.lname,'_SECRETKEY_')),'') Lname
		,ifnull(hex(encode(p.HN,'_SECRETKEY_')),'') HN
		,ifnull(p.sex,' ') sex
		,p.birth Birth
		,if(p.MSTATUS in (1,2,3,4,5,6),p.MSTATUS,'9') Mstatus
		,ifnull(p.occupation_old,'000') Occupation_Old
		,ifnull(p.occupation_new,'9999') Occupation_New
		,ifnull(p.Race,'099') Race
		,ifnull(p.Nation,'099') Nation
		,ifnull(p.Religion,'01') Religion
		,if(p.Education is null,'09',lpad(p.Education,2,'0')) Education
		,if(p.FSTATUS=1,'1','2') Fstatus
		,ifnull(hex(encode(p.father,'_SECRETKEY_')),'') Father
		,ifnull(hex(encode(p.mother,'_SECRETKEY_')),'') Mother
		,ifnull(hex(encode(p.couple,'_SECRETKEY_')),'') Couple

		,' ' Vstatus
		,p.movein MoveIn
		,cast(ifnull(p.discharge,'9') as char(1)) Discharge
		,p.ddischarge Ddischarge

		,if(p.ABOGROUP is null or p.ABOGROUP like '%ไม่%','0',p.ABOGROUP) ABOGROUP
		,ifnull(p.RHGROUP,'') RHGROUP

		,ifnull(p.LABOR,'') Labor
		,space(8) PassPort
		,if(p.typearea in (1,2,3,4,5),p.typearea,'4') TypeArea
		,IF(d.ddeath is null or TRIM(d.ddeath)='','N','Y') DEATH
		,IF(d.ddeath is null or TRIM(d.ddeath)='','0000-00-00',d.ddeath) DDEATH
		,p.D_UPDATE D_Update
		,md5(p.cid) ptlink

		from dhdc.person p
		#left join dhdc.patient pt on p.patient_hn=pt.hn
		#left join dhdc.house h on p.house_id=h.house_id
left join dhdc.address ad on ad.PID = p.PID
LEFT JOIN dhdc.death d on d.PID = p.PID
	  
        	#WHERE p.cid=pk_person_id 
        	#group by p.cid
 LIMIT 50