CREATE DATABASE db_library100;
USE db_library100;

/* Create Table Statements */
CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAdd VARCHAR(50) NOT NULL,
);

CREATE TABLE Publisher (
	PublisherID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	PublisherName VARCHAR(50) UNIQUE NOT NULL,
	Addr VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Authors (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Copies (
	 BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	 BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	 Number_of_Copies VARCHAR(50) NOT NULL
 );

 CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1001,1),
	Name VARCHAR(50) NOT NULL,
	Addr VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Loans (
	BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);
GO

/*-------------------------*/
/* Insert into statements */
INSERT INTO Library_Branch
	(BranchName, BranchAdd)
	VALUES
	('Sharpstown', '123 Quiet St., Sharpstown, NY'),
	('Central', '4518 Duct Tape Rd., Central, WA'),
	('Kent', '88 Silver St., Las Vegas, NV'),
	('King', '101 Silence Ave., New Orleans, LA'),
	('Grand Rapids', 'Golden Blvd., Grand Rapids, MI'),
	('Oahu', '10006 King Kamehameha St., Oahu, HI'),
	('Reno', '777 Money Ave., Reno, NV')
;

INSERT INTO Publisher
	(PublisherName, Addr, Phone)
	VALUES
	('Penguin Random House', '4867 28th. St., Ft. Myers, NY', '345-789-2546'),
	('Hachette Livre', '982 West Ave., Shadow, NC', '758-002-6515'),
	('Springer Nature', '75889 Tabb St., Laredo, TX', '456-987-0055'),
	('Scholastic', '84 10th St., Los Angeles, CA', '958-321-6542'),
	('John Wiley & Sons', '5 Bobby Blvd., Los Angeles, CA', '958-845-8431'),
	('McGraw-Hill', '5875 Sally St., Des Moines, IA', '254-984-3516'),
	('HarperCollins', '662 Sky Blvd., Detroit, MI', '612-729-4853'),
	('Cengage', '25345 Wellington Ave., New Orleans, LA', '364-249-7515'),
	('Houghton Mifflin Harcourt', '27 6th. St., Kipling, NV', '702-434-6156'),
	('Macmillan Publishers', '1001 Dada Ave., San Fransisco, CA','258-941-5245')
;

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Random House'),
	('The Mist', 'Hachette Livre'),
	('Alice is not dead', 'Springer Nature'),
	('ALL THE PIECES MATTER', 'Scholastic'),
	('MY OLD FAITHFUL', 'John Wiley & Sons'),
	('THE THIRD HOTEL', 'McGraw-Hill'),
	('FOUNDING MARTYR', 'HarperCollins'),
	('IN THE HURRICANE EYE', 'Cengage'),
	('BURNING DOWN THE HAUS', 'Houghton Mifflin Harcourt'),
	('THE BLUE KINGFISHER', 'Macmillan Publishers'),
	('The Thing', 'Macmillan Publishers'),
	('SEX AND THE CITY AND US','Scholastic'),
	('TRUST ME', 'John Wiley & Sons'),
	('SILVER GIRL','Cengage'),
	('THESE TRUTHS','Hachette Livre'),
	('WHITE DANCING ELEPHANTS','McGraw-Hill'),
	('THERE THERE','HarperCollins'),
	('LOCKED GRAY/LINKED BLUE','HarperCollins'),
	('EAT THE APPLE','Cengage'),
	('BACK TALK','Springer Nature')
;

INSERT INTO Book_Authors
	(AuthorName)
	VALUES
	('Stephen King'),
	('CHRISTIAN DI SPIGNA'),
	('ERICA WRIGHT'),
	('HANK PHILLIPPI RYAN'),
	('LESLIE PIETRZYK'),
	('JILL LEPORE'),
	('TANA FRENCH'),
	('CHAYA BHUVANESWAR'),
	('TOMMY ORANGE'),
	('KEM JOY UKWU')
;

 INSERT INTO Book_Copies
	(BookID, BranchID, Number_of_Copies)
	VALUES
	(1,1,2),
	(2,1,6),
	(3,1,4),
	(4,1,3),
	(5,1,2),
	(6,1,4),
	(7,1,8),
	(8,1,2),
	(9,1,3),
	(10,1,3),
	(11,1,5),
	/*(12,1,4),*/
	(13,1,3),
	(14,1,4),
	(15,1,5),
	(16,1,2),
	(17,1,6),
	(18,1,3),
	(19,1,8),
	(20,1,2),
	(1,2,2),
	(2,2,2),
	(3,2,4),
	(4,2,3),
	(5,2,2),
	(6,2,4),
	(7,2,8),
	(8,2,2),
	(9,2,3),
	(10,2,3),
	(11,2,5),
	(12,2,4),
	(13,2,3),
	(14,2,4),
	(15,2,5),
	(16,2,2),
	(17,2,6),
	(18,2,3),
	(19,2,8),
	(20,2,2),
	(1,3,2),
	(2,3,3),
	(3,3,4),
	(4,3,3),
	(5,3,2),
	(6,3,4),
	(7,3,8),
	(8,3,2),
	(9,3,3),
	(10,3,3),
	(11,3,5),
	(12,3,4),
	(13,3,3),
	(14,3,4),
	(15,3,5),
	(16,3,2),
	(17,3,6),
	(18,3,3),
	(19,3,8),
	(20,3,2),
	(1,4,2),
	(2,4,2),
	(3,4,4),
	(4,4,3),
	(5,4,2),
	(6,4,4),
	(7,4,8),
	(8,4,2),
	(9,4,3),
	(10,4,3),
	(11,4,5),
	(12,4,4),
	(13,4,3),
	(14,4,4),
	(15,4,5),
	(16,4,2),
	(17,4,6),
	(18,4,3),
	(19,4,8),
	(20,4,2),
	(1,5,2),
	(2,5,2),
	(3,5,4),
	(4,5,3),
	(5,5,2),
	(6,5,4),
	(7,5,8),
	(8,5,2),
	(9,5,3),
	(10,5,3),
	(11,5,5),
	(12,5,4),
	(13,5,3),
	(14,5,4),
	(15,5,5),
	(16,5,2),
	(17,5,6),
	(18,5,3),
	(19,5,8),
	(20,5,2),
	(1,6,2),
	(2,6,5),
	(3,6,4),
	(4,6,3),
	(5,6,2),
	(6,6,4),
	(7,6,8),
	(8,6,2),
	(9,6,3),
	(10,6,3),
	(11,6,5),
	(12,6,4),
	(13,6,3),
	(14,6,4),
	(15,6,5),
	(16,6,2),
	(17,6,6),
	(18,6,3),
	(19,6,8),
	(20,6,2),
	(1,7,2),
	(2,7,3),
	(3,7,4),
	(4,7,3),
	(5,7,2),
	(6,7,4),
	(7,7,8),
	(8,7,2),
	(9,7,3),
	(10,7,3),
	(11,7,5),
	(12,7,4),
	(13,7,3),
	(14,7,4),
	(15,7,5),
	(16,7,2),
	(17,7,6),
	(18,7,3),
	(19,7,8),
	(20,7,2)
;

INSERT INTO Borrower
	(Name, Addr, Phone)
	VALUES
	('Mike Lopez','MI','616-458-7815'),
	('Luis Gonzalez','WA','213-864-1858'),
	('Vincent Korimo', 'HI','808-346-7267'),
	('Yen Regis', 'LA','458-681-8688'),
	('David Cray', 'WA','213-818-9875'),
	('Mitchell Boggess', 'NV','702-245-8585'),
	('Tuan Vuu', 'NV','702-867-5309'),
	('John Smith','MI','616-123-4567')
;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1,1,1001,'04/25/2017','04/08/2020'),
	(13,1,1001,'5/13/2017','7/13/2018'),
	(3,1,1005,'6/10/2016','8/9/2018'),
	(4,1,1007,'8/12/2016','8/12/2017'),
	(5,1,1007,'7/24/2018', '1/24/2019'),
	(6,1,1002,'5/08/2017','4/8/2018'),
	(12,7,1001,'6/13/2017','4/21/2018'),
	(8,6, 1001,'2/10/2016','4/8/2018'),
	(6,7,1005,'6/13/2016','4/21/2019'),
	(18,6,1004,'2/10/2016','4/8/2020'),
	(5,1,1006,'04/25/2017','04/08/2019'),
	(6,3,1007,'5/13/2016', '7/13/2018'),
	(7,6,1002,'6/10/2016','8/9/2019'),
	(11,4,1002,'8/12/2017','8/12/2018'),
	(1,2,1002,'7/24/2018','9/24/2018'),
	(2,3,1004,'05/08/2016','4/8/2018'),
	(8,7,1005,'6/13/2002','4/21/2005'),
	(7,6,1003,'2/10/16','4/8/2018'),
	(9,7,1006,'6/13/2016','4/21/2019'),
	(6,6,1006,'2/10/2017','4/8/2018'),
	(16,1,1001,'04/25/2018','04/08/2019'),
	(3,3,1002,'5/13/2016','7/13/2018'),
	(8,6,1005,'6/10/2017','8/9/2018'),
	(1,4,1004,'8/12/2016','8/12/2018'),
	(5,2,1007,'3/24/2018','9/24/2018'),
	(7,3,1002,'05/08/2016','4/8/2018'),
	(4,5,1001,'6/13/2017', '4/21/2018'),
	(2,6,1003,'2/10/2015','4/8/2018'),
	(6,7,1003,'6/13/2002','4/21/2005'),
	(18,6,1004,'2/10/2001','4/8/2002'),
	(1,1,1005,'04/25/2005','04/08/2007'),
	(2,3,1006,'5/13/2005','7/13/2005'),
	(2,6,1005,'6/10/2005','8/9/2010'),
	(19,4,1004,'8/12/2010','8/12/2011'),
	(5,2,1007,'7/24/2018','9/24/2018'),
	(7,3,1001,'05/08/2006','4/8/2018'),
	(2,7,1001,'6/13/2002','4/21/2005'),
	(8,6,1001,'2/10/2005','4/8/2018'),
	(20,7,1001,'6/13/2002','4/21/2005'),
	(8,6,1001,'2/10/2009','4/8/2018'),
	(1,1,1001,'04/25/2010','04/08/2019'),
	(6,3,1001,'5/13/2005','7/13/2005'),
	(2,6,1005,'6/10/2005','8/9/2010'),
	(9,4,1004,'8/12/2010','8/12/2011'),
	(5,2,1007,'4/24/2014','9/24/2018'),
	(17,3,1001,'05/08/2013','4/8/2018'),
	(2,7,1001,'6/13/2002','4/21/2005'),
	(8,5,1001,'2/10/2003','4/8/2018'),
	(9,7,1001,'6/13/2002','4/21/2005'),
	(13,6,1001,'2/10/2006','4/8/2018'),
	(8,1,1001,'04/25/2008','04/08/2019'),
	(2,3,1001,'5/13/2005','7/13/2005'),
	(2,6,1005,'6/10/2005','8/9/2010'),
	(5,4,1004,'8/12/2010','8/12/2011'),
	(6,2,1007,'7/24/2018','9/24/2018'),
	(8,3,1001,'05/08/2005','4/8/2018'),
	(2,7,1001,'6/13/2002','4/21/2005'),
	(1,6,1001,'2/10/2008','4/8/2018'),
	(15,7,1001,'6/13/2002','4/21/2005'),
	(12,6,1001,'2/10/2015','4/8/2018')
