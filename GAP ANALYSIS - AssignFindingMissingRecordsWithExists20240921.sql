

-- =============================================
-- Author:			Rekiat Ozigi
-- Create date:		2024/09/21
-- Description:		GAP ANALYSIS
-- Version:			0.1
-- Revision Date:	2024/09/21
-- =============================================


---Checking Data In Table

SELECT *
FROM EmadeConsultingEmployee

--How To Find Missing Records
---Create a backup

DROP TABLE IF EXISTS EmadeConsultingEmployeeBackup
SELECT *
INTO EmadeConsultingEmployeeBackup
FROM EmadeConsultingEmployee
WHERE working_hours IN (9,12)
SELECT *
FROM EmadeConsultingEmployeeBackup

SELECT *
FROM EmadeConsultingEmployeeBackup


--How To Find Missing Records using EXIST

SELECT *
FROM EmadeConsultingEmployeeBackup AS A
WHERE EXISTS (
SELECT 1
FROM EmadeConsultingEmployee AS B
WHERE A.working_hours = B.working_hours
)

--Finding Common Records Using Exists (Same As Intersect)
SELECT *
FROM EmadeConsultingEmployee AS A
WHERE EXISTS (
SELECT *
FROM EmadeConsultingEmployeeBackup AS B
WHERE A.working_hours = B.working_hours
)

----Finding Missing Records Using Exists (Same as Except)
SELECT *
FROM EmadeConsultingEmployee AS A
WHERE NOT EXISTS (
SELECT *
FROM EmadeConsultingEmployeeBackup AS B
WHERE A.working_hours = B.working_hours
)



--Finding Common Records Using Exists (Same As Intersect)
SELECT *
FROM EmadeConsultingEmployee AS A
WHERE EXISTS (
SELECT *
FROM EmadeConsultingEmployeeBackup AS B
WHERE A.working_hours = B.working_hours
)

----Finding Missing Records Using Exists (Same as Except)
SELECT *
FROM EmadeConsultingEmployee AS A
WHERE NOT EXISTS (
SELECT *
FROM EmadeConsultingEmployeeBackup AS B
WHERE A.working_hours = B.working_hours
)


--Finding Common Records Using Exists (Same As Intersect)
SELECT *
FROM EmadeConsultingEmployee AS A
WHERE Working_hours IN (
SELECT working_hours
FROM EmadeConsultingEmployeeBackup AS B
WHERE A.working_hours = B.working_hours
)

----Finding Missing Records Using Not Exists/Not In (Same as Except)
SELECT *
FROM EmadeConsultingEmployee AS A
WHERE working_hours NOT in (
SELECT working_hours
FROM EmadeConsultingEmployeeBackup AS B
WHERE A.working_hours = B.working_hours
)


/**

Assignment Show Gap Analysis in 5 Tables

**/
 
--1.How To Find Missing Records
---Create a backup
 
USE SqlTraining
DROP TABLE IF EXISTS CustomersBackup
SELECT *
INTO CustomersBackup
FROM Customers
WHERE Customer_ID IN (1,2,4,6,8)

SELECT *
FROM CustomersBackup

SELECT *
FROM Customers


--How To Find Missing Records using EXIST
--1. --Finding Common Records Using Exists (Same As Intersect)

SELECT *
FROM CustomersBackup AS CB
WHERE EXISTS (
SELECT 1
FROM Customers AS C
WHERE C.Customer_ID = CB.Customer_ID
)

----2. Finding Missing Records Using  Not Exists (Same as Except)

SELECT *
FROM Customers AS C
WHERE NOT EXISTS (
SELECT 1
FROM CustomersBackup AS CB
WHERE C.Customer_ID = CB.Customer_ID
)

--Finding Common Records Using EXISTS/IN (Same As Intersect)-- For In we add the where clause
SELECT *
FROM Customers AS C
WHERE  Customer_ID IN 
(
SELECT Customer_ID
FROM CustomersBackup AS CB
WHERE C.Customer_ID = CB.Customer_ID
)

----Finding Missing Records Using Not Exists/Not In (Same as Except)
SELECT *
FROM Customers AS C
WHERE  Customer_ID NOT IN 
(
SELECT Customer_ID
FROM CustomersBackup AS CB
WHERE C.Customer_ID = CB.Customer_ID
)

 
-- 2.How To Find Missing Records
---Create a backup
USe SqlTraining
DROP TABLE IF EXISTS LoanAccountsBackup
SELECT *
INTO LoanAccountsBackup
FROM LoanAccounts
WHERE AccNo IN (2,4,6)

SELECT *
FROM LoanAccountsBackup

SELECT *
FROM LoanAccounts


--How To Find Missing Records using EXIST
--1. --Finding Common Records Using Exists (Same As Intersect)

SELECT *
FROM LoanAccountsBackup AS LB
WHERE EXISTS (
SELECT 1
FROM LoanAccounts AS L
WHERE LB.AccNo = L.AccNo
)

