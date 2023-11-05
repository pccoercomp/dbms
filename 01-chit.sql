create database chit1;
use chit1;
create table Customer(C_id int primary key,
Cname varchar(20),City varchar(20));
create table Account(C_id int primary key,
Acc_type varchar(20),Amount int);

insert into Customer values(1,"John","Nashik"),(2,"Seema","Aurangabad"),(3,"Amita","Nagar"),(4,"Rakesh","Pune"),
(5,"Samata","Nashik"),(6,"Ankita","Chandwad"),(7,"Bhavika","Pune"),(8,"Deepa","Mumbai"),(9,"Nitin","Nagpur"),(10,"Pooja","Pune");

select * from Customer;

insert into Account values(1,"Current",5000),(2,"Saving",20000),(3,"Saving",70000),(4,"Saving",50000),
(6,"Current",35000),(7,"Loan",30000),(8,"Saving",50000),(9,"Saving",90000),(10,"Loan",8000),(11,"Current",45000);

select * from Account;


SELECT Cname, Acc_type, Amount
FROM Customer
JOIN Account ON Customer.C_id = Account.C_id
WHERE Acc_type = 'Saving';

SELECT Cname, Acc_type, Amount
FROM Customer
NATURAL JOIN Account;

SELECT  Cname, Acc_type, Amount
FROM Customer
LEFT JOIN Account ON Customer.C_id = Account.C_id;

SELECT Cname, Acc_type, Amount
FROM Customer
RIGHT JOIN Account ON Customer.C_id = Account.C_id;

SELECT Cname, Acc_type, Amount
FROM Customer
JOIN Account ON Customer.C_id = Account.C_id
WHERE City = (SELECT City FROM Customer WHERE Cname = 'Pooja');

SELECT Cname, Acc_type, Amount
FROM Customer
JOIN Account ON Customer.C_id = Account.C_id
WHERE Amount < (SELECT AVG(Amount) FROM Account);

SELECT C_id
FROM Account
WHERE Amount = (SELECT MAX(Amount) FROM Account);

SELECT Cname, Acc_type, Amount
FROM Customer
JOIN Account ON Customer.C_id = Account.C_id
WHERE (Acc_type, Amount) IN (
  SELECT Acc_type, MIN(Amount)
  FROM Account
  GROUP BY Acc_type
);

SELECT Acc_type, Amount
FROM Account
WHERE Amount > (SELECT MAX(Amount) FROM Account WHERE Acc_type = 'Saving');

