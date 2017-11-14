SELECT a.CID , b.HN 
FROM  population a, cid_hn b 
WHERE  a.CID = b.CID 
AND a.CID NOT IN (SELECT CID from deaths)
AND a.INSCL = 00
