CREATE OR REPLACE PACKAGE types
AS
    TYPE ref_cursor IS REF CURSOR;
END;

-- get mail route and truck they are assigned to
CREATE OR REPLACE PROCEDURE GetRouteAndTruck(cID in varchar2) as
--variables
  rID varchar2(64);
  vID varchar2(64);
  
BEGIN
--carriers view the mailroute and truck are assigned to
  select routeid, vehicleId into rID, vID from carrier
  join vehicles using(vehicleId)
  where employeeId = cId;
  --prints
 dbms_output.put_line('Carrier '||cID);
 dbms_output.put_line('RouteID'||rID);
 dbms_output.put_line('VehicleID  '||vID);
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for this address'||address);
END;
execute GetRouteAndTruck('01835 Eagle Crest Parkway');

 select routeid, vehicleId from carrier
  join vehicles using(vehicleId)
  where employeeid = 'CA1';


/* Find all mail postal code, */
CREATE OR REPLACE PROCEDURE GetMailByAddress2(address in varchar2, csr OUT SYS_REFCURSOR) AS
BEGIN
 open csr FOR
  select mailid, routeid,postalcode, weight from mail
  join postalcode using(postalcode)
  where deliveryaddress = address;
  close csr;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for this address'||address);
END;

 create or replace function GetMailByAddressTest(address IN varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailByAddress2(address,rc);
 return rc;
 end;		
select GetMailByAddressTest('01835 Eagle Crest Parkway') from dual;

  select mailid, routeid,postalcode, weight from mail
  join postalcode using(postalcode)
  where deliveryaddress = '01835 Eagle Crest Parkway';
/* Find all mail postal code, */
CREATE OR REPLACE PROCEDURE GetMailByPostalCode(pCode in varchar2, csr OUT SYS_REFCURSOR) as
BEGIN
--carriers view the mailroute and truck are assigned to
  dbms_output.put_line('ALL mail for PostalCode '||pCode);
 open csr FOR
  select mailid, deliveryaddress, weight from mail
  where postalcode = pCode;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for this postalcode'||pCode);
END;

create or replace function GetMailByPostalCodeTest(pCode IN varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailByPostalCode(pCode,rc);
 return rc;
 end;		
select GetMailByPostalCodeTest('H4J 6S7') from dual;


/* Find all mail based on route,*/
CREATE OR REPLACE PROCEDURE GetMailByRouteID(rID in varchar2, OUT csr SYS_REFCURSOR) as  
BEGIN
--carriers view the mailroute and truck are assigned to
dbms_output.put_line('ALL mail for route '||rID);
 open csr FOR
  select mailid, postalcode, address, weight from routes
  Join postalcode using(routeid)
  join mail using(postalcode)
  where routeid = rID;
   close csr;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for this route'||rID);
END;
execute GetMailByRoute('R1');

create or replace function GetMailByRouteIDTest(pCode IN varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailByRouteID(pCode,rc);
 return rc;
 end;		
select GetMailByRouteIDTest('R1') from dual;

CREATE or REPLACE FUNCTION FindReplacement(empId IN varchar2) RETURN varchar2
AS
    TYPE varchar64_va IS VARRAY(64) OF VARCHAR2(64);
    employeeIds varchar64_va; -- array of isbns for each book as varchar
    employeeRoute varchar(64);
    replacement varchar2(64);
    tempRouteId varchar2(64);
BEGIN
  select employeeid bulk collect into employeeIds from employees 
  where availability = 'available';
  
  if employeeIds.COUNT > 1 then
    --update employee that is calling in sick
    dbms_output.put_line(employeeIds(1) ||'found from select');
       if substr(empId, 1,2) = 'CA'then
       dbms_output.put_line(empId || 'input');
       select routeid into tempRouteId from carrier where employeeid = empId;
       dbms_output.put_line(tempRouteId);
       UPDATE carrier set routeid = tempRouteId where employeeId = empId;
       UpdateAvailability(empId, 'unavailable');
      end if;
  end if;
  RETURN tempRouteId;
END;
DECLARE
		replacement varchar2(64);
BEGIN
		replacement := FindReplacement('CA3');
		dbms_output.put_line(replacement);
END;

create or replace procedure UpdateAvailability(empId in varchar2, ablty in varchar2) as
--variables
emp varchar2(64);
BEGIN

SELECT employeeid INTO emp from employees where employeeid = empid;
       UPDATE employees set availability = ablty
        where employeeid = emp;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('UpdateAvailability - no employee with employee number '||empId);
      
END;
execute UpdateAvailability('CAA1', 'Available' );

  select employeeid from employees where employeeid = 'CA1';