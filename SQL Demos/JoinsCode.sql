--The feature of RDBMS is to relate one or more tables. This is called as referenceing. In ERP Scenario, an employee is associated with a  dept. The Employee table and the Dept table are related to one another. 
--Every table's data will have a column that has unique data on which U do queries generally. That column is called as PRIMARY KEY. For a given table, U can have only one primary key, however U could have composite primary key. A primary key value based on 2 or more columns is what is called as composite primary key.  If U want to have another column with unique data, then that column can have a constraint called UNIQUE Constraint. 
--If U have any data which is based on the data from another table, then we relate(link) the tables using references or foreign keys. For a given table there is no restriction on the number of foreign keys. 
--A book is written by multiple authors. U will have entries where the author info can be kept in a seperate table and its iD is refered in the book table. RDBMS has some principles or recommendations on how U design Ur tables. This is called as Degrees of Normalization. If a column has repeated data, then U can separate the data into another table and refer it here using the ID of that data. This is called as FOREIGN KEY Reference. 
--The parent table's primary key will be referenced in the child table. For eg, author is the parent table and book is the child table. The AuthorID is referenced in the Book table. This is called One to Many relation. 
--A book can be written by multiple authors and each author can write multiple books, this becomes Many to Many relation. In this case, U end up creating a link table, there will be a author table, book table, book_Author link table.
/*Author table: Independent table
1, Phaniraj, Bangalore
2, Prajwal, Mysore

Book table: Independent table
1 TestingC#Code 400 

Author_BookTable
AutoNo, AuthorID, BookId
1		1			1
2		2			1
*/

Create table Author(
AuthorID int primary key identity(1,1), 
AuthorName varchar(100) NOT NULL
)


Create table Publisher(
 PubId int primary key identity(1,1),
 PublisherName varchar(200) NOT NULL
)
Create table Book(
BookId int primary key identity(1,1),
Title varchar(100) not null, 
Price money not null,
PubId int not null, 
Constraint fk_pub FOREIGN KEY (PubId) references Publisher(PubId)
)
--PubID value in the book table will contain any value that is available in the Publisher Table, If the value is not there in the Publisher table, then the data will not insert here.

Create table Book_AuthorLink
(
  LinkId int primary key identity(1,1),
  AuthorId int not null references Author(AuthorID),
  BookId int not null references Book(BookId)
)

Insert into Publisher values('Penguin books')
Insert into Publisher values('NavBharat')
Insert into Publisher values('Wrox')
Insert into Publisher values('Microsoft Press')
Insert into Publisher values('Oracle Press')

SELECT PubID from Publisher
Insert into Book values('Professional C#', 400, 3)
Insert into Book values('Inside COM', 450, 4)
Insert into Book values('Professional ASP.NET', 650, 3)
Insert into Book values('Inside DCOM', 700, 4)
Insert into Book values('Java Handbook', 450, 5)


--Joins combine 2 or more tables which have related data and get the results out of it using a equation. 
--Joins have inner joins, left joins, right joins, cross Joins.
--inner joins give common data from the 2 tables...

Select Book.Title, Publisher.PublisherName from Book inner join publisher on book.PubId = publisher.PubId

--Left Joins: U get all the data of the left and its corresponding data from the right, if no matching data is available in the right, it will be null..
Select Publisher.PublisherName, Book.Title from publisher left join book on Publisher.PubId = Book.PubId

--Right Joins: U get all the data from the right and only matching data from the left.
Select Publisher.PublisherName, Book.Title from publisher right join book on Publisher.PubId = Book.PubId

