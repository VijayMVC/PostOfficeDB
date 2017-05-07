/* Get proper EmployeeId */
CREATE OR REPLACE TRIGGER Employees_before_insert
BEFORE INSERT
   ON Employees
   FOR EACH ROW

DECLARE
   role_xcep EXCEPTION;
   PRAGMA EXCEPTION_INIT( role_xcep, -20001 );
BEGIN

   -- Get EmployeeId
    IF :new.Role  = 'PostMaster' then
       :new.EmployeeId := ('PM' || EmployeeIdSequence.NEXTVAL);
       
    ELSIF :new.Role  = 'Clerk' then
       :new.EmployeeId := ('CL' || EmployeeIdSequence.NEXTVAL);
       
    ELSIF :new.Role  = 'Carrier' then
       :new.EmployeeId := ('CA' || EmployeeIdSequence.NEXTVAL);
    
    ELSE
      DBMS_OUTPUT.PUT_LINE('Error: Role not recognized [Recognized roles: POSTMASTER, CLERK, CARRIER');
      raise role_xcep;
   END IF;
END;

/* Generate routeid */
CREATE OR REPLACE TRIGGER Routes_before_insert
BEFORE INSERT
   ON Routes
   FOR EACH ROW
BEGIN
  :new.RouteId :=('R' || RouteIdSequence.NEXTVAL);
END;

/* Generate VehicleId */
CREATE OR REPLACE TRIGGER Vehicles_before_insert
BEFORE INSERT
   ON Vehicles
   FOR EACH ROW
BEGIN
  :new.VehicleId :=('V' || VehicleIdSequence.NEXTVAL);
END;