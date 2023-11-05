use chit1;

-- Create the 'Empl' table
CREATE TABLE Empl (
    e_no INT PRIMARY KEY,
    e_name VARCHAR(20),
    post VARCHAR(20),
    pay_rate DECIMAL(12, 2)
);

-- Create the 'Position' table
CREATE TABLE Position (
    pos_no INT PRIMARY KEY,
    post VARCHAR(20)
);

-- Create the 'Duty_alloc' table
CREATE TABLE Duty_alloc (
    pos_no INT,
    e_no INT,
    month INT,
    year INT,
    shift VARCHAR(30),
    PRIMARY KEY (pos_no, e_no)
);

-- Insert data into the 'Empl' table
INSERT INTO Empl (e_no, e_name, post, pay_rate) VALUES
    (121, 'John', 'Manager', 60000.00),
    (122, 'Anil', 'Manager', 62000.00),
    (123, 'Amit', 'Assistant', 42000.00),
    (124, 'Sachin', 'Assistant', 42000.00),
    (125, 'Ajay', 'Clerk', 32000.00);

-- Insert data into the 'Position' table
INSERT INTO Position (pos_no, post) VALUES
    (1, 'Manager'),
    (2, 'Assistant'),
    (3, 'Clerk');
-- drop table Duty_alloc;
-- Insert data into the 'Duty_alloc' table
INSERT INTO Duty_alloc (pos_no, e_no, month, year, shift) VALUES
    (1, 121, 4, 2003, 'First Shift'),
    (1, 122, 4, 2003, 'Second Shift'),
    (2, 123, 4, 2003, 'First Shift'),
    (2, 124, 4, 2003, 'Second Shift'),
    (3, 125, 3, 2003, 'Third Shift');
 
 --  Get duty allocation details for e_no 123 for the first shift in the month of April 2003:
SELECT * FROM Duty_alloc
WHERE e_no = 123 AND month = 4 AND year = 2003 AND shift = 'First Shift';

--  Get the employees whose rate of pay is greater than or equal to the rate of pay of employees 'Sachin':
SELECT e_name, pay_rate
FROM Empl
WHERE pay_rate >= (SELECT pay_rate FROM Empl WHERE e_name = 'Sachin');

-- Create a view for displaying the minimum, maximum, and average salary for all the posts:
CREATE VIEW SalaryStats AS
SELECT post, MIN(pay_rate) AS min_salary, MAX(pay_rate) AS max_salary, AVG(pay_rate) AS avg_salary
FROM Empl
GROUP BY post;

--  Get the count of different employees on each shift having the post 'Manager':
SELECT shift, COUNT(DISTINCT e_no) AS employee_count
FROM Duty_alloc
WHERE pos_no = (SELECT pos_no FROM Position WHERE post = 'Manager')
GROUP BY shift;
