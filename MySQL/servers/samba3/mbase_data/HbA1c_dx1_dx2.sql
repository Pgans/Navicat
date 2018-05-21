SET @d1 = '2017-10-01';
SET @d2 = '2017-12-31' ;
SELECT  *  FROM  (
										SELECT  HN, DATE_SERV , A1c , AGE, SERVPLACE, ICD10_TM,DXT_ID
										FROM mb_HbA1c
										WHERE DATE_SERV  BETWEEN @d1 AND @d2
										AND AGE >= '65'
										AND A1c > 7.0
										AND  DXT_ID = 1
										AND  ICD10_TM  BETWEEN 'E10' AND 'E14'
                     )  AS dx1 
LEFT OUTER JOIN  (
										SELECT  HN, ICD10_TM,DXT_ID
										FROM mb_HbA1c
										WHERE DATE_SERV  BETWEEN @d1 AND @d2
										AND AGE >= '65'
										AND A1c > 7.0
										AND  DXT_ID = 2
										AND  (ICD10_TM  BETWEEN 'I10' AND 'I15' OR ICD10_TM BETWEEN 'N180' AND 'N189') 
                     )  AS dx2 ON dx2.HN = dx1.HN  WHERE dx1.HN <>  ' ' 
				
