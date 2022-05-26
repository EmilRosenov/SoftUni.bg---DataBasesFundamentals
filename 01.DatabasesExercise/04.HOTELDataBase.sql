
 CREATE DATABASE HOTEL
 CREATE TABLE Employees 
 (
 --(Id, FirstName, LastName, Title, Notes)
	Id INT PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(40) NOT NULL,
	LastName NVARCHAR(40) NOT NULL,
	Title NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(300)
 )

 
 INSERT INTO Employees(Id, FirstName, LastName, Title, Notes)
 VALUES
 (1, 'Emil', 'Velichkov', 'Manager', NULL),
 (2, 'Kiro', 'Breika', 'Fitness Coach', 'Can find him in the gym'),
 (3, 'Vesko', 'Breikov', 'Kiros Assistent', 'Can find him filming Kiro')

 SELECT * FROM Employees


 CREATE TABLE Customers 
 (
	AccountNumber VARCHAR(10) PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(40) NOT NULL,
	LastName NVARCHAR(40) NOT NULL,
	PhoneNumber VARCHAR(10) NOT NULL,
	EmergencyName NVARCHAR(40) NOT NULL,
	EmergencyNumber VARCHAR(10) NOT NULL,
	Notes NVARCHAR(300)
 )
 
 INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
 VALUES
 ('VEGA001','Jack', 'Daniels', '0885102030', 'Krisko','0885202030', 'Pie Whisky'),
  ('VEGA002','Thomas', 'Edison', '0885302030', 'Disko','0885202020', 'Sveti silno'),
   ('VEGA003','Stefka', 'Kostadinova', '0885102010', 'Srisko','0885203030', 'Skacha visoko')

   SELECT * FROM Customers
 
 CREATE TABLE Payments 
 (
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT NOT NULL,
	PaymentDate DATE NOT NULL,
	AccountNumber NVARCHAR(10) NOT NULL,
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL NOT NULL,
	TaxRate DECIMAL NOT NULL,
	TaxAmount DECIMAL NOT NULL,
	PaymentTotal DECIMAL NOT NULL,
	Notes NVARCHAR(300)
 )
 
 
 INSERT INTO Payments(Id, EmployeeId, PaymentDate, 
 AccountNumber, FirstDateOccupied, LastDateOccupied,
  TotalDays, AmountCharged, TaxRate, TaxAmount,
   PaymentTotal, Notes)
   VALUES
   (1, 1122, '2022/01/22', 'Staff1122', '2021/12/22', '2022/01/22', 30, 27.34, 12.12,10.00, 300.30,NULL),
   (2, 1123, '2022/01/27', 'Staff1123', '2021/12/27', '2022/01/27', 35, 27.34, 12.12,10.00, 350.35,NULL),
   (3, 1124, '2022/01/25', 'Staff1124', '2021/12/25', '2022/01/24', 32, 27.34, 12.12,10.00, 320.32,NULL)

   SELECT * FROM Payments
 

 CREATE TABLE Occupancies  
 (
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT NOT NULL,
	DateOccupied DATE NOT NULL,
	AccountNumber NVARCHAR(10) NOT NULL,
	RoomNumber INT NOT NULL,
	RateApplied DECIMAL NOT NULL,
	PhoneCharge DECIMAL NOT NULL,
	Notes NVARCHAR(300)
 )
 
 INSERT INTO Occupancies(Id, EmployeeId, DateOccupied,
  AccountNumber, RoomNumber, RateApplied, PhoneCharge,
  Notes)
  VALUES
  (1, 1122, '2021-12-22', 'Staff1122', 33, 12, 5.44, NULL),
  (2, 1123, '2021-12-27', 'Staff1123', 35, 12, 2.19, NULL),
  (3, 1124, '2021-12-25', 'Staff1124', 37, 12, 3.87, NULL)

  SELECT * FROM Occupancies
 --Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus,
 --Notes)
 CREATE TABLE Rooms  
 (
	
	RoomNumber INT PRIMARY KEY NOT NULL,
	RoomType NVARCHAR(40) NOT NULL,
	BedType NVARCHAR(40) NOT NULL,
	Rate DECIMAL NOT NULL,
	RoomStatus NVARCHAR(40) NOT NULL,
	Notes NVARCHAR(300)
 )
 
 
 INSERT INTO Rooms
 (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
 VALUES
 (1, 'Double', 'Single', 52.50, 'Available','Open for booking'),
 (2, 'Apartament', 'Double', 62.50, 'Unavailable','N/A'),
 (3, 'Studio', 'Coach', 42.50, 'Occuppied','N/A')

 SELECT * FROM Rooms
 
 --RoomStatus (RoomStatus, Notes)
 CREATE TABLE RoomStatus  
 (
	RoomStatus NVARCHAR(40) PRIMARY KEY NOT NULL,
	Notes NVARCHAR(300)
 )
 --RoomTypes (RoomType, Notes)
 CREATE TABLE RoomTypes  
 (
	RoomTypes NVARCHAR(40) PRIMARY KEY NOT NULL,
	Notes NVARCHAR(300)
 )
 --BedTypes (BedType, Notes)
 CREATE TABLE BedTypes  
 (
	BedType NVARCHAR(40) PRIMARY KEY NOT NULL,
	Notes NVARCHAR(300)
 )
 


 INSERT INTO BedTypes (BedType, Notes) VALUES
 ('Single', NULL),
 ('Double', 'Kingsize'),
 ('Coach', 'Twin')

 SELECT * FROM BedTypes

 INSERT INTO RoomTypes (RoomTypes, Notes) VALUES
 ('Studio','Room with toilet and kitchen facilities'),
 ('Double', 'Two rooms with toilet and kitchen facilities'),
 ('Apartament', NULL)

 SELECT * FROM RoomTypes

  INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
 ('Available','Room is available'),
 ('Occuppied', 'Room is occupied'),
 ('Unavailable', 'Under repairment')

  SELECT * FROM RoomStatus