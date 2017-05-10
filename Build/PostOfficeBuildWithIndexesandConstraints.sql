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
*/

-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-24 20:50:58.797

-- tables
-- Table: Building
CREATE TABLE Building (
    BuildingId varchar2(64)  NOT NULL,
    EmployeeId varchar2(64)  NOT NULL,
    Phone varchar2(64)  NOT NULL,
    CONSTRAINT Building_pk PRIMARY KEY (BuildingId)
);

-- Table: Carrier
CREATE TABLE Carrier (
    EmployeeId varchar2(64)  NOT NULL,
    RouteId varchar2(64)  NOT NULL,
    VehicleId varchar2(64)  NOT NULL,
    BuildingId varchar2(64)  NOT NULL,
    CONSTRAINT Carrier_pk PRIMARY KEY (EmployeeId)
) ;

-- Table: Clerk
CREATE TABLE Clerk (
    EmployeeId varchar2(64)  NOT NULL,
    OfficeNo number(5,0)  NOT NULL,
    ExtensionNo number(5,0)  NOT NULL,
    BuildingId varchar2(64)  NOT NULL,
    CONSTRAINT Clerk_pk PRIMARY KEY (EmployeeId)
) ;

-- Table: Credentials
CREATE TABLE Credentials (
    EmployeeId varchar2(64)  NOT NULL,
    Hash raw(64)  NOT NULL,
    Salt varchar2(64)  NOT NULL,
    CONSTRAINT Credentials_pk PRIMARY KEY (EmployeeId)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeId varchar2(64)  NOT NULL,
    Role varchar2(64)  NOT NULL,
    Firstname varchar2(64)  NULL,
    Lastname varchar2(64)  NULL,
    Phone varchar2(64)  NULL,
    Email varchar2(64)  NULL,
    ScheduleId varchar2(64) NOT NULL,
    Availability varchar2(64)  NOT NULL CHECK (Availability = 'AVAILABLE' or Availability = 'UNAVAILABLE' or Availability = 'SICK' 
    or Availability='OFFDUTY' or Availability='ONVACATION' or Availability='ONDUTY'),
    CONSTRAINT Employees_EmployeesId_pk PRIMARY KEY (EmployeeId)
);
DROP TABLE MAIL CASCADE CONSTRAINTS;

-- Table: Mail
CREATE TABLE Mail (
    MailID varchar2(64)  NOT NULL,
    Registration varchar2(64)  NOT NULL CHECK (Registration='registered' or Registration='unregistered'),
    PostalCode varchar2(64)  NOT NULL,
    ReturnAddress varchar2(64),
    DeliveryAddress varchar2(64)  NOT NULL,
    Weight number(38)  NOT NULL,
    TotalPostage number(38)  NOT NULL,
    DeliveryStatus varchar2(64)  NOT NULL,
    SenderName varchar2(64)  NOT NULL,
    ReceiverName varchar2(64)  NOT NULL,
    CONSTRAINT Mail_MailId_PK PRIMARY KEY (MailID)
) ;

-- Table: PostMasters
CREATE TABLE PostMasters (
    EmployeeId varchar2(64)  NOT NULL,
    ExtensionNo varchar2(64)  NOT NULL,
    OfficeNo varchar2(64)  NOT NULL,
    CONSTRAINT PostMasters_pk PRIMARY KEY (EmployeeId)
) ;

-- Table: Postalcode
CREATE TABLE Postalcode (
    PostalCode varchar2(64)  NOT NULL,
    RouteId varchar2(64),
    CONSTRAINT Postalcode_pk PRIMARY KEY (PostalCode)
) ;

-- Table: Routes
CREATE TABLE Routes (
    RouteId varchar2(64)  NOT NULL,
    RouteName varchar2(64)  NOT NULL,
    LastDelivered date  NOT NULL,
    RouteStatus varchar2(64)  NOT NULL CHECK (RouteStatus = 'Started' OR RouteStatus = 'Completed' OR RouteStatus = 'Incomplete'),
    CONSTRAINT Routes_Route_pk PRIMARY KEY (RouteId)
) ;

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleId varchar2(64)  NOT NULL,
    StartTime varchar2(64)  NOT NULL,
    EndTime varchar2(64)  NOT NULL,
    CONSTRAINT Schedule_pk PRIMARY KEY (ScheduleId)
);

-- Table: Vechicles
CREATE TABLE Vehicles (
    VehicleId varchar2(64)  NOT NULL,
    PlateNo varchar2(64)  NOT NULL,
    VehicleStatusId varchar2(64)  NOT NULL,
    CONSTRAINT Vechicles_pk PRIMARY KEY (VehicleId)
) ;

