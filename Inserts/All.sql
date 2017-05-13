/*
DROP TABLE "BUILDING" CASCADE CONSTRAINTS;                      
DROP TABLE "CREDENTIALS" CASCADE CONSTRAINTS;                   
DROP TABLE "MAIL" CASCADE CONSTRAINTS;                          
DROP TABLE "POSTMASTERS" CASCADE CONSTRAINTS;                   
DROP TABLE "POSTALCODE" CASCADE CONSTRAINTS;                    
DROP TABLE "SCHEDULE" CASCADE CONSTRAINTS;                      
DROP TABLE "CARRIER" CASCADE CONSTRAINTS;                       
DROP TABLE "CLERK" CASCADE CONSTRAINTS;                         
DROP TABLE "ROUTES" CASCADE CONSTRAINTS;    
DROP TABLE "VEHICLES" CASCADE CONSTRAINTS;                      
DROP TABLE "VEHICLESTATUS" CASCADE CONSTRAINTS;                 
DROP TABLE "EMPLOYEES" CASCADE CONSTRAINTS;
SELECT 'DROP TABLE "' || table_name || '" CASCADE CONSTRAINTS;' FROM user_tables;
SELECT 'TRUNCATE TABLE "' || table_name || '";' FROM user_tables;
*/

insert into Schedule values (ScheduleIdSequence.NEXTVAL, '9:20 AM', '6:41 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:10 AM', '6:30 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:04 AM', '6:28 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:26 AM', '6:50 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:35 AM', '5:31 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:08 AM', '6:51 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:11 AM', '6:01 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:23 AM', '5:40 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:55 AM', '6:48 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:20 AM', '6:16 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:58 AM', '6:33 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:48 AM', '5:37 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:01 AM', '5:04 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:28 AM', '6:20 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:37 AM', '6:24 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:37 AM', '5:22 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:20 AM', '6:00 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:27 AM', '5:43 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '8:11 AM', '5:41 PM',CURRENT_DATE);
insert into Schedule (ScheduleId, StartTime, EndTime, deliverydate) values (ScheduleIdSequence.NEXTVAL, '9:53 AM', '6:16 PM',CURRENT_DATE);


insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'nonummy', to_date('2017-04-28', 'yyyy-mm-dd'), null  , 'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'libero', to_date('2017-04-28', 'yyyy-mm-dd'),  null  , 'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'morbi', to_date('2017-04-28', 'yyyy-mm-dd'),   null  , 'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'parturient', to_date('2017-04-28', 'yyyy-mm-dd'),null, 'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'morbi', to_date('2017-04-28', 'yyyy-mm-dd'),  null   , 'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'donec', to_date('2017-04-28', 'yyyy-mm-dd'),  null   , 'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'augue', to_date('2017-04-28', 'yyyy-mm-dd'),  null   , 'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'semper', to_date('2017-04-28', 'yyyy-mm-dd'), null   ,  'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'et', to_date('2017-04-28', 'yyyy-mm-dd'),     null   ,   'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'id', to_date('2017-04-28', 'yyyy-mm-dd'),     null   ,   'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'curabitur', to_date('2017-04-28', 'yyyy-mm-dd'), null,    'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'magna', to_date('2017-04-28', 'yyyy-mm-dd'),     null,    'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'molestie', to_date('2017-04-28', 'yyyy-mm-dd'),  null,    'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'fringilla', to_date('2017-04-28', 'yyyy-mm-dd'), null,    'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'nec', to_date('2017-04-28', 'yyyy-mm-dd'),       null,     'Incomplete');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'non', to_date('2017-04-28', 'yyyy-mm-dd'),       null,     'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'odio', to_date('2017-04-28', 'yyyy-mm-dd'),      null,      'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'donec', to_date('2017-04-28', 'yyyy-mm-dd'),     null,       'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'adipiscing', to_date('2017-04-28', 'yyyy-mm-dd'),null,        'Completed');
insert into Routes (RouteId, RouteName, LastDelivered,scheduleid, RouteStatus) values (RouteIdSequence.NEXTVAL, 'tempus', to_date('2017-04-28', 'yyyy-mm-dd'),    null,         'Incomplete');


