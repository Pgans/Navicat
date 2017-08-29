select 'จำนวนทารกเกิด ' AS 'ข้อมูลปี2560',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2016-10-01' AND '2016-10-31') AS 'Oct',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2016-11-01' AND '2016-11-30') AS 'Nov',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2016-12-01' AND '2016-12-31') AS 'Dec',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-01-01' AND '2017-01-31') AS 'Jan',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-02-01' AND '2017-02-28') AS 'Feb',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-03-01' AND '2017-03-31') AS 'Mar',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-04-01' AND '2017-04-30') AS 'Apr',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-05-01' AND '2017-05-31') AS 'May',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-06-01' AND '2017-06-30') AS 'Jun',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-07-01' AND '2017-07-31') AS 'Jul',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-08-01' AND '2017-08-31') AS 'Aug',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-09-01' AND '2017-09-30') AS 'Sep'

-- sum(case when month(bill_date)=5 then bill_amt else 0 end) as [May],
-- sum(case when month(bill_date)=6 then bill_amt else 0 end) as [Jun],
-- sum(case when month(bill_date)=7 then bill_amt else 0 end) as [Jul],
-- sum(case when month(bill_date)=8 then bill_amt else 0 end) as [Aug], 
-- sum(case when month(bill_date)=9 then bill_amt else 0 end) as [Sep],
-- sum(case when month(bill_date)=10 then bill_amt else 0 end) as [Oct],
-- sum(case when month(bill_date)=11 then bill_amt else 0 end) as [Nov],
-- sum(case when month(bill_date)=12 then bill_amt else 0 end) as [Dec],
-- sum(bill_amt) as Total
from newborn
where BDATE BETWEEN '2016-10-01' AND '2017-09-30'
group by 'จำนวนทารก'
order by PID;