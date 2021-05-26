Create database CSharpProject

Use CSharpProject

Create table tblDept
(
DeptID int primary key identity(1,1),
DeptName varchar(20) not null
)

Create table tblEmployee
(
   EmpID int primary key, 
   EmpName varchar(100) not null, 
   EmpAddress varchar(200) not null, 
   EmpPhone varchar(20) not null, 
   EmpSalary money not null,
   DeptId int references tblDept(DeptID)
)

Create table tblProject
(
   ProjectID int primary key not null,
   ProjectName varchar(100) not null,
   ProjectMgr int references tblEmployee(EmpID)
)


Insert into tblDept values('Sales')
Insert into tblDept values('Production')
Insert into tblDept values('Admin')
Insert into tblDept values('IT Services')
Insert into tblDept values('Transport')

Insert into tblEmployee values(1, 'Phaniraj', 'Bangalore', '+910045205684', 65000, 4)
Insert into tblEmployee values(2, 'Prajwal', 'Bangalore', '+910045205684', 65000, 1)
Insert into tblEmployee values(3, 'Ramesh', 'Bangalore', '+910045205684', 65000, 2)
Insert into tblEmployee values(4, 'Chetan', 'Bangalore', '+910045205684', 65000, 3)
Insert into tblEmployee values(5, 'Cheran', 'Bangalore', '+910045205684', 65000, 5)
Insert into tblEmployee values(6, 'Gopal', 'Bangalore', '+910045205684', 65000, 3)
Insert into tblEmployee values(7, 'Swetha', 'Bangalore', '+910045205684', 65000, 4)

Insert into tblProject values(1, 'VOLVO', 1)
