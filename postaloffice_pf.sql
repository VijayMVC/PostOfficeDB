
create or replace function GetMailToDeliverByAddressTest(cID IN varchar, address in varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailToDeliverByAddress(cID,address, rc);
 return rc;
 end;		
select GetMailToDeliverByAddressTest('CA1','79 Trailsway Circle') from dual;

CREATE OR REPLACE PROCEDURE MarkRouteStatus(cID in varchar2,rID in varchar2, status IN varchar2) as
 tempRouteID varchar2(64);
BEGIN
--update mark a route as started 
select routeid into tempRouteID from carrier 
join routes using(routeid)
where routeid = rID
and employeeid = cID;

if rID = tempRouteID then
  update routes set routestatus = status where routeid = tempRouteID;
end if;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No route updated '||rID);
END;
Execute MarkRouteStatus('CA1','R3','Started') ;

--mark each individual parcel or letter as delivered
CREATE OR REPLACE PROCEDURE MarkMailStatus(cID in varchar2,mId in varchar2, status IN varchar2) as
  tempdeliverystatus varchar2(64);
 tempMailId varchar2(64);
BEGIN
--get parcel with mID
    select mailid into tempMailId from carrier
    join routes using(routeid)
    join postalcode using(routeid)
    join mail using(postalcode)
    where employeeid = cID
    and mailid = mID;
    -- update mail status for this particular parcel
    if tempMailId = mId then
      update mail set deliverystatus = status where mailid = tempMailID;
    end if;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for you to deliver '||cID);
END;
		
Execute MarkMailStatus('CA1','M12', 'delivered') ;

--get mail to delivery to specific building
CREATE OR REPLACE PROCEDURE GetMailToDeliverByAddress(cID in varchar2,address in varchar2,csr OUT SYS_REFCURSOR) as  
BEGIN
  open csr for
  select routeid, mailid, deliveryaddress from carrier 
join Postalcode using(routeid)
join mail using (postalcode)
where employeeid = cID and deliveryaddress = address;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for you to deliver '||cID);
END;
create or replace function GetMailToDeliverByAddressTest(cID IN varchar, address in varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailToDeliverByAddress(cID,address, rc);
 return rc;
 end;		
select GetMailToDeliverByAddressTest('CA1','79 Trailsway Circle') from dual;


--get mail to deliver by postal code
CREATE OR REPLACE PROCEDURE GetMailToDeliverByPCode(cID in varchar2,pCode in varchar2,csr OUT SYS_REFCURSOR) as  
BEGIN
  open csr for
  select routeid, mailid, deliveryaddress from carrier 
  join postalcode using(routeid)
  join mail using(postalcode)
where employeeid = cId and postalcode = pCode;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for you to deliver '||cID);
END;
create or replace function GetMailToDeliverByPCodeTest(cID IN varchar, pCode in varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailToDeliverByPCode(cID,pCode, rc);
 return rc;
 end;		
select GetMailToDeliverByPCodeTest('CA1','H7T 3R4') from dual;

-- get mail route and truck they are assigned to
CREATE OR REPLACE PROCEDURE GetMailToDeliver(cID in varchar2,csr OUT SYS_REFCURSOR) as  
BEGIN
	dbms_output.put_line(cID);
--carriers view the mailroute and truck are assigned to
  open csr for
  select employeeid, routeid, mailid, postalcode from carrier
  join postalcode using(routeid)
  join mail using (postalcode)
  where employeeid = cID
  and deliverystatus is null;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for you to deliver '||cID);
END;
create or replace function GetMailToDeliverTest(cID IN varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailToDeliver(cID,rc);
 return rc;
 end;		
select GetMailToDeliverTest('CA7') from dual;

-- get mail route and truck they are assigned to
CREATE OR REPLACE PROCEDURE GetRouteAndTruck(cID in varchar2,csr OUT SYS_REFCURSOR) as  
BEGIN
	dbms_output.put_line(cID);
--carriers view the mailroute and truck are assigned to
  open csr for
  select routeid, vehicleId from carrier
  join vehicles using(vehicleId)
  where employeeId = cID;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Route or Vehicle info for Carrier '||cID);
END;
create or replace function GetRouteAndTruckTest(cID IN varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetRouteAndTruck(cID,rc);
 return rc;
 end;		
select GetRouteAndTruckTest('CA1') from dual;

/* Find all mail postal code, */
CREATE OR REPLACE PROCEDURE GetMailByAddress(address in varchar2, csr OUT SYS_REFCURSOR) AS
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
CREATE OR REPLACE PROCEDURE GetCarrierMailByRoute(rID in varchar2, csr OUT SYS_REFCURSOR) as  
BEGIN
--carriers view the mailroute and truck are assigned to
dbms_output.put_line('ALL mail for route '||rID);
 open csr FOR
  select mailid, postalcode, deliveryaddress, weight from routes
  Join postalcode using(routeid)
  join mail using(postalcode)
  where routeid = rID;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for this route'||rID);
END;
create or replace function GetMailByRouteIDTest(pCode IN varchar) RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 GetMailByRouteID(pCode,rc);
 return rc;
 end;		
select GetMailByRouteIDTest('R1') from dual;
-- find replacement and update their availability and availability of replacement
CREATE or REPLACE Procedure FindReplacement(empId IN varchar2)
AS
    TYPE varchar64_va IS VARRAY(64) OF VARCHAR2(64);
    employeeIds varchar64_va; -- array of isbns for each book as varchar
    employeeRoute varchar(64);
    replacement varchar2(64);
    tempRouteId varchar2(64);
BEGIN
  select employeeid bulk collect into employeeIds from employees 
  where availability = 'AVAILABLE';
    if employeeIds.COUNT > 1 then
    --update employee that is calling in sick
       if substr(empId, 1,2) = 'CA' then
       select routeid into tempRouteId from carrier where employeeid = empId;
       UPDATE carrier set routeid = tempRouteId where employeeId = employeeIds(1);
       UPDATE carrier set routeid = null where employeeId = empId;
       UpdateAvailability(employeeIds(1), 'ONDUTY');
       UpdateAvailability(empId, 'UNAVAILABLE');
      end if;
      else
      UpdateAvailability(employeeIds(1), 'ONDUTY');
       UpdateAvailability(empId, 'UNAVAILABLE');
  end if;
END;
execute FindCarrierReplacement('CA3');
select substr('CA3', 1,2) from dual;

create or replace procedure UpdateAvailability(empId in varchar2, ablty in varchar2) as
--variables
emp varchar2(64);
BEGIN
SELECT employeeid INTO emp from employees where employeeid = empid;
  if emp is not null then
       UPDATE employees set availability = ablty
        where employeeid = emp;
  end if;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('UpdateAvailability - no employee with employee number '||empId);
      
END;
execute UpdateAvailability('CAA1', 'Available' );
select employeeid from employees where employeeid = 'CA1';