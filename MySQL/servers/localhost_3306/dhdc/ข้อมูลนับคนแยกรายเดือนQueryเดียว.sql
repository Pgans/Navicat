select 'จำนวนทารกเกิด ' AS 'ข้อมูลปี2560',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2016-10-01' AND '2016-10-31') AS 'Oct',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2016-11-01' AND '2016-11-30') AS 'Sep',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2016-12-01' AND '2016-12-31') AS 'Dec',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-01-01' AND '2017-01-31') AS 'Jan',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-02-01' AND '2017-02-28') AS 'Feb',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-03-01' AND '2017-03-31') AS 'March',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-04-01' AND '2017-04-30') AS 'April',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-05-01' AND '2017-05-31') AS 'May',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-06-01' AND '2017-06-30') AS 'June',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-07-01' AND '2017-07-31') AS 'July',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-08-01' AND '2017-08-31') AS 'August',
(SELECT COUNT(PID) FROM newborn WHERE BDATE BETWEEN '2017-09-01' AND '2017-09-30') AS 'September'

-- sum(case when month(bill_date)=12 then bill_amt else 0 end) as [Dec],
-- sum(bill_amt) as Total
from newborn
where BDATE BETWEEN '2016-10-01' AND '2017-09-30'
group by 'จำนวนทารก'
order by PID;