
*
A3                !        )        0 �

categories2>
category_idint0: BรหัสประเภทR Z b 2l
category_namevarchar20: B3ชื่อประเภทอุปกรณ์Rutf8Zutf8_general_cib :"
category_id  "
category_id J
 
categoriescategory_id�
departments2'
dep_idint0: BรหัสR Z b 2X
dep_namevarchard0: B$ชื่อหน่วยงานRutf8Zutf8_general_cib :
dep_id  "

dep_id :
dep_id_2  "

dep_id J
 departmentsdep_id�
devices2?
	device_idint0: B!รหัสอุปกรณ์R Z b 2f
device_serialvarchar0: B-หมายเลขครุภัณฑ์Rutf8Zutf8_general_cib 2[
device_namevarchar20: B$ชื่ออุุปกรณ์Rutf8Zutf8_general_cib 2S
category_idint0: B3รหัสประเภทอุปกรณ์R Z b 23
dep_idint0: BรหัสแผนกR Z b 2P
specvarchar�0: Bรุ่น ยี่ห้อRutf8Zutf8_general_cib 2?
purchase_datedate0: Bวันที่ซื้อR Z b 2=
due_datedate0: B!วันครบกำหนดR Z b 2&
priceint
0: BราคาR Z b 2;
	sale_datedate: Bวันจำหน่ายHR Z b 2K
orthervarchar�: BหมายเหตุHRutf8Zutf8_general_cib J
 devices	device_id�
faculty2@

faculty_idint
0: B!รหัสคณะวิชาR Z b 2Z
faculty_namevarchar�0: B!ชื่อคณะวิชาRutf8Zutf8_general_cib J
 faculty
faculty_id�
ivtmaterials2<
ivt_idint0: B!รหัสอุปกรณ์R Z b 2;
material_idint0: Bชื่อวัสดุR Z b 2&
priceint0: BราคาR Z b 2*
amountint0: BจำนวนR Z b 27
unit_idint0: Bชื่อหน่วยR Z b 2:
reg_datedate0: Bวันที่ซื้อR Z b 2>
store_idint0: B!ชื่อร้านค้าR Z b 2A
category_idint0: B!ประเภทวัสดุR Z b J
 ivtmaterialsivt_id�
	materials2;
material_idint0: BรหัสวัสดุR Z b 2T
material_namevarchard0: Bชื่อวัสดุRutf8Zutf8_general_cib :'
matrerial_name  "
material_name J
 	materialsmaterial_idz
	migration24
versionvarchar�0: B Rutf8Zutf8_general_cib 2

apply_timeint: B HR Z b J
 	migrationversion�
person27
user_idint0: BรหัสบุคคลR Z b 2A
	firstnamevarchard0: Bชื่อRutf8Zutf8_general_cib 2I
lastnamevarchard0: BนามสกุลRutf8Zutf8_general_cib 2P
photovarchard0:'nopic.jpg'BรูปภาพHRutf8Zutf8_general_cib 22
	birthdatedate0: BวันเกิดR Z b 2?

start_datedate0: B!วันย้ายเข้าR Z b 2;
	stop_datedate0: Bวันย้ายออกR Z b 2'
dep_idint0: BแผนกR Z b 26
positions_idint0: Bตำแหน่งR Z b :&
fk_person_user1_idx  "
user_id :,
fk_person_departments1_idx  "

dep_id :0
fk_person_positions1_idx  "
positions_id J)
 personuser_iddep_idpositions_id�
	positions28
idint0: B!รหัสตำแหน่งR Z b 2N
position_namevarchard0: Bตำแหน่งRutf8Zutf8_general_cib J
 	positionsid�

serviceout2#
idint0: BรหัสR Z b 2?
	device_idint0: B!ชื่ออุปกรณ์R Z b 2C
symptomvarchar�0: BอาการRutf8Zutf8_general_cib 2A
	date_sentdate0: B$วันที่ส่งออกR Z b 2<
date_indate: B!วันที่รับมาHR Z b 2J
pricevarchar�: Bราคาซ่อมHRutf8Zutf8_general_cib 2T
orthervarchar�: B!สิ่งที่ซ่อมHRutf8Zutf8_general_cib 2>
store_idint0: B!ชื่อร้านค้าR Z b :,
fk_serviceout_store1_idx  "
store_id :/
fk_serviceout_devices1_idx  "
	device_id J
 
