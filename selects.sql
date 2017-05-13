--comment
--carriers view the mailroute and truck are assigned to
select mailrouteid, vehicleid, from carriers
join mailroutes using(mailrouteid) 
join vehicles using(vehicleid)

/*
Carriers should be able to see the list of mail  
All the mail they must deliver, 
all the mail to be delivered in a specific postal code that is part of their route, 
all the mail addressed to a specific building that is part of their route.
*/
--all mail they must deliver
select carrierid, routeid, mailid from carriers 
join mailroutes using(routeid)
join mail using(routeid)

--all mail specific postal code
select carrierid, routeid, mailid from carriers 
join mailroutes using(routeid)
join mail using(routeid) where postalcodeid = 'j4g1h3';

--all mail to a specific buildiling 
select carrierid, routeid, mailid from carriers 
join mailroutes using(routeid)
join mail using(routeid) where deliveryaddress = '123 fake street';


--comment
--carriers view the mailroute and truck are assigned to
select routeid, vehicleid, from carrier
join routes using(routeid) 
join vehicles using(vehicleid)

/*
Carriers should be able to see the list of mail  
All the mail they must deliver, 
all the mail to be delivered in a specific postal code that is part of their route, 
all the mail addressed to a specific building that is part of their route.
*/
--all mail they must deliver
select carrierid, routeid, mailid from carrier
join postalcode using(routeid)
join mail using (postalcode)
where carrierid = 'C1';

--all mail specific postal code
select carrierid, routeid, mailid from carrier
join postalcode using(routeid) 
join mail where postalcodeid = 'j4g1h3';

--all mail to a specific building 
select carrierid, routeid, mailid from carriers 
join Postalcode using(routeid)
join mail using (postalcode)
where deliveryaddress = '123 fake street';

-- registered mail, carrier must be able to mark each parcel or letter
-- as delivered
select mailid from Mail
join routes using(routeid)
join Carrier using(routeid)
where carrierid = 'c1'
and  registration = 'Registered'

select mailid from carrier 
join routes using(routeid)
join postalcode using(routeid)
join mail using(postalcode)
-- then update which mail has been delivered 
UPDATE MAIL set deliverystatus = 'notdelivered'
where mailid = 'mailidfrom this select statement above'

-- carrier must be able to mark route as started 
select routeid from carriers 
where carrierid = 'this carrier id from input'
--then
UPDATE Routes set routestatus = 'onroute'
WHERE routeid = 'carrierouteid'

--carrier must be able to mark their route as completed
--upon completion, the carrier must specify any letters
-- that were unable to be delivered an mark their status 
-- as undeliverable
UPDATE Routes set routestatus = 'onroute'
WHERE routeid = 'carrierouteid'
--AND
UPDATE MAIL set deliverystatus = 'notdelivered'
where mailid = 'givenmailidfromcarrierinput'

--carriers must be able to mark themselves as unavailable
 UPDATE employees set availability = 'availabiilitystatusfromuser'
 where employeeid = 'his/hers employee id'
 
 -- call replacement procedure
 select employeeid from employees 
 -- first one where availability = 'available'
 Availability = 'AVAILABLE' 
 --or Availability = 'UNAVAILABLE' or Availability = 'SICK' 
 --or Availability='OFFDUTY' or Availability='ONVACATION' 
 --or Availability='ONDUTY'),
 
 -- END OF CARRIERS
 

 --CLERKS
 
 -- add new mail to the system 
 --INSERT INTO MAIL VALUES ()-
 
 -- substring word up to space and check charAt(0)
 
 CREATE OR REPLACE TRIGGER before_Mail_INSERTORUPDATE
 AFTER INSERT OR UPDATE
 ON MAIL
 
 SELECT NVL(SUBSTR('ABC_blah', 0, 
			INSTR('ABC_blah', '_')-1), 'ABC_blah') AS output
  FROM table
 


--comment
--carriers view the mailroute and truck are assigned to
select routeid, vehicleid from carrier
join routes using(routeid) 
join vehicles using(vehicleid);


/*
Carriers should be able to see the list of mail  
All the mail they must deliver, 
all the mail to be delivered in a specific postal code that is part of their route, 
all the mail addressed to a specific building that is part of their route.
*/
--select postalcode FROM routecodes where routeid = 'R1';

--all mail they must deliver
select employeeid, routeid from carrier
join mail using(routeid) where employeeid = 'CA7';

