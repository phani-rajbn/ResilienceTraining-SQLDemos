--Stored Procedures:
/*
When a Query is to be executed, first it will be parsed to check the syntactical errors if any from the query and then the query will be executed. Even if the same query is executed for x no of times, U end up parsing it before executing it. So for repeated queries, this could become a performance issues. 
U can create a Stored Procedure(Similar to a function) and parse it once, and can be used many times. Parsing is done while the procedure is created. When U call the procedure, it will not be parsed, eventually making it more faster compared to normal queries. However, for dynamic queries, Stored procs wont be of much help. 
*/

Create Procedure GetAllEmployees
(@name varchar(100))--Parameter for UR procedure
AS
SELECT * FROM tblEmployee where tblEmployee.EmpName = @name


Create Proc InsertEmp
(
	@name varchar(100),
	@address varchar(200),
	@contact varchar(12),
	@salary money, 
	@id int output
)
AS
Insert into tblEmployee(EmpName, EmpAddress, EmpSalary, EmpContact) values(@name, @address, @salary, @contact)
Select @id = @@IDENTITY; --All SQL Server variables are prefixed with @@, Identity will get the value of the Identity column after the successfull insertion

DECLARE @empId INT
EXEC InsertEmp 'Rahul', 'New Delhi', '011987965446', 76000, @empId OUTPUT
PRINT @empId

EXEC GetAllEmployees 'Phaniraj'

--If U want to rename a stored procedure, U could use the SQL Server's SP called SP_RENAME. NOTE: All Build in Stored procedures of SQL server are prefixed with SP_. So Custom procedures are recommended not use sp_ as prefix to UR Stored Procedures.

--How to alter an existing stored procedure:
Alter Procedure GetAllEmployees
(@name varchar(100) = 'Phaniraj')--Parameter for UR procedure
AS
SELECT * FROM tblEmployee where tblEmployee.EmpName = @name

EXEC GetAllEmployees 'Prajwal'