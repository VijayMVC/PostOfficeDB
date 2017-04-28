-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-24 20:50:58.797

-- tables
-- Table: Building
CREATE TABLE Building (
    BuildingId varchar2(64)  NOT NULL,
    EmployeeId varchar2(64)  NOT NULL,
    Phone varchar2(64)  NOT NULL,
    CONSTRAINT Building_pk PRIMARY KEY (BuildingId)
) ;

CREATE INDEX BuildingId_index 
on Building 
(BuildingId ASC)
;

-- Table: Carrier
CREATE TABLE Carrier (
    EmployeeId varchar2(64)  NOT NULL,
    ScheduleId varchar2(64)  NOT NULL,
    RouteId varchar2(64)  NOT NULL,
    VehicleId varchar2(64)  NOT NULL,
    BuildingId varchar2(64)  NOT NULL,
    CONSTRAINT Carrier_pk PRIMARY KEY (EmployeeId)
) ;

CREATE INDEX CarrierId_index 
on Carrier 
(EmployeeId ASC)
;

-- Table: Clerk
CREATE TABLE Clerk (
    EmployeeId varchar2(64)  NOT NULL,
    ScheduleId varchar2(64)  NOT NULL,
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
) ;

-- Table: Employees
CREATE TABLE Employees (
    EmployeeId varchar2(64)  NOT NULL,
    Role varchar2(64)  NOT NULL,
    Firstname varchar2(64)  NULL,
    Lastname varchar2(64)  NULL,
    Phone varchar2(64)  NULL,
    Email varchar2(64)  NULL,
    Availability varchar2(64)  NOT NULL CHECK (Availability = 'available' or Availability = 'unavailable' or Availability = 'sick' or Availability='onduty'),
    CONSTRAINT Employees_EmployeesId_pk PRIMARY KEY (EmployeeId)
) ;

CREATE INDEX EmployeesId_index 
on Employees 
(EmployeeId ASC)
;

CREATE INDEX Lastname_index 
on Employees 
(Lastname ASC)
;

-- Table: Mail
CREATE TABLE Mail (
    MailID varchar2(64)  NOT NULL,
    RouteId varchar2(64)  NOT NULL,
    Registration varchar2(64)  NOT NULL CHECK (Registration='registered' or Registration='unregistered'),
    PostalCode varchar2(64)  NOT NULL,
    ReturnAddress varchar2(64)  NOT NULL,
    Weight number(5,3)  NOT NULL,
    TotalPostage number(2,0)  NOT NULL,
    DeliveryStatus varchar2(64)  NOT NULL,
    SenderName varchar2(64)  NOT NULL,
    ReceiverName varchar2(64)  NOT NULL,
    CONSTRAINT Mail_MailId_PK PRIMARY KEY (MailID)
) ;

COMMENT ON TABLE Mail IS 'Registration is an enum 
address is delivery or return';

CREATE INDEX Registration 
on Mail 
(Registration ASC)
;

CREATE INDEX RouteId 
on Mail 
(RouteId ASC)
;

-- Table: PostMasters
CREATE TABLE PostMasters (
    EmployeeId varchar2(64)  NOT NULL,
    ExtensionNo varchar2(64)  NOT NULL,
    OfficeNo varchar2(64)  NOT NULL,
    CONSTRAINT PostMasters_pk PRIMARY KEY (EmployeeId)
) ;

CREATE INDEX PostMastersId_index 
on PostMasters 
(EmployeeId ASC)
;

-- Table: Postalcode
CREATE TABLE Postalcode (
    PostalCode varchar2(64)  NOT NULL,
    DeliveryAddress varchar2(64)  NOT NULL,
    CONSTRAINT Postalcode_pk PRIMARY KEY (PostalCode)
) ;

CREATE INDEX PostalCode 
on Postalcode 
(PostalCode ASC)
;

