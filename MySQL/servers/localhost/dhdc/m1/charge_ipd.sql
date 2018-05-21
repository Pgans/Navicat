SELECT DISTINCT '10953' AS HOSPCODE,
PID,  
AN,
DATETIME_ADMIT,
WARDSTAY,
CHARGEITEM,
CHARGELIST,
QUANTITY,
INSTYPE,
COST,
PRICE,
PAYPRICE,
DATE_FORMAT(NOW(),'%Y%m%d%H%i%s') AS D_UPDATE