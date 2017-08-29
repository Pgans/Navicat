SELECT a.cid, a.pid, a.prename,a.`name`,a.lname,a.sex,a.birth, a.typearea,b.date_diag,b.date_disch,b.chronic
FROM person a, chronic b 
 
WHERE a.pid = b.pid
GROUP BY a.cid ORDER BY chronic DESC;