serviceoutidstore_id�
store2)
store_idint0: BรหัสR Z b 2N

store_namevarchar20: Bชื่อร้านRutf8Zutf8_general_cib 2I
addressvarchar�0: Bที่อยู่Rutf8Zutf8_general_cib 2I
telvarchar
0: Bเบอร์โทรRutf16Zutf16_general_cib J
 storestore_id�
students2#
idint0: BรหัสR Z b 2@
stud_idint0: B$รหัสนักศึกษาR Z b 2M
fullnamevarchar�0: Bชื่อเต็มRutf8Zutf8_general_cib 2I
addressvarchar�0: Bที่อยู่Rutf8Zutf8_general_cib 2C
emailvarchard0: Bอีเมล์Rutf8Zutf8_general_cib 2G
telvarchar: Bเบอร์โทรHRutf8Zutf8_general_cib 2A

faculty_idint
0: B"ชื่อสาขา-คณะR Z b 2O
university_idint
0: B-ชื่อมหาวิทยาลัยR Z b 2@
train_atdate0: B$วันทีเข้าฝึกR Z b 2H

traint_outdate0: B*วันที่ฝึกเสร็จR Z b J
 studentsid�
units27
unit_idint0: Bรหัสหน่วยR Z b 2P
	unit_namevarchar20: Bชื่อหน่วยRutf8Zutf8_general_cib :
	unit_name "
	unit_name J
 unitsunit_id�

university2F
university_idint
0: B$รหัสวิทยาลัยR Z b 2i
university_namevarchar�0: B-ชื่อมหาวิทยาลัยRutf8Zutf8_general_cib J
 
universityuniversity_id�
user2
idint0: B R Z b 25
usernamevarchar�0: B Rutf8Zutf8_unicode_cib 24
auth_keyvarchar 0: B Rutf8Zutf8_unicode_cib 2:
password_hashvarchar�0: B Rutf8Zutf8_unicode_cib 2A
password_reset_tokenvarchar�: B HRutf8Zutf8_unicode_cib 22
emailvarchar�0: B Rutf8Zutf8_unicode_cib 2$
statussmallint0:10B HR Z b 2

created_atint0: B R Z b 2

updated_atint0: B R Z b :
username "
username :
email "	
email :4
password_reset_token "
password_reset_token J
 useridC
fk_person_departments1persondep_id"departments*dep_id08B A
fk_person_positions1personpositions_id"	positions*id08B 2
fk_person_user1personuser_id"user*id08B "�

	Diagram 1(0:@
>

categories$� �(K2$	�?WWWWWW�?�������?!      �?8 :B
@
departments�� �(K2$	�?WWWWWW�?�������?!      �?8 :>
<
devices$� �(�2$	�?WWWWWW�?�������?!      �?8 :>
<
faculty�� �(K2$	�?WWWWWW�?�������?!      �?8 :D
B
ivtmaterials�� �(�2$	�?WWWWWW�?�������?!      �?8 :@
>
	materials�� �(K2$	�?WWWWWW�?�������?!      �?8 :@
>
	migration�� �(K2$	�?WWWWWW�?�������?!      �?8 :>
<
person�� �(�2$	�?WWWWWW�?�������?!      �?8 :?
=
	positions � �(K2$	�?WWWWWW�?�������?!      �?8 :A
?

serviceout�$ �(�2$	�?WWWWWW�?�������?!      �?8 :<
:
store�� �(k2$	�?WWWWWW�?�������?!      �?8 :@
>
students�� �(�2$	�?WWWWWW�?�������?!      �?8 :;
9
units�$ �(K2$	�?WWWWWW�?�������?!      �?8 :@
>

university$� �(K2$	�?WWWWWW�?�������?!      �?8 :;
9
user�' �(�2$	�?WWWWWW�?�������?!      �?8 Ju
fk_person_departments1����$	�������?�������?�������?!      �? *person2dep_id:departmentsBdep_idJs
fk_person_positions1����$	�������?�������?�������?!      �? *person2positions_id:	positionsBidJd
fk_person_user1����$	�������?�������?�������?!      �? *person2user_id:userBidRArial Unicode MSX` h ( 0