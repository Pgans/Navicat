select i.hn ,i.regist_flag,i.admit_date,i.discharge_date



–หาโรคหลักของการ Admit ครั้งนั้นๆ
,isnull((select top 1 ICDCode
from PATDIAG d
where d.Hn = i.hn and d.regNo = i.regist_flag
and d.dxtype =’1′
and d.pt_status=’D’
and d.DiagType =’I’),”) as Pdx

— หา regNo ของการ นอนรพ.ครั้งที่แล้ว
,isnull((select top 1 regist_flag
from Ipd_h i2
where i2.hn = i.hn
and i2.regist_flag <i.regist_flag
order by i2.regist_flag desc),i.admit_date) as PrevAdmit

–หาโรคของการจำหน่ายครั้งที่แล้ว
,(select top 1 ICDCode
from PATDIAG p2
where p2.Hn = i.hn
and p2.regNo = (isnull((select top 1 regist_flag
from Ipd_h i2
where i2.hn = i.hn
and i2.regist_flag <i.regist_flag
order by i2.regist_flag desc),’00’))
and p2.dxtype=’1′
and p2.pt_status=’D’
and p2.DiagType =’I’) as PrevIcdCode

— หาวันที่จำหน่าย ครั้งที่แล้ว
,isnull((select top 1 discharge_date
from Ipd_h i2
where i2.hn = i.hn
and i2.regist_flag <i.regist_flag
order by i2.regist_flag desc),i.admit_date) as PrevDiscDate

— คำนวน ว่า จากการ นอนรพ.ครั้งที่แล้ว ถึงการนอนครั้งถัดมา ห่างกันกี่วัน
,DATEDIFF ( dd , convert(DateTime,convert(char,isnull((select top 1 discharge_date
from Ipd_h i2
where i2.hn = i.hn
and i2.regist_flag <i.regist_flag
order by i2.regist_flag desc),i.admit_date)-5430000))
, convert(DateTime,convert(char,i.admit_date-5430000))) as ReAdmit

from Ipd_h i
where discharge_date between ‘25540901’ and ‘25540930’
–เลือกเฉพาะ คนไข้ที่ นับจากวันที่จำหน่ายครั้งที่แล้วถึง การadmit ครั้งใหม่ ห่างกัน 1-28 วัน
and (DATEDIFF ( dd , convert(DateTime,convert(char,isnull((select top 1 discharge_date
from Ipd_h i2
where i2.hn = i.hn
and i2.regist_flag <i.regist_flag
order by i2.regist_flag desc),i.admit_date)-5430000))
, convert(DateTime,convert(char,i.admit_date-5430000))) between 1 and 28)

— เลือกเฉพาะคนไข้ที่ admitด้วยโรคเดิม–
— ในส่วนเงื่อนไขตรงนี้ ถ้าหากว่า ตัดออกด้วยการทำรายงานจาก HRF จะ เร็วกว่า และใช้ทรัพยากรจาก server น้อยกว่า —
and isnull((select top 1 ICDCode
from PATDIAG d
where d.Hn = i.hn and d.regNo = i.regist_flag
and d.dxtype =’1′
and d.DiagType =’I’),”) =(select top 1 ICDCode
from PATDIAG p2
where p2.Hn = i.hn
and p2.regNo = (isnull((select top 1 regist_flag
from Ipd_h i2
where i2.hn = i.hn
and i2.regist_flag <i.regist_flag
order by i2.regist_flag desc),’00’))
and p2.dxtype=’1′
and p2.DiagType =’I’)

order by i.hn,i.regist_flag