;
GO

/* Stored Procedures */
/* #1 How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name 
is "Sharpstown"? */
CREATE PROC dbo.uspGetSharpstown100
AS
SELECT Title, Number_of_Copies, BranchName 
	FROM Books AS bk
	INNER JOIN Book_Copies AS bc
	ON bk.BookID=bc.BookID
	INNER JOIN Library_Branch AS lb
	ON bc.BranchID=lb.BranchID
	WHERE Title  + BranchName = 'The Lost Tribe' + 'Sharpstown'
GO

/* #2 How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
CREATE PROC dbo.uspGetLostTribe100
AS
SELECT Title, Number_of_Copies, BranchName 
	FROM Book_Copies AS bc
	INNER JOIN Books AS bk
	ON bc.BookID=bk.BookID
	INNER JOIN Library_Branch AS lb
	ON bc.BranchID=lb.BranchID
	WHERE Title = 'The Lost Tribe'
GO

/* #3 Retrieve the names of all borrowers who do not have any books checked out. */
CREATE PROC dbo.uspGetBorrower100
AS
SELECT Name, DateOut, DateDue
	FROM Borrower AS br
	FULL OUTER JOIN Book_Loans AS BC
	ON br.CardNo = BC.CardNo
	FULL OUTER JOIN Books AS bk
	ON BC.BookID=bk.BookID	
	Where DateOut IS NULL and DateDue IS NULL 