----2. Finding Missing Records Using  Not Exists (Same as Except)

SELECT *
FROM LoanAccounts AS L
WHERE NOT EXISTS 
(
SELECT *
FROM LoanAccountsBackup AS LB
WHERE LB.AccNo = L.AccNo
)


--1.Finding Common Records Using EXISTS/IN (Same As Intersect)-- For In we add Column the where clause
SELECT *
FROM LoanAccounts AS L
WHERE AccNo IN 
(
SELECT AccNo
FROM LoanAccountsBackup AS LB
WHERE L.AccNo = LB.AccNo
)

--2.Finding Missing Records Using Not Exists/Not In (Same as Except)
SELECT *
FROM LoanAccounts AS L
WHERE AccNo NOT IN 
(
SELECT AccNo
FROM LoanAccountsBackup AS LB
WHERE L.AccNo = LB.AccNo
)
--3.How To Find Missing Records
---Create a backup
USe SqlTraining
DROP TABLE IF EXISTS MoviesBackup
SELECT *
INTO MoviesBackup
FROM Movies
WHERE No IN (2,4,6)

SELECT *
FROM MoviesBackup

SELECT *
FROM Movies


--How To Find Missing Records using EXIST
--1. --Finding Common Records Using Exists (Same As Intersect)

SELECT *
FROM MoviesBackup AS MB
WHERE EXISTS (
SELECT 1
FROM Movies AS M
WHERE MB.No = M.No
)

----2. Finding Missing Records Using  Not Exists (Same as Except)

SELECT *
FROM Movies AS M
WHERE NOT EXISTS 
(
SELECT *
FROM MoviesBackup AS MB
WHERE MB.No = M.No
)


--1.Finding Common Records Using EXISTS/IN (Same As Intersect)-- For In we add Column to the where clause and Column to the select in the subquery
SELECT *
FROM Movies AS M
WHERE No IN 
(
SELECT No
FROM MoviesBackup AS MB
WHERE M.No = MB.No
)

--2.Finding Missing Records Using Not Exists/Not In (Same as Except)
SELECT *
FROM Movies AS M
WHERE No NOT IN 
(
SELECT No
FROM MoviesBackup AS MB
WHERE M.No = MB.No
)

--4.How To Find Missing Records
---Create a backup
USe SqlTraining
DROP TABLE IF EXISTS StudentBackup
SELECT *
INTO StudentBackup
FROM Student
WHERE ID IN (2,4,6,8,10,12,14)

SELECT *
FROM StudentBackup

SELECT *
FROM Student


--How To Find Missing Records using EXIST
--1. --Finding Common Records Using Exists (Same As Intersect)

SELECT *
FROM StudentBackup AS SB
WHERE EXISTS (
SELECT 1
FROM Student AS S
WHERE SB.ID = S.ID
)

----2. Finding Missing Records Using  Not Exists (Same as Except)

SELECT *
FROM Student AS S
WHERE NOT EXISTS 
(
SELECT *
FROM StudentBackup AS SB
WHERE SB.ID = S.ID
)


--1.Finding Common Records Using EXISTS/IN (Same As Intersect)-- For In we add Column to the where clause and Column to the select in the subquery
SELECT *
FROM Student AS S
WHERE ID IN 
(
SELECT ID
FROM StudentBackup AS SB
WHERE S.ID = SB.ID
)

SELECT *
FROM Student AS S
WHERE ID  NOT IN 
(
SELECT ID
FROM StudentBackup AS SB
WHERE S.ID = SB.ID
)

--5.How To Find Missing Records
---Create a backup
USe SqlTraining
DROP TABLE IF EXISTS ProductsBackup
SELECT *
INTO ProductsBackup
FROM Products
WHERE Product_ID IN (2,4,6,8,10,12,14)

SELECT *
FROM ProductsBackup

SELECT *
FROM Products


--How To Find Missing Records using EXIST
--1. --Finding Common Records Using Exists (Same As Intersect)

SELECT *
FROM ProductsBackup AS PB
WHERE EXISTS (
SELECT 1
FROM Products AS P
WHERE PB.Product_ID = P.Product_ID
)

----2. Finding Missing Records Using  Not Exists (Same as Except)

SELECT *
FROM Products AS P
WHERE NOT EXISTS 
(
SELECT *
FROM ProductsBackup AS PB
WHERE PB.Product_ID = P.Product_ID
)


--1.Finding Common/Matching Records Using EXISTS/IN (Same As Intersect)-- For In we add Column to the where clause and Column to the select in the subquery
SELECT *
FROM Products AS P
WHERE Product_ID IN 
(
SELECT Product_ID
FROM ProductsBackup AS PB
WHERE P.Product_ID = PB.Product_ID
)

SELECT *
FROM Products AS P
WHERE Product_ID  NOT IN 
(
SELECT Product_ID
FROM ProductsBackup AS PB
WHERE P.Product_ID = PB.Product_ID
)