-- Create the Library table
SET SERVEROUTPUT ON;
--drop table Library;
--drop table Library;
--drop table Library_Audit;
CREATE TABLE Library (
    Book_ID NUMBER PRIMARY KEY,
    Book_Title VARCHAR2(100),
    Author VARCHAR2(50),
    Publish_Year NUMBER
);

-- Create the Library_Audit table to store old values
CREATE TABLE Library_Audit (
    Audit_ID NUMBER PRIMARY KEY,
    Book_ID NUMBER,
    Book_Title VARCHAR2(100),
    Author VARCHAR2(50),
    Publish_Year NUMBER,
    Audit_Type VARCHAR2(10),
    Audit_Timestamp TIMESTAMP
);
INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES
    (1, 'Wings of Fire', 'Abdul Kalam', 1999);
 INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES   (2, 'Ignited Minds', 'Abdul Kalam', 2002);
   INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES (3, 'My Journey: Transforming Dreams into Actions', 'Abdul Kalam', 2013);
  INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES  (4, 'India 2020: A Vision for the New Millennium', 'Abdul Kalam', 1998);
  INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES  (5, 'The Luminous Sparks', 'Abdul Kalam', 2004);
   INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES (6, 'The Missile Man: Dr. APJ Abdul Kalam', 'Abdul Kalam', 2015);
    INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES(7, 'Transcendence: My Spiritual Experiences with Pramukh Swamiji', 'Abdul Kalam', 2015);
 INSERT INTO Library (Book_ID, Book_Title, Author, Publish_Year)
VALUES   (8, 'My Gita', 'Abdul Kalam', 2016);

CREATE SEQUENCE SEQ_AUDIT_ID;

CREATE OR REPLACE TRIGGER Library_Audit_Trigger
AFTER UPDATE OR DELETE ON Library
FOR EACH ROW
DECLARE
    v_audit_type VARCHAR2(10);
BEGIN
    IF UPDATING THEN
        v_audit_type := 'UPDATE';
    ELSIF DELETING THEN
        v_audit_type := 'DELETE';
    END IF;

    INSERT INTO Library_Audit (Audit_ID, Book_ID, Book_Title, Author, Publish_Year, Audit_Type, Audit_Timestamp)
    VALUES (SEQ_AUDIT_ID.NEXTVAL, :OLD.Book_ID, :OLD.Book_Title, :OLD.Author, :OLD.Publish_Year, v_audit_type, SYSTIMESTAMP);
END;
/


-- DELETE 

DELETE FROM Library WHERE Book_ID = 8;
select * from LIBRARY;
SELECT * FROM Library_Audit;

-- UPDATE 
UPDATE Library
SET Book_Title = 'Rich Dad Poor Dad'
WHERE Book_ID = 2;
SELECT * FROM Library_Audit;