--all mail specific to a postal code
select routeid from carrier 
join mail using(routeid)
where employeeid = 'CA1' and postalcode = 'H2M 0T1';

--all mail to a specific buildiling 
select carrierid, routeid, mailid from carriers 
join Postalcode using(routeid)
join mail using (postalcode)
where deliveryaddress = '123 fake street';

-- registered mail, carrier must be able to mark each parcel or letter
-- as delivered
select mailid from Mail
join routes using(routeid)
join Carrier using(routeid)
where employeeid = 'CA1'
and  registration = 'Registered';

--carrier must be able to mark
select routeid from carrier 
join routes using(routeid);
update routes set routestatus = 'onroute' where routeid = 'routeid from carrier';


-- then update which mail has been delivered 
UPDATE Routes set routestatus = 'delivered'
where mailid = 'mailidfrom this select statement above';

-- carrier must be able to mark route as started 
select routeid from carriers 
where employeeid = 'this carrier id from input';
--then
UPDATE Routes set routestatus = 'onroute'
WHERE routeid = 'carrierouteid';

--carrier must be able to mark their route as completed
--upon completion, the carrier must specify any letters
-- that were unable to be delivered an mark their status 
-- as undeliverable
UPDATE Routes set routestatus = 'complete'
WHERE routeid = 'carrierouteid';
--AND
UPDATE MAIL set deliverystatus = 'notdelivered'
where mailid = 'givenmailidfromcarrierinput';

--carriers must be able to mark themselves as unavailable
 UPDATE employees set availability = 'availabiilitystatusfromuser'
 where employeeid = 'his/hers employee id';
 
 -- call replacement procedure 
 -- first one where availability = 'available'
 
 --or Availability = 'UNAVAILABLE' or Availability = 'SICK' 
 --or Availability='OFFDUTY' or Availability='ONVACATION' 
 --or Availability='ONDUTY'),
 
 -- END OF CARRIERS
 

 --CLERKS
 
 -- add new mail to the system 
 --INSERT INTO MAIL VALUES ()-
 insert into Mail 
 values (
  MailIdSequence.NEXTVAL, -- id
  'R1', -- routeid
  'Unregistered', --registration
  'H6W 3W9', --postal code
  '', -- return address
  '7075 Sullivan Lane', -- devlivery address
  1, -- weight 
  239, 
  'DELIVERED', 
  'Mohandis Brader', 
  'Freeman Daintrey');
 
 -- get shipping cost based on weight and location, and reject mail whose postage
 -- is insufficient or which is over 500g
 -- change postage to carry doubles
 
 -- should do shipping cost table 
 
 -- sent to XXX for neighbouring mail facilities 
 -- sent to airport if it is within a different postal district 
 
 
 -- view all mail by route, postal code, address and name of RECIPIENT
 select mailid, routeid, postalcode, deliveryaddress FROM mail
 where receivername = 'receivername from input';
 
 --Postmasters
 
 --view all non empty routes that do not have either a truck or a carrier
 select routeid from routes right join carrier 
 where employeeid is null
 UNION
 select routeid from routes left join carriers
 where vehicleid is null;
 
 --create new empty mail route
 
 -- keep routecodes table 
 -- primary key is postal code
 -- foreign key is routes id 
 
 -- when routes gets inserted update routecodes with nullable postalcode
 -- when mail gets inserted insert postal code into first available routeid in routecode
 
 --modify an existing mail route by adding or removing postal codes from it
 UPDATE Routes set routestatus = 'delivered'
where mailid = 'mailidfrom this select statement above';
 
 --building 1 H4T 
 -- building 2 H7J
select nvl (substr(postalcode, 4, 2),null) as endofpostalcode from mail;

 
select * from routes 
join postalcode using(routeid)
left join carrier using(routeid)
join employees using(employeeid)
join schedule using(scheduleid)
where employeeid is null;

select * from routes 
join postalcode using(routeid)
left join carrier using(routeid)
join schedule using(scheduleid)
where employeeid is null and
date = TO_DATE(current_date,'format') and date = TO_DATE(current_date+1,'format');


select avg(deliverydate) from 
  (select deliverydate from schedule 
  join routes using(scheduleid)
  where routestatus = 'Completed')
  group by routeid;
  

select vehicleid from vehicles
where vehicleid = 'vID'

--update vehicles set vehiclestatusid = 'status';






