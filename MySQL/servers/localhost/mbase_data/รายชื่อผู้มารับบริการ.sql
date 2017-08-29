SELECT  c.HN AS 'HN',p.FNAME AS 'ชื่อ', p.LNAME AS 'นามสกุล'
FROM population p, cid_hn c, opd_visits o
WHERE p.CID = p.CID AND o.REG_DATETIME BETWEEN '20140101' AND '20140131'
ORDER BY o.REG_DATETIME;