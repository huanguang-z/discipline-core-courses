--drop table student
--drop table class;
--drop table ������Ϣ��;
--drop table ������Ա
--drop table �軹��ϸ��;
--drop table ͼ�������ϸ��;
--drop table ͼ�����;
--drop table ͼ����ϸ��;
--create table ������Ϣ��
--(
--	����֤�� char(10),
--	���� char(10),
--	�Ա� char(10),
--	�������� date,
--	������ smallint,
--	������λ char(20),
--	�绰 char(15),
--	Email char(20)
--);
--insert into ������Ϣ�� values 
--('29307142','����¶','Ů','1989-02-01',2,'������Ϣϵ','85860126','zxl@163.com'),
--('36405216','����','��','1988-12-26',1,'����ϵ','85860729','ly@sina.com.cn'),
--('28308208','����ȫ','��','1988-04-25',1,'��������ϵ','85860618','wxq@yahoo.cn'),
--('16406236','�ż̸�','��','1989-08-18',1,'�ֻ�����ϵ','85860913','zjg@163.com');
--insert into ������Ϣ��(����֤��,����,�Ա�,��������,������λ,�绰,Email) values
--('16406247','��һ��','��','1981-12-30','�ֻ�����ϵ','85860916','gyf@yahoo.cn');
--create table �軹��ϸ��
--(
--	����֤�� char(10),
--	ͼ���� char(10),
--	�軹 char(5),
--	�������� date,
--	�������� date,
--	���� smallint,
--	���� char(10)
--);
--insert into �軹��ϸ�� values
--('29307142','07108667','��','2008-03-28','2008-04-14',1,'002016');
--insert into �軹��ϸ��(����֤��,ͼ����,�軹,��������,����,����) values
--('29307142','99011818','��','2008-04-27',1,'002016'),
--('36405216','07410802','��','2008-04-27',1,'002018'),
--('29307142','07410298','��','2008-04-28',1,'002018');
--insert into �軹��ϸ�� values
--('36405216','00000746','��','2008-04-29','2008-05-09',1,'002016');
--insert into �軹��ϸ��(����֤��,ͼ����,�軹,��������,����,����) values
--('28308208','07410139','��','2008-05-10',1,'002019'),
--('16406236','07410139','��','2008-05-11',1,'002017');
--create table ͼ�����
--(
--	���� char(10),
--	ͼ����� char(10)
--);
--insert into ͼ����� values
--('H31','Ӣ��'),('I267','������Ʒ'),('TP312','��������'),('TP393','���������'),('U66','��������');
--create table ͼ�������ϸ��
--(
--	ͼ���� char(10),
--	ͼ������ char(20),
--	����֤�� char(10),
--	������� date,
--	�黹���� date,
--	����� smallint
--);
--insert into ͼ�������ϸ��(ͼ����,ͼ������,����֤��,�������,�����) values
--('99011818','�Ļ�����','29307142','2008-04-27',14),
--('07410802','����Ӣ��','36405216','2008-04-27',24),
--('07410298','C++�����������','29307142','2008-04-28',14),
--('07410139','�պ�����','28308208','2008-05-10',18),
--('07410139','�պ�����','16406236','2008-05-11',17);
--create table ������Ա
--(
--���� char(10),
--���� char(10),
--�Ա� char(2),
--�������� date,
--��ϵ�绰 char(10),
--Email  char(20)
--);
--insert into  ������Ա values
--('002016','��ѧ��','��','1971-05-03','85860715','zxf@163.com'),
--('002017','������','Ů','1979-09-15','85860716','lj@163.com'),
--('002018','�˱�','��','1972-04-25','85860717','gb@yahoo.cn'),
--('002019','����','Ů', '1968-11-03','85860718','cx@sina.com.cn');

--create table ͼ����ϸ��
--(
--	���� char(10),
--	ͼ���� char(10),
--	ͼ������ char(30),
--	���� char(20),
--	������ char(30),
--	���� money,
--	�������� date,
--	������ int,
--	������ int,
--	����� int
--); 
--insert into  ͼ����ϸ�� values 
--('I267','99011818','�Ļ�����','������','֪ʶ������',16,'2000-03-19',8,15,14),
--('TP312','00000476','Delphi�߼�����ָ��','��ͼ','���ӹ�ҵ������',80,'2000-03-19',15,15,15),
--('U66','01058589','�����������','����','������ҵ������',19,'2001-07-15',20,20,20),
--('I267','07410139','�պ�����','����','�������ճ�����',19,'2007-04-12',15,20,18),
--('TP312','07410298','C++�������','��ӱ','���ϴ�ѧ������',38,'2007-05-08',10,15,14),
--('H31','07410802','����Ӣ��','�º�Ȩ','�人��ҵ��ѧ������',42,'2007-10-20',25,25,24),
--('H31','07108667','��ѧӢ��ѧϰ����','������','��������ѧ������',23.5,'2008-02-06',25,25,25),
--('TP393','07410810','���繤��ʵ�ý̳�','������','������ѧ������',34.8,'2008-08-21',10,15,15);


--drop table ������Ϣ��;
--create table ������Ϣ��
--(
--	����֤�� int primary key, --����
--	���� char(10) not null,
--	�Ա� char(2) default '��',
--	�������� date UNIQUE,
--	������ smallint CHECK (������ between 0 and 100),
--	������λ char(20),
--	�绰 char(10),
--	Email char(20) 
--);



--create table class
--(
--	ClassID int not null primary key,
--	ClassName varchar(20) not null
--)

--CREATE TABLE student                                           --����Ϊstudent
--(
--	  StuID int NOT NULL,                                           --ѧ��ѧ��
--	  StuName varchar(15) NOT NULL,                                 --ѧ������
--	  Sex char(2) NULL,                                             --�Ա�
--	  Major varchar(20) NULL,                                      --��ѡרҵ
--	  ClassID int NULL FOREIGN KEY REFERENCES class(ClassID)
--)








--alter table ������Ϣ�� add constraint ok1 Unique(Email)

--exec sp_helpconstraint ������Ϣ��

--create view view2
--as select * from ������Ϣ�� where �Ա� = 'Ů';

--select  *from view2;

--alter table ������Ϣ�� add QQ int;

--alter table ������Ϣ�� add QQ int; --�����ֶ�
--alter table ������Ϣ�� drop column QQ; --ɾ���ֶ�
--alter table ������Ϣ�� add CONSTRAINT ok1 UNIQUE(Email) --����ΨһԼ��
--alter table ������Ϣ�� drop constraint ok1-- ɾ��ΨһԼ��
--alter table ������Ϣ�� add CONSTRAINT ok2 default '000' for �绰 --����Ĭ��Լ��
--alter table ������Ϣ�� drop constraint ok2 --ɾ��Ψһ��Լ��
--alter table student alter column StuID smallint+
--alter table ����� add constraint Լ���� foreign key(���(����)) references ������(����(����))
--alter table ������Ϣ�� with nocheck  add constraint cs2 CHECK (�Ա� = 'Ů') 
--create index index1 on ������Ϣ��(����֤��)
--drop index index1 on ������Ϣ��
--create index index2 on ������Ϣ��(����֤��)
--create view view1
--as select Email from ������Ϣ��
--drop view view1
--exec sp_helpindex ������Ϣ��
--exec sp_helpconstraint ������Ϣ��
--select *from view1

 --create view view5
 --as select * from ������Ϣ�� where �Ա�='Ů'

--create index ph on ������Ϣ��(�绰)