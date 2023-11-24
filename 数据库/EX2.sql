
--drop table student;
--drop table teacher;
--drop table course;
--drop table score;
--create table student
--(
--	sno char(5),
--	sname char(5),
--	sex char(5),
--	birthday date,
--	class char(10)
--);

--insert into student values
--('108', '曾华','男','2009-01-07','95033'),
--('105', '匡明','男','2010-02-05','95031'),
--('107', '王丽','女','2001-03-06','95033'),
--('101', '李军','男','2002-10-06','95033'),
--('109', '王芳','女','2002-10-05','95031'),
--('103' ,'陆军','男','2006-03-04','95031');
 
--create table teacher
--(
--	tno char(5),
--	tname char(5),
--	sex char(5),
--	birthday date,
--	prof char(10),
--	depart char(10)
--);
--insert into teacher values
--('804','李诚','男','2012-02-12','副教授','计算机系'),
--('856','张旭','男','2003-12-23','讲师','电子工程系'),
--('825','王萍','女','2005-05-12','助教','计算机系'),
--('831','刘冰','女','2008-09-30','助教','电子工程系');
--create table course 
--(
--cno char(10),
--cname char(20),
--tno  char(10)
--)
--insert into  course values
--('3-105','计算机导论','825'),
--('3-245','操作系统','804'),
--('6-166','数字电路','856'),
--('9-888','高等数学','825');

--create table score
--(
--sno char(10),
--cno char(10),
--degree int
--);
--insert into  score values
--('03','3-245',86),
--('105','3-245',75),
--('109','3-245',68),
--('103','3-105',92),
--('105','3-105',88),
--('109','3-105',76),
--('101','3-105',64),
--('107','3-105',91),
--('108','3-105',78),
--('101','6-166',85),
--('107','6-166',79),
--('108','6-166',81);

--select sname,sex,class from student; 
--列出student表中所有记录的sname、sex和class列
--select sname,sex,class from student


--select distinct depart from teacher;
--显示教师所有的单位即不重复的depart列
--select distinct depart from teacher

--select *from student 
--显示学生表的所有记录
--select *from student

--select *from score where degree>=60 and degree <=80;
--显示score表中成绩在60到80之间的所有记录
--select *from score where degree>=60 and degree <=80;

--select *from score where degree in(85,86,88);
--显示score表中成绩为85，86或88的记录
--select * from score where degree in (85,86,88);

--select *from student where class = '95031' or sex = '女';
--显示student表中“95031”班或性别为“女”的同学记录
--select *from student where sex = '女' or class = '95031'

--select *from student order by class desc;
--以class降序显示student表的所有记录
--select *from student order by class desc;

--select * from score order by cno ASC,degree DESC;
--以cno升序、degree降序显示score表的所有记录
--select *from score order by cno asc, degree desc

--select COUNT(*)from student where class = '95031'
--显示“95031”班的学生人数
--select COUNT(*)from student where class = '95031'

--select sno,cno from score where degree = (select max(degree) from score);
--显示score表中的最高分的学生学号和课程号
--select cno,sno from score where degree = (select max(degree) from score)

--select avg(degree) from score where cno = '3-105';
--显示“3-105”号课程的平均分
--select avg(degree) from score where cno = '3-105';

--select avg(degree) from score where cno like '3%' group by cno having count(sno)>=5;
--显示score表中至少有5名学生选修的并以3开头的课程号的平均分数
--select avg(degree) from score where cno like '3%' group by cno having count(sno)>=5;

--select sno from score group by sno having min(degree)>70 and max(degree)<90;
--显示最低分大于70，最高分小于90的sno列
--select sno from score group by sno having min(degree)>70 and max(degree)<90

--select sname,cno,degree from score,student where score.sno=student.sno;
--显示所有学生的 sname、 cno和degree列
--select sname,cno,degree from score,student where score.sno=student.sno;

--select sname,cname,degree from score,course,student 
--where score.sno=student.sno
--and course.cno=score.cno;
--显示所有学生的 sname、 cname和degree列
--select sname as '姓名',cname,degree from score,course,student where score.sno=student.sno and score.cno = course.cno;

--select cno,avg(degree) 平均分 from score,student
--where student.sno=score.sno
--and student.class ='95033' group by cno;
--列出“95033”班所选课程的平均分
--select cno,avg(degree) 平均分 from score,student where student.sno=score.sno and student.class = '95033' group by cno;
--select  avg(degree) from score,student where student.sno = score.sno and student.class='95033'

