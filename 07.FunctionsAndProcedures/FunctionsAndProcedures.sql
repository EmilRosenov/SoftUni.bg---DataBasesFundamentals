--VARIABLES  -00:47 YT FUNCANDPROCED.
GO
DECLARE @variable SMALLINT= 2011
SELECT @variable AS [Var]
SET @variable +=1
SELECT @variable

GO
DECLARE @MyTempTable TABLE (Id INT PRIMARY
  KEY IDENTITY, NAME VARCHAR(50))

  INSERT INTO @MyTempTable ([NAME]) VALUES ('NIKI')
  SELECT * FROM @MyTempTable

GO

--CONDITIONAL STATEMENTS -18:47 YT FUNCANDPROCED.
DECLARE @year2 SMALLINT = 2000;
SELECT @year2 AS [When declared];

IF YEAR(GETDATE())=2022
	SET @year2 = 2001;
SELECT @year2 AS[Updated];

IF YEAR(GETDATE())=2023
	SET @year2 = 2001;
SELECT @year2 AS[NOTUpdated];

--CASE WHEN

DECLARE @MyTempTable TABLE (Id INT PRIMARY
  KEY IDENTITY, NAME VARCHAR(50))
DECLARE @year3 SMALLINT = 2022
  SELECT CASE @year3
       WHEN 2020 THEN '2020'
	   WHEN 2021 THEN '2021'
	   ELSE '2023!!!'
  END AS [Case]

  GO

--LOOPS 31:07 YT FUNCANDPROCED.

DECLARE @year SMALLINT = 2000
SELECT COUNT(*) FROM Employees
WHERE YEAR(HireDate) = @year

GO
DECLARE @year SMALLINT = 1997;

WHILE @year <= 2008
BEGIN 
     SELECT @year AS[Year],  COUNT(*) AS [Employees Hired]
	   FROM [Employees]
      WHERE YEAR(HireDate) = @year
	    SET @year = @year + 1
END

GO

--FUNCTIONS AND STORED PROEDURES YT 39:00

--1 UDF FUNCTIONS (USER DEFINED)
GO
SELECT dbo.udf_BigPower(2,100) AS[Result]   --SCALAR FUNC
--DROP FUNCTION dbo.udf_BigPower
--CREATE FUNCTION udf_BigPower(@Base INT, @Exp INT)
--RETURNS DECIMAL(38)
--AS
--BEGIN
--     DECLARE @Result DECIMAL(38) = 1

--     WHILE (@Exp > 0)
--     BEGIN
--	    SET @Result = @Result * @Base 
--	    SET @Exp = @Exp -1
--     END
--     RETURN @Result
--END

SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Salary]
      ,dbo.udf_BigPower(Salary,2) AS[SalaryPOWEREDby2]
  FROM [SoftUni].[dbo].[Employees]


  --TABLE VALUED FUNCTION YT 1:39:00

  CREATE OR ALTER VIEW EmployeesByYear 
  AS SELECT * FROM [Employees] 
  WHERE YEAR(HireDate) = 2002

  SELECT * FROM EmployeesByYear

  CREATE OR ALTER FUNCTION udf_EmployeesByYear(@Year SMALLINT)
  RETURNS TABLE
  AS
  RETURN(SELECT * FROM [Employees] 
  WHERE YEAR(HireDate) = @Year)
  
  SELECT * FROM dbo.udf_EmployeesByYear(1999)


  CREATE FUNCTION udf_AllPowers(@MaxPower INT)
  RETURNS @TableResults TABLE(Id INT IDENTITY PRIMARY KEY, SQUARE BIGINT) 
  AS 
  BEGIN
		DECLARE @I INT = 1;
		WHILE(@MaxPower >=@I)
		     BEGIN
		          INSERT INTO @TableResults (SQUARE) VALUES (@I*@I);
			      SET @I +=1;
		     END
		RETURN
  END

  SELECT * FROM dbo.udf_AllPowers(100)
  WHERE SQUARE % 3 = 0    --% 2 = 1
  ORDER BY SQUARE DESC

  --PROBLEM SALARY LVL
  GO

 
CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@Salary MONEY)
RETURNS VARCHAR(7)
AS
BEGIN
    IF @Salary < 30000 
        RETURN 'Low'
    ELSE IF @Salary <= 50000 
        RETURN 'Average'

    RETURN 'High'
END


 SELECT dbo.ufn_GetSalaryLevel(46000)

 
 SELECT [FirstName],[LastName],[Salary], dbo.ufn_GetSalaryLevel([Salary])
 FROM [Employees]

 --stored procedures 
 CREATE PROC sp_RecreateProjects
 AS
     INSERT INTO Projects(Name, Description, StartDate,EndDate)
		SELECT '[NEW]' + Name, Description, StartDate,EndDate 
		FROM Projects
 GO

 EXECUTE [dbo].[sp_RecreateProjects]


 --stored procedures WITH PARAMETERS YT 02:39:40
 GO
 
CREATE OR ALTER PROC sp_AddEmployeeToProject(@EmployeeId INT,@ProjectId INT)
AS
 
    DECLARE @CountEmployeeProject INT =
	(
	SELECT COUNT(*) FROM [EmployeesProjects]
	WHERE [EmployeeID] = @EmployeeId 
	AND [ProjectID] =@ProjectId
	)

	IF @CountEmployeeProject > 0 
	THROW 50001, 'This employee is already in the project',1

	INSERT INTO [EmployeesProjects] ([EmployeeID],[ProjectID])
	VALUES(@EmployeeId,@ProjectId)

GO

--1ST TIME ADDS THE EMPLOYEE
--2ND TIME THROWS:  50001, 'This employee is already in the project',1
EXEC sp_AddEmployeeToProject 1,104

--TRY..CATCH    YT 03:25:00
CREATE PROC sp_AddToProject(@EmployeeId INT, @ProjectId INT)
AS
     DECLARE @EmployeesProjects INT = (
	 SELECT COUNT(*) FROM EmployeesProjects
	 WHERE EmployeeID = @EmployeeId 
	 )

	 IF	(@EmployeesProjects >=3)
	 THROW 50001, 'Employee has more than 3 projects',1
		
     DECLARE @EmployeeInThisProjectCount INT = (
	 SELECT COUNT(*) FROM EmployeesProjects
	 WHERE EmployeeID = @EmployeeId AND ProjectID =@ProjectId
	 )

	 IF	(@EmployeeInThisProjectCount >=1)
	 THROW 50002, 'Employee already in this project',1

	 INSERT INTO EmployeesProjects ([EmployeeID],[ProjectID])
	 VALUES(@EmployeeId,@ProjectId)
GO

EXEC sp_AddToProject 2,1
EXEC sp_AddToProject 2,2
EXEC sp_AddToProject 2,3
EXEC sp_AddToProject 2,4
--Msg 50001, Level 16, State 1, Procedure sp_AddToProject, Line 9 [Batch Start Line 207]
--Employee has more than 3 projects