--Problem 01. Employee Address 
SELECT TOP(5)
         [EmployeeID],
	     [JobTitle],
	     [a].[AddressID], 
	     [a].[AddressText] AS [AddressText]
    FROM [Employees] AS [e]
    JOIN [Addresses] AS [a] ON [e].[AddressID] = [a].[AddressID]
ORDER BY [a].[AddressID]

--Problem 02.	Addresses with Towns
SELECT TOP(50)
		  [e].[FirstName]
		  ,[e].LastName
		  ,[t].[Name] AS [Town]
		  ,[a].AddressText
	 FROM [Employees] AS [e]
LEFT JOIN [Addresses] AS [a] ON [e].AddressID = [a].[AddressID]	
LEFT JOIN [Towns] AS [t] ON [a].[TownID]= [t].[TownID]  
 ORDER BY [e].[FirstName], [e].[LastName]

 --Problem 03.	Sales Employee
    SELECT				
           [e].[EmployeeID], 
		   [e].[FirstName], 
		   [e].[LastName], 
		   [d].[Name] AS [DepartmentName]
     FROM [Employees] AS [e]
LEFT JOIN [Departments] AS [d] ON [e].[DepartmentID]  = [d].[DepartmentID]
    WHERE [d].[Name]='Sales'
 ORDER BY [e].[EmployeeID]

--Problem 04.	Employee Departments
SELECT TOP(5)
		  [e].[EmployeeID],
		  [e].[FirstName],
		  [e].[Salary], 
		  [d].[Name] AS [DepartmentName]
     FROM [Employees] AS [e]
     JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
    WHERE [e].[Salary] > 15000
 ORDER BY [d].[DepartmentID]

 --Problem 05.  Employees Without Projects
 SELECT TOP(3) [e].[EmployeeID], [e].[FirstName]
            FROM [Employees] AS [e]
       LEFT JOIN [EmployeesProjects] AS [ep] 
              ON [e].[EmployeeID] = [ep].[EmployeeID]
	       WHERE [ep].[ProjectID] IS NULL

--Problem 06.  Employees Hired After
  SELECT [e].[FirstName],
		 [e].[LastName], 
		 [e].[HireDate],
		 [d].[Name] AS [DeptName]
    FROM [Employees] AS [e]
    JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
     AND [HireDate] > '1999/01/01'
     AND [d].[Name] IN ('Sales', 'Finance')
ORDER BY [e].[HireDate]
 

--Problem 07. Employees With Project
SELECT TOP(5)
         [e].[EmployeeID]
	     ,[e].[FirstName]
	     ,[p].[Name] AS [ProjectName]
    FROM [Employees] AS [e]
    JOIN [EmployeesProjects] AS [ep]
      ON [e].[EmployeeID] = [ep].[EmployeeID]
    JOIN [Projects] AS [p] ON [ep].[ProjectID] = [p].[ProjectID]
     AND [p].[StartDate] > '2002/08/13'
     AND [p].[EndDate] IS NULL
ORDER BY [EmployeeID] ASC


--Problem 08. Employee 24 
SELECT TOP(5)
          [e].[EmployeeID],
	      [e].[FirstName],
		  CASE
		       WHEN DATEPART(YEAR,[p].[StartDate]) >= 2005 THEN NULL
		       ELSE [p].[Name]
		  END  AS [ProjectName]
    FROM [Employees] AS [e]
    JOIN [EmployeesProjects] AS [ep] 
      ON [e].[EmployeeID] = [ep].[EmployeeID] 
    JOIN [Projects] AS [p] 
      ON [ep].[ProjectID] = [p].[ProjectID]
   WHERE [e].[EmployeeID] = 24



--Problem 09. Employee Manager 
      SELECT [e].[EmployeeID],
      	     [e].[FirstName],
      	     [em].[EmployeeID] AS [ManagerID],
      	     [em].[FirstName] AS [ManagerName]
        FROM [Employees] AS [e] 
        JOIN [Employees] AS [em] 
          ON [em].[EmployeeID] =  [e].[ManagerID]  AND [e].[ManagerID] IN (3,7)

--Problem 10. Employee Summary 	
SELECT TOP(50)
         [emp].[EmployeeID],
         [emp].[FirstName] + ' ' + [emp].[LastName] AS [EmployeeName],
  	     [mng].[FirstName] + ' ' + [mng].[LastName] AS [ManagerName],
  	     [d].[Name] AS [DepartmentName]
    FROM [Employees] AS [emp]
    JOIN [Employees] AS [mng] 
      ON [emp].[ManagerID] = [mng].[EmployeeID]
    JOIN [Departments] AS [d]
      ON [emp].[DepartmentID] = [d].[DepartmentID]
