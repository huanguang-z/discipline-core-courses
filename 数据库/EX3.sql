--create procedure cx_tskcl_proc as
--	select ����, ͼ����,ͼ������,�����  from ͼ����ϸ��
--exec cx_tskcl_proc;

--create procedure TS_CX_PROC 
--	@id char(10)
--as
--	select ͼ������,����,������,������ from ͼ����ϸ��
--	where @id = ͼ����
--exec TS_CX_PROC '00000476';

--alter procedure TS_CX_PROC
--	@name char(30)
--as
--	select  ͼ������,����,������,������ from ͼ����ϸ�� where @name = ͼ������
--exec TS_CX_PROC  '����Ӣ��';
--exec TS_CX_PROC '�պ�����';

--drop procedure TS_CX_PROC;


--create trigger tslb_insert_trigger on ͼ����� for insert
--as
--	if exists (select * from inserted)
--	rollback;
--insert into ͼ����� values('a','����ԭ��');

--create trigger ts_delete_trigger on ͼ����ϸ�� for delete
--as
--	if exists(select *from deleted)
--		rollback;
--delete from ͼ����ϸ�� where ͼ������ = '�պ�����';

--create trigger dzxx_insert_trigger on ������Ϣ�� for insert
--as
--	declare @borrow char (10);
--	if exists(select *from inserted)
--	begin
--		select @borrow = ����֤�� from inserted
--		insert into �軹��ϸ��(����֤��) values(@borrow);
--	end

--drop trigger tslb_insert_trigger;
--drop trigger ts_delete_trigger;
--drop trigger dzxx_insert_trigger;