-- Create the student table
use chit1;
CREATE TABLE student (
  S_ID INT PRIMARY KEY,
  name VARCHAR(20),
  dept_name VARCHAR(20),
  tot_cred INT
);

-- Insert sample data into the student table
INSERT INTO student (S_ID, name, dept_name, tot_cred)
VALUES
  (1, 'Amit', 'Computer', 120),
  (2, 'Bheem', 'Mathematics', 90),
  (3, 'Chintu', 'Computer', 110),
  (4, 'Deva', 'Physics', 80),
  (5, 'Narendra', 'Computer', 95);

-- Create the instructor table
CREATE TABLE instructor (
  T_ID INT PRIMARY KEY,
  name VARCHAR(20),
  dept_name VARCHAR(20),
  salary int
);

-- Insert sample data into the instructor table
INSERT INTO instructor (T_ID, name, dept_name, salary)
VALUES
  (101, 'Amol', 'Computer', 45000),
  (102, 'Amit', 'Physics', 55000),
  (103, 'Gaurav', 'Computer', 48000),
  (104, 'Om', 'Mathematics', 42000),
  (105, 'Jay', 'Computer', 46000);

-- Create the course table
CREATE TABLE course (
  course_id INT PRIMARY KEY,
  title VARCHAR(20),
  dept_name VARCHAR(20),
  credits INT
);

-- Insert sample data into the course table
INSERT INTO course (course_id, title, dept_name, credits)
VALUES
  (1, 'DBMS', 'Computer', 3),
  (2, 'Calculus', 'Mathematics', 4),
  (3, 'Physics I', 'Physics', 3),
  (4, 'Algorithms', 'Computer', 4),
  (5, 'Linear Algebra', 'Mathematics', 3);
  
select  * from course;
SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name
HAVING avg_salary > 42000;

ALTER TABLE instructor
MODIFY salary DOUBLE;

UPDATE instructor
SET salary = salary * 1.1
WHERE dept_name = 'Computer';

SELECT name
FROM instructor
WHERE name NOT IN ('Amol', 'Amit');

SELECT name
FROM student
WHERE name LIKE '%am%';

SELECT s.name
FROM student s
INNER JOIN course c ON s.dept_name = c.dept_name
WHERE c.title = 'DBMS' AND s.dept_name = 'Computer';


