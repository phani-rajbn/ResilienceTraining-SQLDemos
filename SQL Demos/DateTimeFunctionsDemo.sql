--Date Time Operations in SQL Server:
/*
SQL server has DateTime data type that could be used to store Date and Time in the tables. U also have functions to get the machine time and other additional information. For backward compatibility of the Older SQL server, U can also store Only the date and the time. 
The functions of the Date and Time can be a part of an expression, these kind of functions are called as SCALAR value functions, they return only one value. They are different from SPs as SPs cannot be used as a part of query(Expressions).  
*/

SELECT SYSDATETIME() as Date;

SELECT COUNT(*) FROM tblEmployee
SELECT GETDATE(); 


DECLARE @currDate dateTime
Set @currDate = GETDATE()
Select CONVERT(varchar, @currDate, 103) as [DD/MM/YYYY]

--Create and Alter for the Function. These functions are called Scalar Value functions as they return single value. U also have TABLE VALUE FUNCTIONS. 
Alter Function GetMacDate(@date DateTime = GetDate)
RETURNS VARCHAR(20)
BEGIN
RETURN (SELECT CONVERT(varchar, @date, 103) AS [DD/MM/YYYY])
END

--Use the function like an Expression and as a PART of SQL Statement which U cannot do with Stored Procs.
SELECT dbo.GetMacDate(GETDATE())