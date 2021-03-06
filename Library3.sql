CREATE DATABASE db_library44;
USE db_library44;

/* Table 1: Library Branch. */
CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAdd VARCHAR(50) NOT NULL,
);

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

SELECT * FROM Library_Branch;
/* End Table: Library Branch. */

/* Table: Books. */
CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

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

SELECT * FROM Books;
/* End Table: Books. */

/* Table: Publisher. */
CREATE TABLE Publisher (
	PublisherID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	PublisherName VARCHAR(50) NOT NULL,
	Addr VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

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

SELECT * FROM Publisher;
/* End Table: Publisher. */

/* Table: Book Authors. */
CREATE TABLE Book_Authors (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	AuthorName VARCHAR(50) NOT NULL
);

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

SELECT * FROM Book_Authors;
/* End Table: Book Authors. */

/* Table: Borrower. */
CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL Identity (1001,1),
	Name VARCHAR(50) NOT NULL,
	Addr VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

INSERT INTO Borrower
	(Name, Addr, Phone)
	VALUES
	('Mike Lopez','MI','616-458-7815'),
	('Luis Gonzalez','WA','213-864-1858'),
	('Vincent Korimo', 'HI','808-346-7267'),
	('Yen Regis', 'LA','458-681-8688'),
	('David Cray', 'WA','213-818-9875'),
	('Mitchell Boggess', 'NV','702-245-8585'),
	('Tuan Vuu', 'NV','702-867-5309')
;

SELECT * FROM Borrower;
/* End Table: Borrower. */

/* Table: Book Copies. */ 
CREATE TABLE Book_Copies (
	 BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	 BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	 Number_of_Copies VARCHAR(50) NOT NULL
 );

 INSERT INTO Book_Copies
	(BookID, BranchID, Number_of_Copies)
	VALUES
	(1,1,2),
	(2,1,2),
	(4,6,2),
	(2,2,2),
	(11,2,2),
	(2,7,4),
	(14,1,2),
	(19,4,3),
	(2,3,5),
	(11,6,2),
	(13,5,8),
	(16,5,2),
	(17,7,9),
	(18,2,2),
	(7,4,3),
	(4,5,4),
	(3,4,2),
	(14,4,2),
	(11,2,5),
	(17,5,3),
	(18,6,2),
	(20,7,2),
	(20,4,4),
	(1,2,2),
	(16,4,2)
;

SELECT * FROM Book_Copies;
/* End Table: Book Copies. */

/* Table: Book Loans. */
CREATE TABLE Book_Loans (
	BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DateDue VARCHAR(50) NOT NULL
);

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 1, 1001, '04/25/1986', '04/08/2019'),
	(2, 3, 1001, '5/13/2005', '7/13/2005'),
	(2, 6, 1005, '6/10/2005','8/9/2010'),
	(19, 4, 1004, '8/12/2010', '8/12/2011'),
	(15, 2, 1007, '7/24/2018', '9/24/2018'),
	(17, 3, 1001, '5/08/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018'),
	(16, 7, 1003, '6/13/2002', '4/21/2005'),
	(18, 6, 1004, '2/10/1974', '4/8/2018'),
	(5, 1, 1006, '04/25/1986', '04/08/2019'),
	(6, 3, 1007, '5/13/2005', '7/13/2005'),
	(7, 6, 1002, '6/10/2005', '8/9/2010'),
	(19, 4, 1002, '8/12/2010', '8/12/2011'),
	(15, 2, 1002, '7/24/2018', '9/24/2018'),
	(17, 3, 1004, '05/08/1974', '4/8/2018'),
	(20, 7, 1005, '6/13/2002', '4/21/2005'),
	(18, 6, 1003, '2/10/1974', '4/8/2018'),
	(13, 7, 1006, '6/13/2002', '4/21/2005'),
	(14, 6, 1006, '2/10/1974', '4/8/2018'),
	(15, 1, 1001, '04/25/1986', '04/08/2019'),
	(20, 3, 1002, '5/13/2005', '7/13/2005'),
	(20, 6, 1005, '6/10/2005', '8/9/2010'),
	(11, 4, 1004, '8/12/2010', '8/12/2011'),
	(15, 2, 1007, '7/24/2018', '9/24/2018'),
	(17, 3, 1002, '05/08/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1003, '2/10/1974', '4/8/2018'),
	(20, 7, 1003, '6/13/2002', '4/21/2005'),
	(18, 6, 1004, '2/10/1974', '4/8/2018'),
	(1, 1, 1005, '04/25/1986', '04/08/2019'),
	(2, 3, 1006, '5/13/2005', '7/13/2005'),
	(2, 6, 1005, '6/10/2005', '8/9/2010'),
	(19, 4, 1004, '8/12/2010', '8/12/2011'),
	(15, 2, 1007, '7/24/2018', '9/24/2018'),
	(17, 3, 1001, '05/08/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018'),
	(1, 1, 1001, '04/25/1986', '04/08/2019'),
	(2, 3, 1001, '5/13/2005', '7/13/2005'),
	(2, 6, 1005, '6/10/2005', '8/9/2010'),
	(19, 4, 1004, '8/12/2010', '8/12/2011'),
	(15, 2, 1007, '7/24/2018', '9/24/2018'),
	(17, 3, 1001, '05/08/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018'),
	(1, 1, 1001, '04/25/1986', '04/08/2019'),
	(2, 3, 1001, '5/13/2005', '7/13/2005'),
	(2, 6, 1005, '6/10/2005', '8/9/2010'),
	(19, 4, 1004, '8/12/2010', '8/12/2011'),
	(15, 2, 1007, '7/24/2018', '9/24/2018'),
	(17, 3, 1001, '05/08/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018'),
	(20, 7, 1001, '6/13/2002', '4/21/2005'),
	(18, 6, 1001, '2/10/1974', '4/8/2018')

;
SELECT * FROM Book_Loans;
/* End Table: Loans. */
/*----------------------------------------------------------------------------------------------------------*/
/* Stored Proc 1. */
CREATE PROCEDURE dbo.uspGetSharpstown
AS

SELECT *
	FROM Library_Branch AS brnc
	FULL OUTER JOIN Books AS bks
	ON brnc.BranchID = bks.BookID
	FULL OUTER JOIN Book_Copies AS cop
	ON brnc.BranchID = cop.Number_of_Copies
	WHERE BranchName = 'Sharpstown'
GO	
EXEC dbo.uspGetSharpstown
/* End Stored Proc 1. */

/* Stored Proc 2. */
CREATE PROC dbo.uspGetLostTribe
AS

SELECT * 
	FROM Library_Branch AS brnc
	FULL OUTER JOIN Books AS bks
	ON brnc.BranchID = bks.BookID
	FULL OUTER JOIN Book_Copies AS cop
	ON brnc.BranchID = cop.Number_of_Copies
	ORDER BY BranchName
GO
EXEC dbo.uspGetLostTribe
/* End Stored Proc 2. */

/* Stored Proc 3. */
CREATE PROC dbo.uspGetBorrower
AS

SELECT *
	FROM Borrower AS br
	LEFT JOIN Book_Copies AS BC
	ON br.Name = BC.Number_of_Copies
	RIGHT JOIN Book_Loans AS bl
	ON BC.Number_of_Copies = bl.BookID
	ORDER BY Name

EXEC dbo.uspGetBorrower
/* End Stored Proc 4. */

/* Stored Proc 5. */
CREATE PROC dbo.uspGetSharps2
AS

SELECT * 
	FROM Borrower AS br
	FULL OUTER JOIN Books AS bk
	ON br.Name = bk.Title
	FULL OUTER JOIN Book_Loans AS bl
	ON bl.DateDue = bk.Title
	ORDER BY Name

EXEC dbo.uspGetSharps2
/* End Stored Proc 5. */

/* Stored Proc 6. */
CREATE PROC dbo.uspGetBranchLoans
AS

SELECT * 
	FROM Library_Branch AS lb
	FULL OUTER JOIN Book_Loans AS bl
	ON lb.BranchName = bl.BookID
	ORDER BY BranchName

EXEC dbo.uspGetBranchLoans
/* End Stored Proc 6. */

/* Stored Proc 7. */
CREATE PROC dbo.uspGetCheckedOut
AS

SELECT * 
	FROM Borrower AS br
	FULL OUTER JOIN Book_Loans AS bl
	ON br.Name = bl.BookID
	ORDER BY Name

EXEC dbo.uspGetCheckedOut
/* End Stored Proc 7. */

/* Stored Proc 8. */
CREATE PROC dbo.uspGetTheGod
AS

SELECT *
	FROM Book_Authors AS au
	FULL OUTER JOIN Books AS t
	ON au.AuthorName = t.Title
	FULL OUTER JOIN Library_Branch AS lb
	ON au.AuthorName = lb.BranchName 
	FULL OUTER JOIN Book_Copies AS bc
	ON au.AuthorName = bc.Number_of_Copies
	WHERE AuthorName = 'Stephen King'

EXEC dbo.uspGetTheGod
/* End Stored Proc 8. */