insert into VehicleStatus (VehicleStatusId, Name) values ('AVAIL', 'AVAILABLE');
insert into VehicleStatus (VehicleStatusId, Name) values ('DECOM', 'DE-COMMISSIONED');
insert into VehicleStatus (VehicleStatusId, Name) values ('INUSE', 'IN-USE');

insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'E8E FE6', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'A2A CD3', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'B6A CC1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'B8B CE2', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D2A FA6', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'E7D AA7', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'E3B EB4', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D2A DF8', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'F1B FF2', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'F4F DE2', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'B5D EE9', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'A8C BE6', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'B9D EF7', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D1A AE5', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D9C BC6', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'E0F CD3', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'C3A FF3', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'E3A CF5', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DD1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'E8E CA6', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DD1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DF1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DG1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DH1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DI1', 'AVAIL');
insert into Vehicles (VehicleID, PlateNo, VehicleStatusId) values (VehicleIdSequence.NEXTVAL, 'D4E DJ1', 'AVAIL');

UPDATE vehicles set vehiclestatusid = 'AVAIL' where vehiclestatusid = 'INUSE';


insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 1W2', '405 Springs Drive', '1 American Place', 24, 451, null, 'Amity Denty', 'Christiane Hardie');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', '90210', '', '61091 Pearson Hill', 24, 449, null, 'Yelena Kemmish', 'Mimi Siburn');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', '202190', '54 Quincy Center', '1298 Tomscot Plaza', 10, 38, 'delivered', 'Celia Horley', 'Bradan McCleverty');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H7T 1L2', '9 Scott Crossing', '8463 Mccormick Lane', 10, 256, 'delivered', 'Annalise Meech', 'Annice Ryce');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 4L1', '', '563 Granby Avenue', 10, 322, null, 'Brynna O''Shee', 'Bryana Danielot');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'HAT 1W3', '91321 Glendale Avenue', '08936 Bonner Lane', 4, 125, null, 'Ciro Vaughten', 'Northrup McGirr');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 6S7', '26 Westend Avenue', '9496 Bashford Trail', 5, 403, null, 'Averyl Oakenfield', 'Tamas Ubach');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 1H9', '88 Melby Terrace', '01835 Eagle Crest Parkway', 6, 346, 'delivered', 'Blane Khotler', 'Christabella Stearn');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 9W4', '', '24 Mitchell Hill', 24, 112, null, 'Guthrie Whanstall', 'Giselle Pettisall');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 2W6', '401 Onsgard Plaza', '83 Vidon Court', 3, 472, 'delivered', 'Hadrian Yeardsley', 'Kleon Aarons');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 7J3', '9683 Fieldstone Way', '94 Evergreen Pass', 14, 36, null, 'Frank Fernandez', 'Curcio Matchitt');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H7T 3R4', '', '79 Trailsway Circle', 17, 266, null, 'Curr Etteridge', 'Beatrisa Ireson');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 8W8', '5502 Warbler Lane', '40790 Sloan Avenue', 12, 264, 'delivered', 'Martguerita Hurst', 'Lyle Sauvain');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 4S2', '', '50 Fisk Parkway', 25, 147, null, 'Dania Deek', 'Beatrix Dunbobbin');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 1W6', '1 Bultman Point', '312 Magdeline Drive', 6, 351, null, 'Lura Englefield', 'Marie Tabart');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 2W9', '35 Pawling Court', '18983 Delaware Place', 17, 297, 'delivered', 'Adaline Loble', 'Austen Hysom');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 5T9', '25236 Jackson Alley', '10476 East Place', 4, 181, null, 'Ricki MacCroary', 'Evey Dullingham');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 6R1', '926 Acker Drive', '68569 Stang Parkway', 11, 110, 'delivered', 'Cristionna Rittmeier', 'Man Hannan');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 3W4', '72758 Lake View Place', '88567 Michigan Pass', 3, 319, null, 'Sigismondo Gibling', 'Carri Briamo');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 2R1', '1696 Westridge Circle', '511 Petterle Terrace', 25, 349, null, 'Lindon Baseggio', 'Priscilla Burchill');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 1W8', '684 Gateway Street', '37 Springview Way', 13, 409, 'delivered', 'Wadsworth Bondy', 'Grantham Vaughten');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 4W1', '', '74 Fordem Point', 9, 57, 'delivered', 'Pepe Cains', 'Clarance Twitty');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 8J5', '9 Waywood Lane', '77151 Maple Court', 18, 91, null, 'Lyndsie Jenken', 'Florentia Ruscoe');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 8J8', '4519 Crescent Oaks Place', '815 Autumn Leaf Way', 0, 493, null, 'Dermot Hanrahan', 'Dore Pailin');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 9S5', '', '68 Westend Trail', 17, 202, null, 'Patten Facer', 'Marrilee Gritsaev');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H7T 5J6', '4 Division Place', '090 Welch Plaza', 4, 136, 'delivered', 'Normie Geelan', 'Eva Ibell');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H7T 8H3', '48 Vernon Road', '88 Roth Crossing', 28, 423, null, 'Gates Brinsford', 'Nichole Westcar');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 9T2', '7435 Delladonna Terrace', '7033 Dakota Drive', 16, 438, null, 'Reinhold Alban', 'Aili Manueau');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 6W9', '94673 Lakewood Junction', '75844 Coolidge Road', 9, 109, 'delivered', 'Prent Patroni', 'Demott Le Friec');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 3W2', '786 Stoughton Trail', '2 Lyons Parkway', 20, 24, null, 'Jeffy Sheehy', 'Guthrey Geroldini');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 5H1', '', '41834 Gateway Point', 13, 263, 'delivered', 'Greg Langridge', 'Natalya Loughlin');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H7T 5L5', '031 Lien Avenue', '90781 Scott Parkway', 15, 209, null, 'Hadlee Foucard', 'Bradford Basnall');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H7T 4J8', '17707 Mayfield Parkway', '86546 Boyd Junction', 21, 440, 'delivered', 'Johnath O''Doherty', 'Magdaia Teather');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H7T 6W1', '793 Rusk Terrace', '07 Gale Hill', 3, 89, null, 'Clarissa Saltsberg', 'Basile Fudge');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 4R6', '88469 Rigney Road', '5321 Barby Park', 20, 349, null, 'Torie Eve', 'Cindi Pavlenkov');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'registered', 'H4J 1J3', '7 Forest Dale Trail', '59 Independence Drive', 25, 414, null, 'Jude Ducker', 'Eric Keme');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 1H2', '4715 Onsgard Court', '37 Erie Road', 4, 95, 'delivered', 'Cybil Petrollo', 'Erinna Brelsford');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 5L6', '92 Killdeer Crossing', '747 Grayhawk Circle', 0, 122, 'delivered', 'Ariella Shotboult', 'Carl Tappor');
insert into Mail (MailId, Registration, PostalCode, ReturnAddress, DeliveryAddress, Weight, TotalPostage, DeliveryStatus, SenderName, ReceiverName) values (MailIdSequence.NEXTVAL, 'unregistered', 'H4J 2W6', '50820 Anhalt Court', '24 Everett Plaza', 27, 99, null, 'Ardella Meni', 'Lambert Huggill');


insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (PmIdSequence.NEXTVAL, 'PostMaster', 'Raimund', 'Stegell', '86-(938)743-3259', 'rstegell0@wikimedia.org', 'OFFDUTY', 'S12');			
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (PmIdSequence.NEXTVAL, 'PostMaster', 'Auberon', 'Davidai', '86-(215)159-3756', 'adavidai1@salon.com', 'SICK', 'S13');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Marcus', 'Risman', '86-(184)781-5870', 'mrisman2@tripadvisor.com', 'ONVACATION', 'S1');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Jacquette', 'Provest', '63-(704)823-0421', 'jprovest3@spiegel.de', 'SICK', 'S11');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Nat', 'Lovelady', '86-(707)193-6390', 'nlovelady4@unblog.fr', 'AVAILABLE', 'S5');				
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Amitie', 'O''Flaherty', '7-(515)466-0530', 'aoflaherty5@tiny.cc', 'SICK', 'S12');		
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Pattin', 'Abramovic', '963-(816)508-6897', 'pabramovic6@mit.edu', 'ONDUTY', 'S20');				
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Charo', 'Murty', '86-(258)583-7795', 'cmurty7@weebly.com', 'SICK', 'S8');				
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Gavra', 'Pascho', '385-(475)798-8943', 'gpascho8@scientificamerican.com', 'AVAILABLE', 'S20');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Claiborne', 'Tatterton', '1-(988)856-7976', 'ctatterton9@loc.gov', 'ONDUTY', 'S2');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Sheelah', 'Perotti', '249-(791)753-4945', 'sperottia@biglobe.ne.jp', 'ONVACATION', 'S3');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Ella', 'Mulloch', '380-(742)608-5800', 'emullochb@addthis.com', 'ONVACATION', 'S6');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Dori', 'Creavin', '1-(814)946-4389', 'dcreavinc@eepurl.com', 'SICK', 'S7');	
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Jaimie', 'Blainey', '241-(955)139-7698', 'jblaineyd@yandex.ru', 'AVAILABLE', 'S9');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (ClIdSequence.NEXTVAL, 'Clerk', 'Cordy', 'Huckabe', '86-(443)495-6420', 'chuckabee@washingtonpost.com', 'SICK', 'S15');	
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Rodie', 'Vasilyevski', '86-(970)260-4925', 'rvasilyevskif@desdev.cn', 'SICK', 'S18');		
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Gallard', 'Scotchmer', '86-(677)355-2760', 'gscotchmerg@nyu.edu', 'SICK', 'S8');			
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Sonny', 'Bevans', '49-(179)649-2641', 'sbevansh@shop-pro.jp', 'ONVACATION', 'S2');			
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Brander', 'Sciacovelli', '33-(275)680-7989', 'bsciacovellii@bloomberg.com', 'ONDUTY', 'S3');
insert into Employees (EmployeeId, Role, Firstname, Lastname, Phone, Email, Availability, ScheduleId) values (CaIdSequence.NEXTVAL, 'Carrier', 'Boyd', 'Lineen', '7-(171)990-4715', 'blineenj@facebook.com', 'OFFDUTY', 'S4');




