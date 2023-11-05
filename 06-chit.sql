SET SERVEROUTPUT ON
-- Create a PL/SQL stored procedure
CREATE OR REPLACE PROCEDURE proc_Grade(
    p_name IN VARCHAR2,
    p_total_marks IN NUMBER,
    p_class OUT VARCHAR2
) AS
BEGIN
    IF p_total_marks >= 990 AND p_total_marks <= 1500 THEN
        p_class := 'Distinction';
    ELSIF p_total_marks >= 900 AND p_total_marks <= 989 THEN
        p_class := 'First Class';
    ELSIF p_total_marks >= 825 AND p_total_marks <= 899 THEN
        p_class := 'Higher Second Class';
    ELSE
        p_class := 'Not Classified';
    END IF;
END;
/

---- Create the Result table if it doesn't exist
--CREATE TABLE Result (
--    Roll NUMBER,
--    Name VARCHAR2(100),
--    Class VARCHAR2(50)
--);
--
---- Sample data for the Stud_Marks table
---- Create and insert data into the Stud_Marks table
--CREATE TABLE Stud_Marks (
--    Name VARCHAR2(100),
--    Total_Marks NUMBER
--);
--
---- Insert sample data into the Stud_Marks table
--INSERT INTO Stud_Marks (Name, Total_Marks) VALUES ('John Doe', 1000);
--INSERT INTO Stud_Marks (Name, Total_Marks) VALUES ('Jane Smith', 980);

-- PL/SQL block to use the procedure and categorize students
DECLARE
    v_name Stud_Marks.Name%TYPE;
    v_total_marks Stud_Marks.Total_Marks%TYPE;
    v_class VARCHAR2(50);
BEGIN
    -- Retrieve data from the Stud_Marks table for each student
    FOR rec IN (SELECT Name, Total_Marks FROM Stud_Marks) LOOP
        v_name := rec.Name;
        v_total_marks := rec.Total_Marks;

        -- Call the proc_Grade procedure to categorize the student and get the class
        proc_Grade(v_name, v_total_marks, v_class);

        -- Insert the result into the Result table
        INSERT INTO Result (Roll, Name, Class)
        VALUES (1, v_name, v_class);
    END LOOP;

    COMMIT;
END;
/
