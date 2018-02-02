SELECT DISTINCT a.DATETIME_ADMIT ,a.AN, b.PROVIDER ,b.NAME, b.LNAME ,b.PROVIDERTYPE
FROM procedure_ipd a, provider b
WHERE a.DATETIME_ADMIT > '2017-10-01'
AND a.PROVIDER = b.PROVIDER
AND b.PROVIDERTYPE = '02'
  