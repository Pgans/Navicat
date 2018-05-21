SELECT DISTINCT gcoffice.offid AS HOSPCODE,
a.HN PID,  a.VISIT_ID SEQ, DATE_FORMAT(a.REG_DATETIME,'%Y-%m-%d') DATE_SERV,
DENTTYPE,SERVPLACE,PTEETH,
PCARIES,PFILLING,PEXTRACT,DTEETH,DCARIES,DFILLING,DEXTRACT,
NEED_FLUORIDE,NEED_SCALING,NEED_SEALANT,NEED_PFILLING,NEED_DFILLING,
NEED_PEXTRACT,NEED_DEXTRACT,NPROSTHESIS,PERMANENT_PERMANENT,
PERMANENT_PROSTHESIS,PROSTHESIS_PROSTHESIS,GUM,SCHOOLTYPE,CLASS,
PROVIDER,
DATE_FORMAT(NOW(),'%Y%m%d%H%i%s') AS D_UPDATE
FROM 
mbase_data.gcoffice, mbase_data.opd_visits a 
INNER JOIN mbase_data.dental_visits b ON a.VISIT_ID = b.VISIT_ID
WHERE  a.REG_DATETIME > '2018-01-01 00:00'
AND a.IS_CANCEL =0