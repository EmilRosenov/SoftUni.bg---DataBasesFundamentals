GO 
USE [Gringotts]
GO

--PROBLEM 01. Records’ Count 
SELECT COUNT(*) AS [Count]
FROM [WizzardDeposits]

--PROBLEM 02. Longest Magic Wand
SELECT MAX([MagicWandSize]) AS [LongestMagicWand]
FROM [WizzardDeposits]

--PROBLEM 03. Longest Magic Wand per Deposit Groups
SELECT [DepositGroup],MAX([MagicWandSize]) AS[LongestMagicWand]
FROM [WizzardDeposits]
GROUP BY [DepositGroup]

--PROBLEM 04. Smallest Deposit Group per Magic Wand Size
SELECT TOP (2) [DepositGroup]
FROM [WizzardDeposits]
GROUP BY [DepositGroup] 
ORDER BY AVG([MagicWandSize])


--PROBLEM 05. Deposits Sum 
SELECT [DepositGroup], SUM([DepositAmount]) AS [TotalSum]
FROM [WizzardDeposits]
GROUP BY [DepositGroup]

--PROBLEM 06. Deposits Sum for Ollivander Family 
SELECT [DepositGroup], SUM([DepositAmount]) AS [TotalSum]
FROM [WizzardDeposits]
WHERE [MagicWandCreator] = 'Ollivander family'
GROUP BY [DepositGroup]

--PROBLEM 07. Deposits Filter

SELECT [DepositGroup], SUM(DepositAmount) AS [TotalSum]
FROM [WizzardDeposits]
WHERE [MagicWandCreator] = 'Ollivander family'
GROUP BY [DepositGroup]
HAVING SUM([DepositAmount]) < 150000
ORDER BY [TotalSum] DESC


--PROBLEM 08. Deposit Charge

SELECT DISTINCT([DepositGroup]),[MagicWandCreator],MIN([DepositCharge]) AS [MinDepositCharge]
FROM [WizzardDeposits]
GROUP BY [DepositGroup],[MagicWandCreator]
ORDER BY [MagicWandCreator], [DepositGroup],[MinDepositCharge]

--PROBLEM 09. Age Groups


SELECT [SUBQUERY].[AgeGroup], COUNT([SUBQUERY].[AgeGroup]) AS[WizardCount]
FROM (
SELECT       CASE 
		     WHEN [Age] BETWEEN 0 AND 10 THEN '[0-10]'
		     WHEN [Age] BETWEEN 11 AND 20 THEN '[11-20]'
		     WHEN [Age] BETWEEN 21 AND 30 THEN '[21-30]'
		     WHEN [Age] BETWEEN 31 AND 40 THEN '[31-40]'
		     WHEN [Age] BETWEEN 41 AND 50 THEN '[41-50]'
		     WHEN [Age] BETWEEN 51 AND 60 THEN '[51-60]'
		     WHEN [Age] >= 61 THEN '[61+]'
		     END AS [AgeGroup]
       FROM [WizzardDeposits]
	   ) 
	   AS [SUBQUERY]
	   
	   GROUP BY [SUBQUERY].[AgeGroup]

--PROBLEM 10. First Letter
SELECT SUBSTRING([FirstName],1,1) AS [FirstLetter]
FROM [WizzardDeposits]
WHERE [DepositGroup] = 'Troll Chest'
GROUP BY SUBSTRING([FirstName],1,1)

GO
SELECT * 
FROM [WizzardDeposits]
GO

--PROBLEM 11. Average Interest 
SELECT [DepositGroup], [IsDepositExpired], AVG([DepositInterest]) AS[AverageInterest]
FROM [WizzardDeposits]
WHERE [DepositStartDate]>'1985/01/01'  
GROUP BY [DepositGroup], [IsDepositExpired]
ORDER BY [DepositGroup] DESC 
		

--PROBLEM 12.

SELECT SUM([Guest].[DepositAmount] - [Host].[DepositAmount]) AS[Difference]
FROM [WizzardDeposits] AS [Host]
JOIN WizzardDeposits AS [Guest] ON [Guest].[Id]+1 = [Host].[Id]
--ORDER BY [Difference] DESC

GO
USE [SoftUni]
GO

GO
SELECT * FROM [Employees]
GO


--PROBLEM 13. Departments Total Salaries

  SELECT [DepartmentId],SUM([Salary]) AS [TotalSalary]
    FROM [Employees]
ORDER BY [DepartmentId]

--PROBLEM 14. Employees Minimum Salaries 
SELECT [DepartmentId],MIN([Salary]) AS [MinSalary]
FROM [Employees]
WHERE [DepartmentId] IN (2, 5, 7) AND [HireDate] > '2000/01/01'
GROUP BY [DepartmentId] 

--PROBLEM 15. Employees Average Salaries


  SELECT *
  INTO [EmployeesNewTable]
  FROM [Employees]
  WHERE [Salary]>30000

  DELETE
    FROM [EmployeesNewTable]
   WHERE ManagerID = 42

  UPDATE [EmployeesNewTable]
     SET [Salary] +=5000
   WHERE [DepartmentID] = 1 

  SELECT [DepartmentID], AVG([Salary]) AS[AverageSalary] 
    FROM [EmployeesNewTable]
GROUP BY [DepartmentID]
    
--PROBLEM 16. Employees Maximum Salaries
SELECT [DepartmentID],MAX([Salary])
FROM [Employees]
GROUP BY [DepartmentID]
HAVING MAX([Salary]) NOT BETWEEN 30000 AND 70000

--PROBLEM 17. Employees Count Salaries

SELECT COUNT(Salary) AS [Count]
FROM Employees
WHERE ManagerID IS NULL

--PROBLEM 18. 3rd Highest Salary
SELECT [DepartmentID], AVG([Salary]) AS [ThirdHighestSalary]
    FROM(SELECT DepartmentID, Salary,
    DENSE_RANK() OVER(PARTITION BY [DepartmentID] ORDER BY [Salary] DESC)
	AS[Ranked]
FROM [Employees]) AS[RankedQuery]
WHERE [Ranked] = 3
GROUP BY [DepartmentID],[Ranked]

--PROBLEM 19.

SELECT TOP(10)[FirstName], [LastName], [DepartmentID]
         FROM [Employees] AS [e]
        WHERE [Salary] > (SELECT AVG([Salary])
                                FROM [Employees]
                               WHERE [DepartmentID] = [e].DepartmentID 
                            GROUP BY [DepartmentID])
	
 


		