use chit1;

CREATE TABLE Emp (
    emp_id INT PRIMARY KEY,
    ename VARCHAR(20),
    street VARCHAR(20),
    city VARCHAR(20)
);


CREATE TABLE works (
    emp_id INT,
    c_id INT,
    ename VARCHAR(20),
    cname VARCHAR(20),
    sal DECIMAL(10, 2),
    PRIMARY KEY(emp_id,c_id)
);

-- Create the 'Company' table
CREATE TABLE Company (
    c_id INT PRIMARY KEY,
    cname VARCHAR(20),
    city VARCHAR(20)
);

-- Create the 'Manager' table
CREATE TABLE Manager (
    mgr_id INT PRIMARY KEY,
    mgrname VARCHAR(20)
);

-- Insert data into the 'Emp' table
INSERT INTO Emp (emp_id, ename, street, city) VALUES
    (1, 'Empl1', 'Street1', 'Pune'),
    (2, 'Empl2', 'Street2', 'Mumbai'),
    (3, 'Empl3', 'Street3', 'Bangalore'),
    (4, 'Empl4', 'Street4', 'Pune'),
    (5, 'Empl5', 'Street5', 'Pune');


INSERT INTO works (emp_id, c_id, ename, cname, sal) VALUES
    (1, 101, 'Empl1', 'ABC', 22000.00),
    (2, 102, 'Empl2', 'XYZ', 18000.00),
    (3, 101, 'Empl3', 'ABC', 28000.00),
    (4, 103, 'Empl4', 'Bosch', 42000.00),
    (5, 102, 'Empl5', 'XYZ', 21000.00);

-- Insert data into the 'Company' table
INSERT INTO Company (c_id, cname, city) VALUES
    (101, 'ABC', 'Mumbai'),
    (102, 'XYZ', 'Pune'),
    (103, 'Bosch', 'Pune');

-- Insert data into the 'Manager' table
INSERT INTO Manager (mgr_id, mgrname) VALUES (1, 'Manager1'), (2, 'Manager2');

-- 

-- Modify the database so that a particular company (e.g., 'ABC') is now in Pune:
UPDATE Company 
SET city = 'Pune'
WHERE cname = 'ABC';


-- Find out the names of all employees who work in the 'Bosch' company in the city of Pune:
SELECT  E.ename,w.cname 
FROM works as w, Emp  as E
WHERE w.emp_id= E.emp_id and  w.cname = 'Bosch' AND E.city = 'Pune';

-- Delete all records in the 'works' table for employees of a particular company (e.g., 'SBC Company') whose salary is greater than 50,000
DELETE FROM works
WHERE cname = 'ABC' AND sal > 25000.00;
