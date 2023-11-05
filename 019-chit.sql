

-- ALTER TABLE emp AUTO_INCREMENT = 101;
CREATE TABLE emp (
    Eno INT PRIMARY KEY AUTO_INCREMENT ,
    Ename VARCHAR(20) NOT NULL,
    Address VARCHAR(20) DEFAULT 'Nashik',
    Joindate DATE
);

ALTER TABLE emp AUTO_INCREMENT = 101;

ALTER TABLE emp ADD Post VARCHAR(50);

INSERT INTO emp (Ename, Joindate, Post)
VALUES
    ('John ', '2023-10-15', 'Manager'),
    ('Amit ', '2023-10-16', 'Engineer'),
     ('Anil ', '2023-10-18', 'Intern'),
    ('Amol ', '2023-10-17', 'Technician'),
    ('Ajay ', '2023-10-19', 'HR');
    
CREATE INDEX idx_Ename ON emp (Ename);

CREATE VIEW ENameSal AS SELECT Ename  FROM emp;

