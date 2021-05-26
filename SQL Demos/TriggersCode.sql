/*
Triggers are like events in OOP. They are invoked after a certain condition or criteria is met. This could be due to an insert, delete or a update statement.
It is a sp kind of SP that is automatically fired or executed when some event(insert, delete and update) occurs on a table. 
U can have insertion triggers, updation triggers and deletion triggers.  
*/

Alter Trigger EmpOnInsert on tblEmployee
FOR INSERT
AS
DECLARE @empId int
DECLARE @name varchar(100)
SET @empId = @@IDENTITY;
Select @name = i.EmpName from inserted i;
PRINT 'After insertion the new Employee ' + @name + ' with new ID as ' + CONVERT(varchar, @empId, 3)

--U could use triggers to update another table based on the action performed on one table. 

sp_columns tblEmployee
Insert into tblEmployee values('JoyDip','Kolkata', '0845387690', 55000, 3) 

--TODO: See how to use AFTER DELETE | UPDATE | INSERT

