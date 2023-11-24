--drop table student
--drop table class;
--drop table 读者信息表;
--drop table 工作人员
--drop table 借还明细表;
--drop table 图书借阅明细表;
--drop table 图书类别;
--drop table 图书明细表;
--create table 读者信息表
--(
--	借书证号 char(10),
--	姓名 char(10),
--	性别 char(10),
--	出生日期 date,
--	借书量 smallint,
--	工作单位 char(20),
--	电话 char(15),
--	Email char(20)
--);
--insert into 读者信息表 values 
--('29307142','张晓露','女','1989-02-01',2,'管理信息系','85860126','zxl@163.com'),
--('36405216','李阳','男','1988-12-26',1,'航海系','85860729','ly@sina.com.cn'),
--('28308208','王新全','男','1988-04-25',1,'人文艺术系','85860618','wxq@yahoo.cn'),
--('16406236','张继刚','男','1989-08-18',1,'轮机工程系','85860913','zjg@163.com');
--insert into 读者信息表(借书证号,姓名,性别,出生日期,工作单位,电话,Email) values
--('16406247','顾一帆','男','1981-12-30','轮机工程系','85860916','gyf@yahoo.cn');
--create table 借还明细表
--(
--	借书证号 char(10),
--	图书编号 char(10),
--	借还 char(5),
--	借书日期 date,
--	还书日期 date,
--	数量 smallint,
--	工号 char(10)
--);
--insert into 借还明细表 values
--('29307142','07108667','还','2008-03-28','2008-04-14',1,'002016');
--insert into 借还明细表(借书证号,图书编号,借还,借书日期,数量,工号) values
--('29307142','99011818','借','2008-04-27',1,'002016'),
--('36405216','07410802','借','2008-04-27',1,'002018'),
--('29307142','07410298','借','2008-04-28',1,'002018');
--insert into 借还明细表 values
--('36405216','00000746','还','2008-04-29','2008-05-09',1,'002016');
--insert into 借还明细表(借书证号,图书编号,借还,借书日期,数量,工号) values
--('28308208','07410139','借','2008-05-10',1,'002019'),
--('16406236','07410139','借','2008-05-11',1,'002017');
--create table 图书类别
--(
--	类别号 char(10),
--	图书类别 char(10)
--);
--insert into 图书类别 values
--('H31','英语'),('I267','当代作品'),('TP312','程序语言'),('TP393','计算机网络'),('U66','船舶工程');
--create table 图书借阅明细表
--(
--	图书编号 char(10),
--	图书名称 char(20),
--	借书证号 char(10),
--	借出日期 date,
--	归还日期 date,
--	库存数 smallint
--);
--insert into 图书借阅明细表(图书编号,图书名称,借书证号,借出日期,库存数) values
--('99011818','文化苦旅','29307142','2008-04-27',14),
--('07410802','航海英语','36405216','2008-04-27',24),
--('07410298','C++程序设计语言','29307142','2008-04-28',14),
--('07410139','艺海潮音','28308208','2008-05-10',18),
--('07410139','艺海潮音','16406236','2008-05-11',17);
--create table 工作人员
--(
--工号 char(10),
--姓名 char(10),
--性别 char(2),
--出生日期 date,
--联系电话 char(10),
--Email  char(20)
--);
--insert into  工作人员 values
--('002016','周学飞','男','1971-05-03','85860715','zxf@163.com'),
--('002017','李晓静','女','1979-09-15','85860716','lj@163.com'),
--('002018','顾彬','男','1972-04-25','85860717','gb@yahoo.cn'),
--('002019','陈欣','女', '1968-11-03','85860718','cx@sina.com.cn');

--create table 图书明细表
--(
--	类别号 char(10),
--	图书编号 char(10),
--	图书名称 char(30),
--	作者 char(20),
--	出版社 char(30),
--	定价 money,
--	购进日期 date,
--	购入数 int,
--	复本数 int,
--	库存数 int
--); 
--insert into  图书明细表 values 
--('I267','99011818','文化苦旅','余秋雨','知识出版社',16,'2000-03-19',8,15,14),
--('TP312','00000476','Delphi高级开发指南','坎图','电子工业出版社',80,'2000-03-19',15,15,15),
--('U66','01058589','船舶制造基础','杨敏','国防工业出版社',19,'2001-07-15',20,20,20),
--('I267','07410139','艺海潮音','李叔','江苏文艺出版社',19,'2007-04-12',15,20,18),
--('TP312','07410298','C++程序设计','成颖','东南大学出版社',38,'2007-05-08',10,15,14),
--('H31','07410802','航海英语','陈宏权','武汉工业大学出版社',42,'2007-10-20',25,25,24),
--('H31','07108667','大学英语学习辅导','姜丽蓉','北京理工大学出版社',23.5,'2008-02-06',25,25,25),
--('TP393','07410810','网络工程实用教程','汪新民','北京大学出版社',34.8,'2008-08-21',10,15,15);


--drop table 读者信息表;
--create table 读者信息表
--(
--	借书证号 int primary key, --主码
--	姓名 char(10) not null,
--	性别 char(2) default '男',
--	出生日期 date UNIQUE,
--	借书量 smallint CHECK (借书量 between 0 and 100),
--	工作单位 char(20),
--	电话 char(10),
--	Email char(20) 
--);



--create table class
--(
--	ClassID int not null primary key,
--	ClassName varchar(20) not null
--)

--CREATE TABLE student                                           --表名为student
--(
--	  StuID int NOT NULL,                                           --学生学号
--	  StuName varchar(15) NOT NULL,                                 --学生姓名
--	  Sex char(2) NULL,                                             --性别
--	  Major varchar(20) NULL,                                      --所选专业
--	  ClassID int NULL FOREIGN KEY REFERENCES class(ClassID)
--)








--alter table 读者信息表 add constraint ok1 Unique(Email)

--exec sp_helpconstraint 读者信息表

--create view view2
--as select * from 读者信息表 where 性别 = '女';

--select  *from view2;

--alter table 读者信息表 add QQ int;

--alter table 读者信息表 add QQ int; --增加字段
--alter table 读者信息表 drop column QQ; --删除字段
--alter table 读者信息表 add CONSTRAINT ok1 UNIQUE(Email) --增加唯一约束
--alter table 读者信息表 drop constraint ok1-- 删除唯一约束
--alter table 读者信息表 add CONSTRAINT ok2 default '000' for 电话 --增加默认约束
--alter table 读者信息表 drop constraint ok2 --删除唯一性约束
--alter table student alter column StuID smallint+
--alter table 外键表 add constraint 约束名 foreign key(外键(列名)) references 主键表(主键(列名))
--alter table 读者信息表 with nocheck  add constraint cs2 CHECK (性别 = '女') 
--create index index1 on 读者信息表(借书证号)
--drop index index1 on 读者信息表
--create index index2 on 读者信息表(借书证号)
--create view view1
--as select Email from 读者信息表
--drop view view1
--exec sp_helpindex 读者信息表
--exec sp_helpconstraint 读者信息表
--select *from view1

 --create view view5
 --as select * from 读者信息表 where 性别='女'

--create index ph on 读者信息表(电话)