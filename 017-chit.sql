
CREATE TABLE Employee(
    Eid int primary key,
    Ename varchar(20),
    Address varchar(20),
    Salary double,
    Commision int
);

INSERT INTO Employee values(1,'Amit',"Pune",35000,5000),
(2,"Sneha","Pune",25000,NULL),(3,"Savita","Nasik",28000,2000),
(4,"Pooja","Mumbai",19000,NULL),(5,"Sagar","Mumbai",25000,3000);

CREATE TABLE Project(
    PrNo int,
    Addr varchar(20)
);

INSERT INTO Project values(10,"Mumbai"),(20,"Pune"),(30,"Jalgaon");

-- Find different locations from where employees belong to:
SELECT DISTINCT Address FROM Employee;

-- What is the maximum and minimum salary?
SELECT MAX(Salary) as mx, MIN(Salary)  as mn FROM Employee;

-- Display the content of the Employee table according to the ascending order of the salary amount:
SELECT * FROM Employee ORDER BY Salary;

-- Find the name of an employee who lived in Nasik or Pune city
SELECT Ename FROM Employee WHERE Address IN ('Nasik', 'Pune');

-- Find the name of employees who do not get a commission:
SELECT Ename FROM Employee WHERE Commision IS NULL;

-- Change the city of Amit to Nashik:
UPDATE Employee SET Address = 'Nashik' WHERE Ename = 'Amit';

-- Find the information of employees whose name starts with 'A':
SELECT * FROM Employee WHERE Ename LIKE 'A%';

-- Find the count of employees from Mumbai
SELECT COUNT(*) FROM Employee WHERE Address = 'Mumbai';

-- Find the count of employees from each city
SELECT Address, COUNT(*) AS ECount FROM Employee GROUP BY Address;

-- Find the address from where employees are belonging as well as where projects are going on
SELECT DISTINCT Address FROM Employee UNION
				SELECT DISTINCT Addr FROM Project;

-- Find city-wise minimum salary:
SELECT Address, MIN(Salary) AS MnSal FROM Employee GROUP BY Address;

-- Find city-wise maximum salary having a maximum salary greater than 26000
SELECT Address, MAX(Salary) AS MxSal FROM Employee GROUP BY Address
HAVING MAX(Salary) > 26000;

-- Delete the employee who has a salary greater than 30,000:
DELETE FROM Employee WHERE Salary > 30000;
