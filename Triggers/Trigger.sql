/* Get proper EmployeeId */
CREATE OR REPLACE TRIGGER Employees_before_insert
before INSERT
   ON Employees
   FOR EACH ROW

DECLARE
    TYPE routeN IS VARRAY(1000) of VARCHAR2(64);
    routes routeN;
    tempSID varchar2(64);
   role_xcep EXCEPTION;
   PRAGMA EXCEPTION_INIT( role_xcep, -20001 );
   
BEGIN
  SELECT routeId BULK COLLECT INTO routes FROM ROUTES ORDER BY dbms_random.value; 
   DBMS_OUTPUT.PUT_LINE('Entered employees before insert trigger');
   -- Get EmployeeId
    IF :new.Role  = 'PostMaster' then
       :new.EmployeeId := ('PM' || :new.EmployeeId);
       DBMS_OUTPUT.PUT_LINE('Inserting ' || :new.EmployeeId);

    ELSIF :new.Role  = 'Clerk' then
       :new.EmployeeId := ('CL' || :new.EmployeeId);
       DBMS_OUTPUT.PUT_LINE('Inserting ' || :new.EmployeeId);
       
    ELSIF :new.Role  = 'Carrier' then
       :new.EmployeeId := ('CA' || :new.EmployeeId);
      DBMS_OUTPUT.PUT_LINE('Inserting ' || :new.EmployeeId);

    ELSE
      DBMS_OUTPUT.PUT_LINE('Error: Role not recognized [Recognized roles: POSTMASTER, CLERK, CARRIER]');
      raise role_xcep;
   END IF;
END;

/* Generate routeid */
CREATE OR REPLACE TRIGGER Routes_before_insert
BEFORE INSERT
   ON Routes
   FOR EACH ROW
  declare 
   TYPE scheduleIds IS VARRAY(1000) of VARCHAR2(64);
   sIDS scheduleIds;
BEGIN
  :new.RouteId :=('R' || :new.RouteId);
  -- should be this or is between value for current_date and current_date + 3 or something
   SELECT scheduleid BULK COLLECT INTO sIDS FROM schedule ORDER BY dbms_random.value;
  if sIDS.Count > 0 then
    :new.ScheduleId := sids(1);
  end if;
END;

/* Generate VehicleId */
CREATE OR REPLACE TRIGGER Vehicles_before_insert
BEFORE INSERT
   ON Vehicles
   FOR EACH ROW
BEGIN
  :new.VehicleId :=('V' || :new.VehicleId);
END;

/*Trigger to automaticall place employee in proper table after employee insert */
CREATE OR REPLACE TRIGGER Employees_After_insert
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
  tempSID varchar2(64);
BEGIN
    /* If the role is PostMaster then we want to insert them into buildings table */
    DBMS_OUTPUT.PUT_LINE('Entered employee after trigger insert');
    IF :new.Role  = 'PostMaster' then
      INSERT INTO BUILDING (BuildingId, EmployeeId, Phone) VALUES (BuildingIdSequence.NEXTVAL, :new.EmployeeId, :new.Phone);
    END IF;
    SELECT buildingID BULK COLLECT INTO buildings FROM BUILDING ORDER BY dbms_random.value;
    SELECT routeId BULK COLLECT INTO routes FROM postalcode ORDER BY dbms_random.value; 
    SELECT vehicleId BULK COLLECT INTO vehicles FROM VEHICLES WHERE VehicleStatusId = 'AVAIL' ORDER BY dbms_random.value; 

    IF :new.Role  = 'PostMaster' then
       /* Get building phone number */
       SELECT PHONE INTO phoneNo FROM BUILDING WHERE EMPLOYEEID = :new.EmployeeId;
       /* Insert into postmasters */
       INSERT INTO POSTMASTERS (EmployeeId, ExtensionNo, OfficeNo) VALUES (:new.EmployeeId, PMExtensionSequence.NEXTVAL, PMOfficeNumSequence.NEXTVAL);
    
    ELSIF :new.Role  = 'Clerk' then
       /*Insert into clerk */
        INSERT INTO CLERK (EmployeeId, OfficeNo, ExtensionNo, BuildingId) VALUES (:new.EmployeeId, CLOfficeNumSequence.NEXTVAL, CLExtensionSequence.NEXTVAL, buildings(1));
   
    ELSIF :new.Role  = 'Carrier' then
       /*Insert into carrier */
        IF :new.Availability = 'ONDUTY' THEN
       /*Insert into carrier */
          INSERT INTO CARRIER (EmployeeId, RouteId, VehicleId, BuildingId) VALUES (:new.EmployeeId, routes(1), vehicles(1), buildings(1));
         
        ELSE
          INSERT INTO CARRIER (EmployeeId, RouteId, VehicleId, BuildingId) VALUES (:new.EmployeeId, null, null, buildings(1));
        END IF;
    END if;
