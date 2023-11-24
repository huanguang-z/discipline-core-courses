--create procedure cx_tskcl_proc as
--	select 类别号, 图书编号,图书名称,库存数  from 图书明细表
--exec cx_tskcl_proc;

--create procedure TS_CX_PROC 
--	@id char(10)
--as
--	select 图书名称,作者,出版社,复本数 from 图书明细表
--	where @id = 图书编号
--exec TS_CX_PROC '00000476';

--alter procedure TS_CX_PROC
--	@name char(30)
--as
--	select  图书名称,作者,出版社,复本数 from 图书明细表 where @name = 图书名称
--exec TS_CX_PROC  '航海英语';
--exec TS_CX_PROC '艺海潮音';

--drop procedure TS_CX_PROC;


--create trigger tslb_insert_trigger on 图书类别 for insert
--as
--	if exists (select * from inserted)
--	rollback;
--insert into 图书类别 values('a','编译原理');

--create trigger ts_delete_trigger on 图书明细表 for delete
--as
--	if exists(select *from deleted)
--		rollback;
--delete from 图书明细表 where 图书名称 = '艺海潮音';

--create trigger dzxx_insert_trigger on 读者信息表 for insert
--as
--	declare @borrow char (10);
--	if exists(select *from inserted)
--	begin
--		select @borrow = 借书证号 from inserted
--		insert into 借还明细表(借书证号) values(@borrow);
--	end

--drop trigger tslb_insert_trigger;
--drop trigger ts_delete_trigger;
--drop trigger dzxx_insert_trigger;