GO

/* #4 For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the 
book title, the borrower's name, and the borrower's address. */
CREATE PROC dbo.uspGetSharps100
AS
SELECT BranchName, DateDue, Title, Name, Addr 
	FROM Library_Branch AS lb
	INNER JOIN Book_Loans AS bl
	ON lb.BranchID=bl.BranchID
	INNER JOIN Books AS bk
	ON bl.BookID=bk.BookID
	INNER JOIN Borrower AS br
	ON br.CardNo=bl.CardNo
	WHERE BranchName = 'Sharpstown'
GO

/* #5 For each library branch, retrieve the branch name and the total number of books loaned out from 
that branch. */
CREATE PROC dbo.uspGetBooksBranch100
AS
SELECT Library_Branch.BranchName, COUNT(Book_Loans.BookID) AS NumBooksOut
	FROM (Book_Loans 
	INNER JOIN Library_Branch ON Book_Loans.BranchID=Library_Branch.BranchID) 
	GROUP BY BranchName
GO

/* #6 Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than 
five books checked out. */
CREATE PROC dbo.uspGetCheckedOut100
AS
SELECT Borrower.Name, Borrower.Addr, COUNT(Book_Loans.CardNo) AS LoanedBooks
	FROM (Book_Loans
	INNER JOIN Borrower ON Book_Loans.CardNo=Borrower.CardNo)
	GROUP BY Name, Addr 
	HAVING COUNT(*) > 5
GO

/* #7 For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies 
owned by the library branch whose name is "Central". */
CREATE PROC dbo.uspGetStephenKing100
AS
SELECT AuthorName, BranchName, Number_of_Copies
	FROM Book_Authors AS ba
	INNER JOIN Books AS bk
	ON ba.BookID=bk.BookID
	INNER JOIN Book_Copies AS bc
	ON bk.BookID=bc.BookID
	INNER JOIN Library_Branch as lb
	ON lb.BranchID=bc.BranchID
	WHERE AuthorName + BranchName = 'Stephen King' + 'Central'
GO

/* Stored Proc Executions */
EXEC dbo.uspGetSharpstown100
EXEC dbo.uspGetLostTribe100
EXEC dbo.uspGetBorrower100
EXEC dbo.uspGetSharps100
EXEC dbo.uspGetBooksBranch100
EXEC dbo.uspGetCheckedOut100
EXEC dbo.uspGetStephenKing100
