CREATE DATABASE LibraryDB

USE LibraryDB

CREATE TABLE Authors
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(50) NOT NULL
)

CREATE TABLE Books
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) CHECK(LEN(Name)>2),
	AuthorID INT  FOREIGN KEY REFERENCES Authors(ID),
	PageCountDB INT
)

INSERT INTO Authors 
VALUES
('Sofya','Tolstaya'),
('Etel Lilion','Voynic'),
('George R','Martin'),
('Francisco','Ayala'), 
('Karen','Armstrong'),
('Grigory','Petrov')

SELECT * FROM Authors

INSERT INTO Books
VALUES
('Mənim Həyatım',1,232),
('The Mystery Knight',3,160),
('Cek Reymond',2,152),
('Evrim',4,220),
('Mifin Qısa Tarixi',5,116),
('Ağ Zanbaqlar Ölkəsi',6,176)

SELECT * FROM Books



CREATE VIEW Firstview AS 
SELECT ID, Name, PageCountDB , AuthorID AS AuthorFullName
FROM Books

SELECT * FROM Books AS B
INNER JOIN Authors ON B.ID=Authors.ID

SELECT * FROM Firstview



CREATE PROCEDURE SelecBook
@search NVARCHAR(50)
AS
SELECT * FROM Books WHERE (Name LIKE '%'+@search+'%' )
GO;

EXEC SelectAllBook 'Ev';