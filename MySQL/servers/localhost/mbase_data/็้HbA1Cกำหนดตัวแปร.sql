
SET @count_x = 0 ;
SET @pid_hn = 0;

SELECT a.*  , IF(a.HN = @pid_hn , @count_x:=@count_x+1, @count_x:= 0) AS yy , @pid_hn:=  a.hn  AS mm
FROM mb_HbA1c  a
WHERE a.DATE_SERV BETWEEN '2017-10-01' AND '2017-12-31'