CREATE OR REPLACE PROCEDURE ViewAVGRouteTime(csr OUT SYS_REFCURSOR) as  
BEGIN
  open csr for
  select ROUND(AVG(deliverydate- lastdelivered),2) AS AverageTime from routes
  join schedule using(scheduleid)
  where routestatus = 'Completed'
  group by routestatus;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No average to be displayed ');
END;
create or replace function ViewAVGRouteTimeTest RETURN sys_refcursor
 as
 rc sys_refcursor;
 begin
 ViewAVGRouteTime(rc);
 return rc;
 end;		
select ViewAVGRouteTimeTest from dual;

CREATE OR REPLACE PROCEDURE NonEmptyRoutes(csr OUT SYS_REFCURSOR) as  
BEGIN
  open csr for
  select routeid from routes 
  join postalcode using(routeid)
  left join carrier using(routeid)
  join schedule using(scheduleid)
  where employeeid is null and
  TO_DATE(deliverydate,'DD-MM-YY') between TO_DATE(current_date,'DD-MM-YY') 
and TO_DATE(current_date,'DD-MM-YY')+1 ;
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('All routes have carriers');
END;
CREATE OR REPLACE PROCEDURE UpdateCarrierSchedule as 

TYPE ids IS VARRAY(1000) of VARCHAR2(64);
    routes ids;
    carrierRouteIds ids;
    sID varchar(64);
BEGIN
  
 SELECT routeid BULK COLLECT INTO carrierRouteIds FROM carrier
 where routeid is not null;
  	dbms_output.put_line(carrierRouteIds(1));
  for i in 1..carrierRouteIds.Count LOOP
    select scheduleid into sID from routes 
    join schedule using(scheduleid)
    where routeid = carrierRouteIds(i);
    update employees set scheduleid = sID;
    
  end loop;
  
EXCEPTION
   WHEN NO_DATA_FOUND then 
    	dbms_output.put_line('No Mail for you to deliver ');
END;
execute UpdateCarrierSchedule;
