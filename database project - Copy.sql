/*create database library_db;*/

CREATE TABLE [Authors] (
  [Id] int,
  [Name] nvarchar(250),
  [Date] nvarchar(50),
  [country] nvarchar(250)
);

CREATE INDEX [primary Key] ON  [Authors] ([Id]);

CREATE INDEX [Key] ON  [Authors] ([Name], [Date], [country]);

CREATE TABLE [Borrowers] (
  [ID] int,
  [Name] nvarchar(250),
  [Date] nvarchar(50),
  [Phone] nvarchar(250)
);

CREATE INDEX [primary Key] ON  [Borrowers] ([ID]);

CREATE INDEX [Key] ON  [Borrowers] ([Name], [Date], [Phone]);

CREATE TABLE [books_borrow] (
  [ID] int,
  [Borrower_Id] int,
  [Book_ID] int,
  [start_date] nvarchar(50),
  [end_date] nvarchar(50),
  [notes] nvarchar(250)
);

CREATE INDEX [primary Key] ON  [books_borrow] ([ID]);

CREATE INDEX [Key] ON  [books_borrow] ([Borrower_Id], [Book_ID], [start_date], [end_date], [notes]);

CREATE TABLE [Countries] (
  [ID] int,
  [Name] nvarchar(250)
);

CREATE INDEX [primary key] ON  [Countries] ([ID]);

CREATE INDEX [Key] ON  [Countries] ([Name]);

CREATE TABLE [Books_data] (
  [ID] int,
  [Book_Name] nvarchar(250),
  [Category_ID] int,
  [Author_ID] int,
  [Country_ID] int,
  [Dar_ID] int,
  [Subcategory] nvarchar(250),
  [Date] nvarchar(50),
  [Pages_number] int,
  [Place_Id] int,
  [Book_statu] nvarchar(250),
  [Book_price] real
);

CREATE INDEX [primary Key] ON  [Books_data] ([ID]);

CREATE INDEX [Key] ON  [Books_data] ([Book_Name], [Category_ID], [Author_ID], [Country_ID], [Dar_ID], [Subcategory], [Date], [Pages_number], [Place_Id], [Book_statu], [Book_price]);

CREATE TABLE [Place] (
  [ID] int,
  [Name] nvarchar(250)
);

CREATE INDEX [primary Key] ON  [Place] ([ID]);

CREATE INDEX [Key] ON  [Place] ([Name]);

CREATE TABLE [Category] (
  [ID] int,
  [Name] nvarchar(250)
);

CREATE INDEX [primary key] ON  [Category] ([ID]);

CREATE INDEX [Key] ON  [Category] ([Name]);

CREATE TABLE [Dar_Nashr] (
  [ID] int,
  [Name] nvarchar(250),
  [Country] nvarchar(250)
);

CREATE INDEX [primary Key] ON  [Dar_Nashr] ([ID]);

CREATE INDEX [Key] ON  [Dar_Nashr] ([Name], [Country]);

/*insert statements */
insert into Dar_Nashr (ID,[Name], [Country]) Values (11234654879784,'tt','egypt');
insert into Category (ID,[Name]) values (12546784511,'ss');
insert into Place (ID,[Name]) values (1564525461,'hh');
insert into Books_data (ID,[Book_Name],Category_ID,Author_ID,Country_ID,Dar_ID,[Subcategory],[Date],Pages_number,Place_Id,[Book_statu],[Book_price])
values (15468949422,'good day',22,33,44,55,'dd','dd',55,555,'ddd',25.65);
insert into Countries (ID,[Name]) values (56498784549875,'dd');
insert into books_borrow (ID,Borrower_Id,Book_ID,[start_date],[end_date],[notes])
values (223243212,222,2222,'cc','ccc','cccc');
insert into Borrowers (ID,[Name],[Date],[Phone]) values (256487951562,'ali','2020/06/26','01065777777');
insert into Authors (ID,[Name],[Date],[country]) values (2232698745212,'tom','2009/09/25','USA') ;

/*Select using functions 20 Times */
1--/*what is the ASCII of the country egypt from Dar_Nashr*/
select ASCII('egypt') AS Dar_nashr_ASCII_country;

2--/*what is the count of name of tt?*/
select Count([Name]) as tt from Dar_Nashr where [Name]='esmail';

3--/*what is the name and the ID in name of the book*/
select CONCAT_WS (' ','22' , 'good day') ;

4--/*how to take the first only 5 numbers in the ID*/
SELECT LEFT('1123465487978', 5) AS ExtractString;

5--/*how to calculate the number of ID*/
SELECT LEN('12546784511');

6--/*what is the price of the book Data*/
SELECT CAST(504.22 AS int) as book_price from Books_data;

7--/*to take the only ID and forgey about name and country in dar_nashr statement*/
SELECT COALESCE(11234654879784,null, null);

8--/*what is the year of the borrow */
SELECT DATENAME(year, '2020/06/26') AS DatePartString;

9--/*what the all date of the borrow*/
SELECT DATEFROMPARTS(2019,09,25) AS Date_of_Borrowing;

10--/*to know year month or day*/
SELECT DATEPART(year, '2017/08/25') AS DatePartInt;

11--/*what is the all data in Authors list*/
SELECT *
  FROM Authors

12--/*what is the Name and tge phone of the porrowers*/
SELECT [Name] , Phone
  FROM Borrowers

13--/*what is the ID,Name and the date of the Author which his Country is USA*/
SELECT Id,[Name],[Date]
  FROM Authors
 WHERE Country = 'USA'

14--/*what is the book names in books data*/
select Book_Name from Books_data;

15--/*what is the most three expensive books*/
SELECT TOP 3 Id, Book_Name,Book_statu
  FROM Books_data
 ORDER BY Book_price DESC;

16--/*what is the name ,Date and Phone in borrowers list where ID is 256487951562 */
SELECT [Name],[Date], Phone
  FROM Borrowers
 WHERE ID=256487951562;

 17--/*what is the UNICODE of places*/
 SELECT UNICODE([Name]) AS Places_names
FROM Place;

18--/*what is the  ASCII of toms*/
SELECT ASCII('toms') AS Names
FROM Books_data;

19--/*how can you convert DATABASE to lower-case?*/

SELECT LOWER('DATABASE');

20--/*how can you convert database to upper-case?*/
SELECT UPPER('database'); 

/*update 5 times*/
update Dar_Nashr set [Name] ='esmail' where ID=1;
UPDATE Category SET [Name] = 'ss' where ID=12546784511;
UPDATE Books_data SET [Book_price] = 25.65 WHERE ID = 15468949422;
UPDATE Borrowers SET [Name]='ali', Phone = '01065777777' WHERE Id = 256487951562;
UPDATE Authors SET [Name]='tomas' where ID= 223269874512;


/*delete 5 times */
delete from Dar_Nashr where ID=11234654879784;
delete from Category where ID=12546784511;
delete from Place where ID=1564525461;
delete from Books_data where ID=15468949422;
delete from Countries where ID=56498784549875;
DELETE FROM Books_data WHERE Book_price > 10;

/* drop database library_db;*/