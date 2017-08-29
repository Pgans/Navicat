SELECT unit ,COUNT(unit) AS amount
FROM mb_referin_list
WHERE referdate BETWEEN '20151001' AND '20160930'
GROUP BY unit ORDER BY  amount DESC ;