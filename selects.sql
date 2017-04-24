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


select * from 


