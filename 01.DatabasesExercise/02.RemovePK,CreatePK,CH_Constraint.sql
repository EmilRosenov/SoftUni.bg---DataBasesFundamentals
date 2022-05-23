CREATE DATABASE People
USE People
CREATE TABLE People1
(
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARCHAR(MAX),
	[Height] DECIMAL,
	[Weight] DECIMAL,
	Gender CHAR(1) NOT NULL,
	[Birthdate] DATETIME  NOT NULL,
	Biography VARCHAR(MAX)
	)

SELECT * FROM People1
INSERT INTO People1
(Id, Name, Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES

 (1, 'Emil', NULL, 173, 85, 'M', '1-13-1988', NULL),
 (2, 'Vesko', NULL, 173, 85, 'M', '4-12-1988', NULL),
 (3, 'Kiro', NULL, 173, 85, 'M', '5-11-1988', NULL),
 (4, 'Breika', NULL, 173, 85, 'M', '6-10-1988', NULL),
 (5, 'Plamen', NULL, 173, 85, 'M', '7-11-1988', NULL)

 SELECT * FROM People1

 CREATE TABLE Users
(
	Id BIGINT PRIMARY KEY,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	Picture NVARCHAR(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT NOT NULL
)
 
 INSERT INTO Users(Id, [Username], [Password], Picture, LastLoginTime, IsDeleted)
 VALUES
 (1, 'Emil', 'zdrasti', NULL, '1988-01-13 07:15:10', 1),
 (2, 'Vesko', 'AAAAzdrasti', NULL, '1988-01-19 09:35:10', 0),
 (3, 'Kiro','Azdrasti', NULL, '1988-01-18 07:45:00', 0),
 (4, 'Breika','AAzdrasti', NULL, '1988-01-17 11:25:13', 1),
 (5, 'Plamen', 'AAAzdrasti', NULL, '1988-01-15 17:52:19', 0)

 DROP TABLE Users

 CREATE TABLE Users
(
	Id BIGINT PRIMARY KEY,
	[Username] VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	Picture NVARCHAR(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT NOT NULL
)
 
 INSERT INTO Users(Id, [Username], [Password], Picture, LastLoginTime, IsDeleted)
 VALUES
 (1, 'Emil', 'zdrasti', NULL, '1988-01-13 07:15:10', 1),
 (2, 'Vesko', 'AAAAzdrasti', NULL, '1988-01-19 09:35:10', 0),
 (3, 'Kiro','Azdrasti', NULL, '1988-01-18 07:45:00', 0),
 (4, 'Breika','AAzdrasti', NULL, '1988-01-17 11:25:13', 1),
 (5, 'Plamen', 'AAAzdrasti', NULL, '1988-01-15 17:52:19', 0)

  SELECT * FROM Users

 ALTER TABLE Users
 DROP CONSTRAINT PK__Users__3214EC0737E65713

 ALTER TABLE Users
 ADD CONSTRAINT PK__IdUsernames PRIMARY KEY(Id,Username)
 
 SELECT * FROM Users

 ALTER TABLE Users
ADD CONSTRAINT CH_CheckPasswordIsMoreThan5Symbols CHECK (LEN(Password)>=5)
SELECT * FROM Users
