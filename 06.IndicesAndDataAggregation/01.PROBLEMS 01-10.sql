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


	
		