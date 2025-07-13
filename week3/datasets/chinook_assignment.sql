/* Q1 Write a query that will return all the columns for the tracks that contain the word
love.*/

 SELECT 
 POSITION('Love' IN NAME) AS POSITION
 FROM Track;

-- Q2. Limit this to the first 10 results.
 SELECT 
 POSITION('Love' IN NAME) AS POSITION
 FROM Track
 LIMIT 10 ;
 
/*Q3 Formulate a query that returns customers with email addresses that have domains
that end in three letters.*/
SELECT
Email,
RIGHT (Email , 3) AS Right_Email_Address
FROM Customer
WHERE Email LIKE '%.___';

-- Q4 Write a query that shows all customers who live in the UK.
SELECT
customerid,
Country
FROM Customer
WHERE Country = 'United Kingdom';

-- Q5 Write a query that shows employee first and last names in the same column.
SELECT 
CONCAT (FirstName," ",LastName) AS Employee_Names
FROM Customer;

-- DATETIME FUNCTIONS
-- Q1 Run a query that will give us a view of the data type of the employees table.
DESCRIBE Employee;

-- Q2 We write a query that shows the age of all employees when they were hired.
SELECT
   Employeeid,
TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS Age_when_hired
FROM Employee;

/* Q3 Return data in the FirstName and LastName columns and create an Age when hired alias
for the age from the employees table.*/
SELECT
	LastName,
	FirstName,
TIMESTAMPDIFF(YEAR, BirthDate, HireDate) AS Age_when_hired
FROM Employee;

/* Q4 In the context of DateTime SQL objects, the substr() function allows us to trim or extract
certain information within the date or time. We use it by specifying the string and the
indices from which to show data, i.e. substr(datetime_column,start_index, end_index) */
SELECT
EmployeeId,
HireDATE,
SUBSTR(HireDate, 1, 4) AS Hire_Year
FROM Employee;

SELECT
EmployeeId,
HireDATE,
SUBSTR(HireDate, 6, 2) AS Hire_Month
FROM Employee;

-- Q5 Write a query that calculates the month-to-month revenue at Chinook.
SELECT
MONTH(InvoiceDate) AS Month_,
SUM(Total) AS Monthly_Revenue
FROM Invoice
GROUP BY 1;

-- Q6 Return the month and revenue and use aliases to name the calculated columns appropriately.
SELECT
  YEAR(InvoiceDate) AS Year_,
  MONTH(InvoiceDate) AS Month_,
  SUM(Total) AS Monthly_Revenue,
  SUM(SUM(Total)) OVER (PARTITION BY YEAR(InvoiceDate)) AS Annual_Revenue
FROM Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year_, Month_;

-- Q7 Write a query that calculates the year-to-year revenue at Chinook.
SELECT
YEAR (InvoiceDate) AS Year_,
SUM(Total) AS Year_Revenue
FROM Invoice
GROUP BY 1;

-- Q8 Write a query that returns employees who were hired after 2002-08-14 and before 2003-10-17.
SELECT
EmployeeId,
LastName,
FirstNAME,
HireDate
FROM Employee
WHERE HireDate > '2002-08-14' AND
      HireDate < '2003-10-17';
	