-- Table: Routes
CREATE TABLE Routes (
    RouteId varchar2(64)  NOT NULL,
    RouteName varchar2(64)  NOT NULL,
    LastDelivered date  NOT NULL,
    ShipCountry varchar2(64)  NOT NULL,
    ShipmentQuantity number(4)  NULL,
    RouteStatus varchar2(64)  NOT NULL CHECK (status = 'started' OR status = 'completed' OR status = 'incomplete'),
    CONSTRAINT MailRoutes_MailRoute_pk PRIMARY KEY (RouteId)
) ;

COMMENT ON TABLE Routes IS 'location is part of its id';

CREATE INDEX RouteId_index 
on Routes 
(RouteId ASC)
;

CREATE INDEX Routes_LastDelivered_index 
on Routes 
(LastDelivered ASC)
;

-- Table: Schedule
CREATE TABLE Schedule (
    ScheduleId varchar2(64)  NOT NULL,
    EmployeeId varchar2(64)  NOT NULL,
    StartTime date  NOT NULL,
    EndTime date  NOT NULL,
    BuildingId varchar2(64),
    CONSTRAINT Schedule_pk PRIMARY KEY (ScheduleId)
) ;

COMMENT ON TABLE Schedule IS 'might need bridging table between schedule and carriers';

-- Table: Vechicles
CREATE TABLE Vechicles (
    VehicleId varchar2(64)  NOT NULL,
    ScheduleId varchar2(64)  NOT NULL,
    PlateNo varchar2(64)  NOT NULL,
    VehicleStatusId varchar2(64)  NOT NULL,
    CONSTRAINT Vechicles_pk PRIMARY KEY (VehicleId)
) ;

CREATE INDEX VehicleId_index 
on Vechicles 
(VehicleId ASC)
;

CREATE INDEX VehicleStatus_index 
on Vechicles 
(VehicleStatusId ASC)
;

-- Table: VehicleStatus
CREATE TABLE VehicleStatus (
    VechicleStatusId varchar2(64)  NOT NULL,
    Name varchar2(64)  NOT NULL,
    CONSTRAINT VehicleStatusId PRIMARY KEY (VechicleStatusId)
) ;

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

-- Reference: Carrier_Schedule (table: Carrier)
ALTER TABLE Carrier ADD CONSTRAINT Carrier_Schedule
    FOREIGN KEY (ScheduleId)
    REFERENCES Schedule (ScheduleId);

-- Reference: Carrier_Vechicles (table: Carrier)
ALTER TABLE Carrier ADD CONSTRAINT Carrier_Vechicles
    FOREIGN KEY (VehicleId)
    REFERENCES Vechicles (VehicleId);

-- Reference: Clerk_Building (table: Clerk)
ALTER TABLE Clerk ADD CONSTRAINT Clerk_Building
    FOREIGN KEY (BuildingId)
    REFERENCES Building (BuildingId);

-- Reference: Clerk_Employees (table: Clerk)
ALTER TABLE Clerk ADD CONSTRAINT Clerk_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);

-- Reference: Clerk_Schedule (table: Clerk)
ALTER TABLE Clerk ADD CONSTRAINT Clerk_Schedule
    FOREIGN KEY (ScheduleId)
    REFERENCES Schedule (ScheduleId);

-- Reference: Credentials_Employees (table: Credentials)
ALTER TABLE Credentials ADD CONSTRAINT Credentials_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);

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

-- Reference: Schedule_Employees (table: Schedule)
ALTER TABLE Schedule ADD CONSTRAINT Schedule_Employees
    FOREIGN KEY (EmployeeId)
    REFERENCES Employees (EmployeeId);

ALTER TABLE Schedule ADD CONSTRAINT Schedule_Building
    FOREIGN KEY (BuildingId)
    REFERENCES Building (BuildingId);

-- Reference: Vechicles_Schedule (table: Vechicles)
ALTER TABLE Vechicles ADD CONSTRAINT Vechicles_Schedule
    FOREIGN KEY (ScheduleId)
    REFERENCES Schedule (ScheduleId);

-- Reference: Vechicles_VehicleStatus (table: Vechicles)
ALTER TABLE Vechicles ADD CONSTRAINT Vechicles_VehicleStatus
    FOREIGN KEY (VehicleStatusId)
    REFERENCES VehicleStatus (VechicleStatusId);

-- End of file.

