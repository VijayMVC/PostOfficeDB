DROP TRIGGER Employeesa;
DROP TRIGGER Employeesb;

CREATE OR REPLACE TRIGGER Employees_after_insert
AFTER INSERT
   ON Employees
   FOR EACH ROW

DECLARE
   v_EmployeeId VARCHAR2(64); 
   phoneNo VARCHAR2(64);
   TYPE buildingN IS VARRAY(1000) of VARCHAR2(64);
   TYPE routeN IS VARRAY(1000) of VARCHAR2(64);
   TYPE vehicleN IS VARRAY(1000) of VARCHAR2(64);
   buildings buildingN;
   routes routeN;
   vehicles vehicleN;
BEGIN
     DBMS_OUTPUT.PUT_LINE('Entered employees after insert trigger');
    IF :new.Role  = 'PostMaster' then
    INSERT INTO BUILDING (BuildingId, EmployeeId, Phone) VALUES (BuildingIdSequence.NEXTVAL, ('PM' || :new.EmployeeId), :new.Phone);
    INSERT INTO POSTMASTERS (EmployeeId, ExtensionNo, Officeno) VALUES (('PM' || PmIdSequence.currval), PmExtensionSequence.NEXTVAL, PmOfficeNumSequence.NEXTVAL);
   END IF;
END;