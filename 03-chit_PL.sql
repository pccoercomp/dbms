SET SERVEROUTPUT ON
-- PL/SQL block to check attendance and update status
CREATE TABLE Stud (
    Roll NUMBER,
    Att NUMBER,
    Status CHAR(2)
);
-- Insert data into the Stud table
INSERT INTO Stud (Roll, Att, Status) VALUES (1, 80, 'ND');
INSERT INTO Stud (Roll, Att, Status) VALUES (2, 60, 'D');
INSERT INTO Stud (Roll, Att, Status) VALUES (3, 90, 'ND');

DECLARE
   v_roll_no NUMBER;
   v_attendance NUMBER;
   v_status CHAR(2);

BEGIN
   -- Accept roll_no from the user
   
   v_roll_no := &roll_no;

   -- Retrieve attendance and status from the Stud table
   SELECT Att, Status
   INTO v_attendance, v_status
   FROM Stud
   WHERE Roll = v_roll_no;

   -- Check attendance percentage and update status
   IF v_attendance < 75 THEN
      v_status := 'D';
      DBMS_OUTPUT.PUT_LINE('Term not granted');
   ELSE
      v_status := 'ND';
      DBMS_OUTPUT.PUT_LINE('Term granted');
   END IF;

   -- Update the status in the Stud table
   UPDATE Stud
   SET Status = v_status
   WHERE Roll = v_roll_no;

   COMMIT;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Student not found for the given Roll Number.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