-- Table: VehicleStatus
CREATE TABLE VehicleStatus (
    VehicleStatusId varchar2(64)  NOT NULL CHECK (VehicleStatusId = 'AVAIL' OR VehicleStatusId = 'INUSE' OR VehicleStatusId = 'DECOM'),
    Name varchar2(64)  NOT NULL,
    CONSTRAINT VehicleStatusId PRIMARY KEY (VehicleStatusId)
) ;

/*
DROP INDEX BuildingId_index;
DROP INDEX CarrierId_index;
DROP INDEX EmployeesId_index;
DROP INDEX Lastname_index;
DROP INDEX Registration;
DROP INDEX RouteId;
DROP INDEX PostMastersId_index;
DROP INDEX RouteId_index;
DROP INDEX PostalCode;
DROP INDEX Registration;
DROP INDEX Routes_LastDelivered_index;
DROP INDEX VehicleId_index;
DROP INDEX VehicleStatus_index;
DROP INDEX VehicleStatusId_index;
*/

CREATE INDEX BuildingId_index 
on Building 
(BuildingId ASC)
;

CREATE INDEX CarrierId_index 
on Carrier 
(EmployeeId ASC);

CREATE INDEX EmployeesId_index 
on Employees 
(EmployeeId ASC)
;

CREATE INDEX Lastname_index 
on Employees 
(Lastname ASC)
;

CREATE INDEX Registration 
on Mail 
(Registration ASC)
;

CREATE INDEX RouteId 
on Mail 
(RouteId ASC)
;

CREATE INDEX PostMastersId_index 
on PostMasters 
(EmployeeId ASC)
;

CREATE INDEX PostalCode 
on Postalcode 
(PostalCode ASC)
;


CREATE INDEX Routes_LastDelivered_index 
on Routes 
(LastDelivered ASC)
;

CREATE INDEX VehicleId_index 
on Vehicles 
(VehicleId ASC)
;

CREATE INDEX VehicleStatus_index 
on Vehicles 
(VehicleStatusId ASC)
;

CREATE INDEX VehicleStatusId_index 
on VehicleStatus 
(VechicleStatusId ASC)
;

-- foreign keys
-- Reference: Building_Employees (table: Building)
ALTER TABLE Building ADD CONSTRAINT Building_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);

-- Reference: Carrier_Building (table: Carrier)
ALTER TABLE Carrier ADD CONSTRAINT Carrier_Building
    FOREIGN KEY (BuildingId)
    REFERENCES Building (BuildingId);

-- Reference: Carrier_Employees (table: Carrier)
ALTER TABLE Carrier ADD CONSTRAINT Carrier_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);

-- Reference: Carrier_Routes (table: Carrier)
ALTER TABLE Carrier ADD CONSTRAINT Carrier_Routes
    FOREIGN KEY (RouteId)
    REFERENCES Routes (RouteId);


-- Reference: Carrier_Vechicles (table: Carrier)
ALTER TABLE Carrier ADD CONSTRAINT Carrier_Vehicles
    FOREIGN KEY (VehicleId)
    REFERENCES Vehicles (VehicleId);

-- Reference: Clerk_Building (table: Clerk)
ALTER TABLE Clerk ADD CONSTRAINT Clerk_Building
    FOREIGN KEY (BuildingId)
    REFERENCES Building (BuildingId);

-- Reference: Clerk_Employees (table: Clerk)
ALTER TABLE Clerk ADD CONSTRAINT Clerk_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);


-- Reference: Credentials_Employees (table: Credentials)
ALTER TABLE Credentials ADD CONSTRAINT Credentials_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);

-- Reference: Schedule_Employees (table: Schedule)
ALTER TABLE Employees ADD CONSTRAINT Employees_Schedule
    FOREIGN KEY (ScheduleId)
    REFERENCES Schedule (ScheduleId);
    
-- Reference: MailId_Postalcode (table: Mail)
ALTER TABLE Mail ADD CONSTRAINT MailId_Postalcode
    FOREIGN KEY (PostalCode)
    REFERENCES Postalcode (PostalCode);

-- Reference: Mail_MailId_PK_MailRoutes (table: Mail)
ALTER TABLE Mail ADD CONSTRAINT Mail_MailId_PK_MailRoutes
    FOREIGN KEY (RouteId)
    REFERENCES Routes (RouteId);

-- Reference: PostMasters_Employees (table: PostMasters)
ALTER TABLE PostMasters ADD CONSTRAINT PostMasters_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);
    
-- Reference: PostMasters_Employees (table: PostMasters)
ALTER TABLE PostalCode ADD CONSTRAINT PostalCode_Routes
    FOREIGN KEY (RouteId)
    REFERENCES Routes (RouteId);

-- Reference: Vehicles_VehicleStatus (table: Vehicles)
ALTER TABLE Vehicles ADD CONSTRAINT Vehicles_VehicleStatus
    FOREIGN KEY (VehicleStatusId)
    REFERENCES VehicleStatus (VehicleStatusId);