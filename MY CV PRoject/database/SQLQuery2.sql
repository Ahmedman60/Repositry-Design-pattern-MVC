create trigger updateproductsv 
on [dbo].[aprov]
instead of delete
as
begin

update [dbo].[Products]
set [dbo].[Products].Avialable = 0
where [dbo].[Products].ProductID = 
(select deleted.ProductID from deleted)



end