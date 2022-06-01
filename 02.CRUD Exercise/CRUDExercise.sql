--Problem 1
--load databases Softuni, Diablo, Geography

--Problem 2
USE [SoftUni]
SELECT * FROM Departments

--Problem 3
SELECT [Name]
  FROM [Departments]

  --Problem 4
SELECT [FirstName]
	  ,[LastName]
	  ,[Salary]
  FROM Employees

 --Problem 5
SELECT [FirstName]
	  ,[MiddleName]
	  ,[LastName]
  FROM [Employees]

  --Problem 6
SELECT [FirstName] + '.' + [LastName] + '@' + 'softuni.bg'
    AS [Full Email Address]
	FROM [Employees]

	--Problem 6
SELECT DISTINCT [Salary]
  FROM [Employees]

  	--Problem 7
SELECT *
  FROM [Employees]
  WHERE [JobTitle] = 'Sales Representative'

  --Problem 8
SELECT [FirstName]
	  ,[LastName]
	  ,[JobTitle]
  FROM [Employees]
  WHERE [Salary] BETWEEN 20000 AND 30000

   --Problem 9
SELECT [FirstName] + 
       ' ' + [MiddleName] + 
	   ' ' + [LastName]
	AS [Ful lName]
  FROM [Employees]
  WHERE [Salary] IN (25000, 14000 ,12500, 23600) 

     --Problem 10
  SELECT [FirstName], [LastName] 
  FROM Employees
  WHERE [ManagerID] IS NULL


       --Problem 11
SELECT [FirstName]
	  ,[LastName]
	  ,[Salary] 
  FROM [Employees]
 WHERE [Salary]  >= 50000 
 ORDER BY [Salary] DESC 

  --Problem 12
SELECT TOP (5)
	   [FirstName]
	  ,[LastName]
  FROM [Employees]
 WHERE [Salary]  >= 50000 
 ORDER BY [Salary] DESC 

 --Problem 13
SELECT [FirstName]
	  ,[LastName]
  FROM [Employees]
 WHERE [DepartmentID]  != 4 

 --Problem 14
    SELECT *
    FROM [Employees]
ORDER BY [Salary] DESC
        ,[FirstName] ASC
		,[LastName] DESC
		,[MiddleName] ASC

--Problem 15. Create View Employees with Salaries
 

--Problem 16. Create View Employees with Job Titles


--Problem 17. Distinct Job Titles
SELECT DISTINCT [JobTitle]
 FROM [Employees]
      
--Problem 18. First 10 Started Projects
SELECT TOP (10) * 
		FROM [Projects]
		ORDER BY [StartDate] ASC, [Name] ASC

--Problem 19. Last 7 Hired Employees

SELECT TOP (7) [FirstName], [LastName], [HireDate] 
		FROM [Employees]
		ORDER BY [HireDate] DESC

--Problem 20. Increase Salaries
SELECT *
  FROM [Departments]
  WHERE [Name] IN('Engineering', 'Tool Design', 'Marketing', 'Information Services')

UPDATE [Employees]
   SET [Salary] *= 1.12 
 WHERE [DepartmentID] IN (1, 2, 4, 11)

 SELECT [Salary]
   FROM [Employees]

USE [Geography]
  SELECT [PeakName]
    FROM [Peaks]
ORDER BY [PeakName] ASC
  

SELECT * FROM Countries

SELECT TOP(30) [CountryName]
			  ,[Population]
          FROM [Countries]
		 WHERE [ContinentCode] IN ('EU')
		  ORDER BY [Population] DESC, [CountryName] ASC

--23. Countries and Currency (Euro / Not Euro)
  SELECT [CountryName], [CurrencyCode], 
		 CASE
		 WHEN [CurrencyCode]='EUR' THEN 'Euro'
		 ELSE 'Not Euro'
		 END AS [Currency]
	FROM [Countries]
ORDER BY [CountryName]

--24. All Diablo characters (Alphabetical)
USE [Diablo]

    SELECT [Name]
      FROM [Characters]
  ORDER BY [Name] ASC