ORDER BY [emp].[EmployeeID]

--Problem 11.   Min Average Salary
SELECT TOP(1) AVG([Salary]) AS [MinAverageSalary]
    FROM [Employees] AS [e]
    JOIN [Departments] AS[d] ON [e].[DepartmentID] = [d].[DepartmentID]
GROUP BY [e].[DepartmentID] 
ORDER BY [MinAverageSalary] 

--Problem 12. Highest Peaks in Bulgaria
GO  
USE [Geography]
GO

SELECT   [c].[CountryCode],
         [m].[MountainRange], 
		 [p].[PeakName],
	     [p].[Elevation]
    FROM [Countries] AS [c]
    JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode]=[mc].[CountryCode]
    JOIN [Mountains] AS [m] ON [mc].[MountainId] = [m].[Id]
    JOIN [Peaks] AS [p] ON [m].[Id] = [p].[MountainId]
   WHERE [c].[CountryCode] ='BG' AND [p].Elevation > 2835
ORDER BY [p].[Elevation] DESC


--Problem 13. Count Mountain Ranges
SELECT [c].[CountryCode],
       COUNT(*) AS [MountainRanges]
  FROM [Countries] AS [c]
  JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode]=[mc].[CountryCode]
  JOIN [Mountains] AS [m] ON [mc].[MountainId] = [m].[Id] 
 WHERE [c].[CountryCode] IN ('BG','RU','US')
 GROUP BY [c].[CountryCode]

 
--Problem 14. Countries With Rivers
SELECT TOP(5) [c].[CountryName], [r].[RiverName]
FROM [Countries] AS [c]
LEFT JOIN [CountriesRivers] AS [cr] ON [c].[CountryCode] = [cr].[CountryCode]
LEFT JOIN [Rivers] AS [r] ON [cr].[RiverId] = [r].[Id]
WHERE LOWER([c].[ContinentCode])='AF'
ORDER BY [c].[CountryName] 

--Problem 15.

SELECT [ContinentCode],
	   [CurrencyCode],
	   [CurrencyUsage] 
FROM
         (SELECT *,
			      DENSE_RANK() OVER(PARTITION BY [ContinentCode] ORDER BY [CurrencyUsage] DESC
		  )
			   AS [CurrencyRank]
    FROM ( SELECT [cont].[ContinentCode], 
		      [c].[CurrencyCode],
		     COUNT([c].[CurrencyCode]) AS [CurrencyUsage] 
             FROM [Continents] AS [cont]
             JOIN [Countries] AS [c] ON [cont].ContinentCode = [c].[ContinentCode]
	     GROUP BY [cont].[ContinentCode], [c].[CurrencyCode]
		 )     
		       AS [CurrencyUsageQuerie]	
            WHERE [CurrencyUsage]> 1 
         )     
		       AS [CurrencyRankingQuery]
            WHERE [CurrencyRank] = 1
         ORDER BY [ContinentCode]

--Problem 16. Countries Without Any Mountains
SELECT COUNT(*) AS [Count]
FROM [Countries] AS [c]
LEFT JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode] = [mc].[CountryCode]
--LEFT JOIN [Rivers] AS [r] ON [cr].[RiverId] = [r].[Id]
WHERE [mc].[MountainId] IS NULL

--Problem 17 Highest Peak and Longest River by Country
SELECT TOP(5) [c].[CountryName],
      MAX([p].[Elevation]) AS [HighestPeakElevation],
      MAX([r].[Length]) AS [LongestRiverLength]
	     FROM [Countries] AS [c]
	LEFT JOIN [MountainsCountries] AS [mc] ON [c].[CountryCode] = [mc].[CountryCode]
	LEFT JOIN [Mountains] AS [m] ON [mc].[MountainId] = [m].[Id]
	LEFT JOIN [Peaks] AS [p] ON [m].[Id] = [p].[MountainId]
	LEFT JOIN [CountriesRivers] AS [cr] ON [c].[CountryCode] = [cr].[CountryCode]
	LEFT JOIN [Rivers] AS [r] ON [cr].[RiverId] = [r].[Id]
    GROUP BY [c].[CountryName]
    ORDER BY [HighestPeakElevation] DESC, [LongestRiverLength] DESC, [C].[CountryName]

--Problem18. Highest Peak Name and Elevation by Country