END;

/* Find available truck */
CREATE OR REPLACE TRIGGER before_carrier_insert
BEFORE INSERT
   ON carrier
   FOR EACH ROW
DECLARE
  vId VARCHAR2(64);
BEGIN
  /* Get first instance of an "AVAIL" (available) vehicle */
  SELECT vehicleId INTO vId FROM vehicles WHERE vehicleStatusId = 'AVAIL' and rownum = 1;
  if vId is not null then
  :new.VehicleId := vId;
   UPDATE vehicles SET VehicleStatusId = 'INUSE' where vehicleId = vId;
  end if;
  /* Update vehicle status to now show INUSE */
END;

/* Reset all vehicles to AVAIL when route is finished */
CREATE OR REPLACE TRIGGER after_routes_update
AFTER UPDATE
ON routes
   FOR EACH ROW
DECLARE
  rId VARCHAR2(64);
  vId VARCHAR2(64);
BEGIN
  /* Check if status is being changed to completed */
 if :new.routestatus = 'Completed' then
  rId := :new.routeId;

  /* Use routeId to find vehicleId from carrier table */
  SELECT vehicleId INTO vID FROM carrier WHERE routeId = rId;
  
  /* Use vehicleId to set vehicle status to AVAIL */
  UPDATE vehicles SET vehicleStatusId = 'AVAIL' where vehicleId = vId;
 END IF;
END;

/* Generate scheduleId */
CREATE OR REPLACE TRIGGER before_schedule_insert
BEFORE INSERT
   ON schedule
   FOR EACH ROW
BEGIN
  :new.scheduleId :=('S' || :new.scheduleId);
END;


----------------------------
CREATE OR REPLACE TRIGGER before_mail_insert
 BEFORE INSERT
 ON MAIL
 for each row
DECLARE
  routePostFix VARCHAR2(64);
  role_xcep EXCEPTION;
  PRAGMA EXCEPTION_INIT( role_xcep, -20001 );
BEGIN
  IF :new.ReturnAddress is null then
    IF:new.Registration = 'Registered' then
      DBMS_OUTPUT.PUT_LINE('Error: Registered mail must have a return address');
      raise role_xcep;
   END IF;
   END IF;
  if length(:new.PostalCode) = 7 then
    if substr(:new.PostalCode, 1, 3) = 'H4J' OR substr(:new.PostalCode, 1, 3) = 'H7T' then
      routePostFix := substr(:new.PostalCode, 5, 1);
      insert into postalcode (postalCode, routeID) values (:new.PostalCode, ('R'||routePostFix));
      :new.Country := 'local';
    END IF;
  ELSE
    if length(:new.PostalCode) = 5 then
      :new.Country := 'us';
      :new.SentTo := 'sent to airport';
 
    ELSIF length(:new.postalCode) > 5 then
      :new.country := 'international';
      :new.SentTo := 'sent to airport';
    END IF;
  End IF;
  :new.MailId := 'M'||:New.MailId;
END;

