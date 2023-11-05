SET SERVEROUTPUT ON;
-- Create the Borrower table

--CREATE TABLE Borrower (
--    Rollin NUMBER,
--    Name VARCHAR2(100),
--    DateofIssue DATE,
--    NameofBook VARCHAR2(100),
--    Status CHAR(1)
--);
--
---- Create the Fine table with the corrected column name
--CREATE TABLE Fine (
--    Roll_no NUMBER,
--    FineDate DATE, -- Changed column name from Date to FineDate
--    Amt NUMBER
--);
--
---- Insert sample data into the Borrower table for testing
--INSERT INTO Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
--VALUES (1, 'John Doe', TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Book1', 'I');
--
--INSERT INTO Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
--VALUES (2, 'Jane Smith', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Book2', 'I');
--
--INSERT INTO Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
--VALUES (3, 'Alice Johnson', TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'Book3', 'I');

-- PLSQL block to calculate fines, update status, and handle exceptions
-- PL/SQL block to calculate fines, update status, and handle exceptions
DECLARE
   v_roll_no       NUMBER := &roll_no; -- Hardcoded borrower's roll number
   v_name_of_book  VARCHAR2(100) := '&book_name'; -- Hardcoded name of the book
   v_date_of_issue DATE;
   v_status        CHAR(1);
   v_days_elapsed  NUMBER;
   v_fine_amount   NUMBER;
BEGIN
   -- Retrieve the Date of Issue and Status for the given Roll Number and Book Name
   SELECT DateofIssue, Status
   INTO v_date_of_issue, v_status
   FROM Borrower
   WHERE Rollin = v_roll_no AND NameofBook = v_name_of_book;

   -- Calculate the number of days elapsed
   v_days_elapsed := TRUNC(SYSDATE - v_date_of_issue);

   -- Check the number of days elapsed and calculate the fine amount
   IF v_days_elapsed >= 15 AND v_days_elapsed <= 30 THEN
      v_fine_amount := v_days_elapsed * 5; -- Rs 5 per day
   ELSIF v_days_elapsed > 30 THEN
      v_fine_amount := v_days_elapsed * 50; -- Rs 50 per day
   ELSE
      v_fine_amount := 0; -- No fine
   END IF;

   -- Update the status to 'R' after submitting the book
   IF v_status = 'I' THEN
      UPDATE Borrower
      SET Status = 'R'
      WHERE Rollin = v_roll_no AND NameofBook = v_name_of_book;
   END IF;

   -- If a fine is applicable, store the details in the Fine table
   IF v_fine_amount > 0 THEN
      INSERT INTO Fine (Roll_no, FineDate, Amt) -- Changed column name from Date to FineDate
      VALUES (v_roll_no, SYSDATE, v_fine_amount);
   END IF;

   -- Commit the changes to the database
   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Fine Amount Rs ' || v_fine_amount);
   DBMS_OUTPUT.PUT_LINE('Status updated to ' || v_status);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Borrower not found for the given Roll Number and Book Name.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