--select *from score where cno = '3-105' and degree > 
--(select degree from score where cno = '3-105' and sno = '109');
--显示选修“3-105”课程的成绩高于“109”号同学成绩的所有同学的记录
--select *from score where cno = '3-105' and degree > (select degree from score where cno = '3-105' and sno = '109');

--select a.sno,a.cno,a.degree from score a,score b 
--where a.sno=b.sno and a.degree<b.degree;
--显示score中选修多门课程的同学中分数为非最高分成绩的记录
--select a.sno,a.cno,a.degree from score a,score b where a.sno= b.sno and a.degree<b.degree

--select *from score where degree > 
--(select degree from score where sno='109' and cno = '3-105');
--显示成绩高于学号为“109”、课程号为“3-105”的成绩的所有记录
--select *from score where degree >(select degree from score where sno='109' and cno = '3-105')

--select sno,sname,birthday from student where year(birthday)=
--(select year (birthday)from student where sno = '108');
--显示出和学号为“108”的同学同年出生的所有学生的sno、sname和 birthday列
--select sno,sname,birthday from student where year(birthday) = (select year(birthday) from student where sno = '108')

--select *from score where cno in (select cno from course 
--where tno in(select tno from teacher where tname = '张旭'));
--显示“张旭”老师任课的学生成绩
--select *from score where cno in (select cno from course where tno in (select tno from teacher where tname = '张旭'))

--select tname from teacher where tno in 
--(select tno from course where cno in
--(select cno from score group by cno having count(*)>=5));
--显示选修某课程的同学人数多于5人的老师姓名
--select tname from teacher where tno in(select tno from course where cno in (select cno from score group by cno having count(*)>=5))

--select *from student where class in ('95033','95031');
--显示“95033”班和“95031”班全体学生的记录
--select *from student where class in ('95033','95031')

--select distinct cno from score where degree in(select degree from score where degree>85);
--显示存在有85分以上成绩的课程cno
--select distinct cno from score where degree in (select degree from score where degree > 85);

--select *from score where cno in(select cno from course 
--where tno in (select tno from teacher where depart='计算机系'));
--显示“计算机系”老师所教课程的成绩表
--select *from score where cno in (select cno from course where tno in (select tno from teacher where depart = '计算机系'))

-- select tname,prof from teacher where (prof not in 
--(select prof from teacher where depart ='电子工程系') and depart = '计算机系')
--or (prof not in 
--(select prof from teacher where depart ='计算机系') and depart = '电子工程系')
--显示“计算机系”和“电子工程系”不同职称的老师的tname和prof
--select tname,prof from teacher where (prof not in 
--(select prof from teacher where depart ='电子工程系') and depart = '计算机系')
--or (prof not in 
--(select prof from teacher where depart ='计算机系') and depart = '电子工程系')

--select cno,sno,degree from score where cno = '3-105' and 
--degree > any(select degree from score where cno = '3-245') order by degree DESC;
--显示选修编号为“3-105”课程且成绩至少高于“3-245”课程的同学的cno、sno和degree，并按degree从高到低次序排列
--select cno,sno,degree from score  where cno = '3-105' and degree > any(select degree from score where cno = '3-245') order by degree desc

--select cno,sno,degree from score where cno = '3-105' and 
--degree > all(select degree from score where cno = '3-245')
--显示选修编号为“3-105”课程且成绩高于“3-245”课程的同学的cno、sno和degree
--select cno,sno,degree from score where cno = '3-105' and degree > all(select degree from score where cno = '3-245');

--select tname, depart from teacher where tno in (select tno from course);
--列出所有任课老师的tname和depart
--select tname,depart from teacher where tno in (select tno from course);

--select tname, depart from teacher where tno not in (select tno from course);
--列出所有未讲课老师的tname和depart
--select tname,depart from teacher where tno not in (select tno from course)

--select tname,sex,birthday from teacher union select sname,sex,birthday from student;
--列出所有老师和同学的 姓名、性别和生日
--select tname,sex,birthday from teacher union select sname,sex,birthday from student;

--select distinct sno from score x
--where not exists
--  (select *from score y
--	where y.sno=103 and
--	not exists
--	(select *from score z
--		where z.sno=x.sno and z.cno = y.cno));
--检索所学课程包含学生“103”所学课程的学生学号


--select sname from student x
--where not exists 
--	(select *  from  course y
--    	 where not exists 
--          ( select * from  score z
--		  where x.sno=z.sno and y.cno=z.cno))
--检索选修所有课程的学生姓名
