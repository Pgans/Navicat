SELECT DISTINCT gcoffice.offid AS HOSPCODE,
b.HN PID,  
b.VISIT_ID SEQ,  
DATE_FORMAT(b.REG_DATETIME,'%Y%m%d%H%m%s') DATETIME_SERV,
DATE_FORMAT(a.datetime_ae, '%Y%m%d%H%m%s') DATETIME_AE,
a.aetype  AETYPE,
a.aeplace AEPLACE,
a.typein_ae TYPEIN_AE,
a.traffic TRAFFIC,
a.vehicle VEHICLE,
a.alcohol ALCOHOL,
a.narcotic NACROTIC_DRUG,
a.belt  BELT,
a.helmet HELMET,
a.airway AIRWAY,
a.stopbleed STOPBLEED,
a.splint  SPLINT,
a.fluid FLUID,
'' URGENCY,
'' COMA_EYE,
'' COMA_SPEAK,
'' COMA_MOVEMENT,
DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') AS D_UPDATE ,c.CID
FROM mbase_data.gcoffice , mbase_data.accidents a, mbase_data.opd_visits b
INNER JOIN mbase_data.cid_hn  c ON  b.HN = c.HN
WHERE  b.REG_DATETIME > '2018.01.01 00:00'
AND a.visit_id = b.VISIT_ID 
AND a.is_cancel = 0
AND b.IS_CANCEL = 0