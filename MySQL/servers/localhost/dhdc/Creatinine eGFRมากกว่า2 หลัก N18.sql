SELECT * 
FROM labfu a
WHERE  a.DATE_SERV >'2018-01-01'
AND a.LABTEST IN ( 0581903, 0581904)
AND a.LABRESULT  BETWEEN '10' AND '99'