INSERT INTO price (MIN, MAX, country, price) VALUES (0, 30, 'local', 0.85);
INSERT INTO price (MIN, MAX, country, price) VALUES (0, 30, 'us', 1.20);
INSERT INTO price (MIN, MAX, country, price) VALUES (0, 30, 'international', 2.50);
INSERT INTO price (MIN, MAX, country, price) VALUES (31, 50, 'local', 1.20);
INSERT INTO price (MIN, MAX, country, price) VALUES (31, 50, 'us', 1.8);
INSERT INTO price (MIN, MAX, country, price) VALUES (31, 50, 'international', 3.60);
INSERT INTO price (MIN, MAX, country, price) VALUES (51, 100, 'local', 1.80);
INSERT INTO price (MIN, MAX, country, price) VALUES (51, 100, 'us', 2.95);
INSERT INTO price (MIN, MAX, country, price) VALUES (51, 100, 'international', 5.90);
INSERT INTO price (MIN, MAX, country, price) VALUES (101, 200, 'local', 2.95);
INSERT INTO price (MIN, MAX, country, price) VALUES (101, 200, 'us', 5.15);
INSERT INTO price (MIN, MAX, country, price) VALUES (101, 200, 'international', 10.30);
INSERT INTO price (MIN, MAX, country, price) VALUES (201, 500, 'local', 5.05);
INSERT INTO price (MIN, MAX, country, price) VALUES (201, 500, 'us', 10.30);
INSERT INTO price (MIN, MAX, country, price) VALUES (201, 500, 'international', 20.60);
INSERT INTO price (MIN, MAX, country, price) VALUES (501, 1000, 'local', 7.05);
INSERT INTO price (MIN, MAX, country, price) VALUES (501, 1000, 'us', 12.30);
INSERT INTO price (MIN, MAX, country, price) VALUES (501, 1000, 'international', 30.60);

UPDATE SCHEDULE SET SCHEDULEID = 'S1' WHERE SCHEDULEID = 'HOLYSHITTHISWORKS';