create database temp1;
use temp1;

create table student(
id int primary key,
name varchar(20),
age int not null);

insert into student values(4,"Aa",26),(5,"Bb",23),(6,"Cc",34);
select * from student;
insert into student(id,age) values(7,5),(33,33),(334,343);

-- example

create database xyz;
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(22),
    salary INT
);

INSERT INTO employee (id, name, salary) VALUES (1, 'adam', 25000), (2, 'b', 30000), (3, 'v', 40000);


select * from employee;
drop database xyz;

-- example2


create database college;
use college;
CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(20),
    marks INT NOT NULL,
    grade VARCHAR(4),
    city VARCHAR(20)
);

INSERT INTO student (rollno, name, marks, grade, city) VALUES
    (1, 'John', 85, 'A', 'New York'),
    (2, 'Alice', 92, 'A+', 'Los Angeles'),
    (3, 'Bob', 78, 'B', 'Chicago'),
    (4, 'Emma', 95, 'A+', 'San Francisco'),
    (5, 'Michael', 65, 'C', 'Houston');
    
select name ,marks from student;
c
