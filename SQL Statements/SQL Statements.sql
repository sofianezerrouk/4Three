// 4THREE – Database Queries // DDL - Create Table Statements : 

CREATE TABLE Administrator (
  ADMINISTRATOR_ID int(10) NOT NULL AUTO_INCREMENT, 
  FName varchar(64) NOT NULL, 
  LName varchar(64) NOT NULL, 
  Email varchar(255) NOT NULL, 
  PhoneNo int(32) NOT NULL, 
  GENERAL_STOCK_ID int(10) NOT NULL, 
  PRIMARY KEY (ADMINISTRATOR_ID)
);
CREATE TABLE Blank (
  BLANK_ID int(10) NOT NULL AUTO_INCREMENT, 
  Type int(10) NOT NULL, 
  IsSold varchar(4) NOT NULL, 
  FLIGHT_COUPON_ID int(11) NOT NULL, 
  PRIMARY KEY (BLANK_ID)
);
CREATE TABLE Card (
  Name varchar(255) NOT NULL, 
  Last4Digits int(10) NOT NULL, 
  PAYMENT_ID int(10) NOT NULL
);
CREATE TABLE Commission (
  COMMISSION_ID int(10) NOT NULL AUTO_INCREMENT, 
  `Date` int(6) NOT NULL, 
  Percentage int(3) NOT NULL, 
  SALE_ID int(10) NOT NULL, 
  PRIMARY KEY (COMMISSION_ID)
);
CREATE TABLE CustomerAccount (
  CUSTOMER_ID int(10) NOT NULL AUTO_INCREMENT, 
  FName varchar(64) NOT NULL, 
  LName varchar(64) NOT NULL, 
  Email varchar(255), 
  PhoneNo int(32), 
  Address varchar(255), 
  DiscountType varchar(255) NOT NULL, 
  PRIMARY KEY (CUSTOMER_ID)
);
CREATE TABLE FlightCoupon (
  FLIGHT_COUPON_ID int(11) NOT NULL AUTO_INCREMENT, 
  DepartureDestination varchar(255) NOT NULL, 
  ArrivalDestination varchar(255) NOT NULL, 
  Duration int(6) NOT NULL, 
  FlightNo varchar(10) NOT NULL, 
  SeatNo varchar(4) NOT NULL, 
  IsAuditorCoupon varchar(4) NOT NULL, 
  Price int(10) NOT NULL, 
  InvoiceNo int(10) NOT NULL, 
  SALE_ID int(10) NOT NULL, 
  PRIMARY KEY (FLIGHT_COUPON_ID)
);
CREATE TABLE GeneralStock (
  GENERAL_STOCK_ID int(10) NOT NULL AUTO_INCREMENT, 
  BlanksAvailable int(10) NOT NULL, 
  BlanksNeeded int(10), 
  TypeOfBlanksAdded varchar(255) NOT NULL, 
  OFFICE_MANAGER_ID int(11) NOT NULL, 
  PRIMARY KEY (GENERAL_STOCK_ID)
);
CREATE TABLE OfficeManager (
  OFFICE_MANAGER_ID int(10) NOT NULL AUTO_INCREMENT, 
  FName varchar(64) NOT NULL, 
  LName varchar(64) NOT NULL, 
  Email varchar(255) NOT NULL, 
  PhoneNo int(32) NOT NULL, 
  PRIMARY KEY (OFFICE_MANAGER_ID)
);
CREATE TABLE PaymentType (
  PAYMENT_ID int(10) NOT NULL AUTO_INCREMENT, 
  Card varchar(255) NOT NULL, 
  Cash int(10) NOT NULL, 
  SALE_ID int(10) NOT NULL, 
  PRIMARY KEY (PAYMENT_ID)
);
CREATE TABLE Refund (
  Amount float NOT NULL, 
  Type varchar(255) NOT NULL, 
  SALE_ID int(10) NOT NULL
);
CREATE TABLE Report (
  REPORT_ID int(10) NOT NULL AUTO_INCREMENT, 
  CommissionRecord int(10) NOT NULL, 
  SaleTurnover int(10) NOT NULL, 
  Type varchar(255) NOT NULL, 
  ReportCreatedDateTime int(6) NOT NULL, 
  OFFICE_MANAGER_ID int(10) NOT NULL, 
  PRIMARY KEY (REPORT_ID)
);
CREATE TABLE Sale (
  SALE_ID int(10) NOT NULL AUTO_INCREMENT, 
  PaymentType varchar(255) NOT NULL, 
  PaymentCurrency varchar(255) NOT NULL, 
  CurrencyExchangeRate float NOT NULL, 
  PaymentAmount float NOT NULL, 
  SaleDate int(6) NOT NULL, 
  DiscountApplied varchar(255) NOT NULL, 
  Commission varchar(255) NOT NULL, 
  CUSTOMER_ID int(10) NOT NULL, 
  ADVISOR_ID int(10) NOT NULL, 
  PRIMARY KEY (SALE_ID)
);
CREATE TABLE Stocks (
  STOCKS_ID int(10) NOT NULL AUTO_INCREMENT, 
  TotalBlanks int(10) NOT NULL, 
  BlanksSold int(10) NOT NULL, 
  ADVISOR_ID int(10) NOT NULL, 
  GENERAL_STOCK_ID int(10) NOT NULL, 
  PRIMARY KEY (STOCKS_ID)
);
CREATE TABLE TravelAdvisor (
  ADVISOR_ID int(10) NOT NULL AUTO_INCREMENT, 
  FName varchar(64) NOT NULL, 
  LName varchar(64) NOT NULL, 
  Email varchar(255) NOT NULL, 
  PhoneNo int(32) NOT NULL, 
  Address varchar(255) NOT NULL, 
  PRIMARY KEY (ADVISOR_ID)
);
ALTER TABLE 
  FlightCoupon 
ADD CONSTRAINT FKFlightCoup719960 FOREIGN KEY (SALE_ID) REFERENCES Sale (SALE_ID);
ALTER TABLE 
  Card 
ADD CONSTRAINT FKCard643638 FOREIGN KEY (PAYMENT_ID) REFERENCES PaymentType (PAYMENT_ID);
ALTER TABLE 
  Sale 
ADD CONSTRAINT FKSale842987 FOREIGN KEY (CUSTOMER_ID) REFERENCES CustomerAccount (CUSTOMER_ID);
ALTER TABLE 
  Sale 
ADD CONSTRAINT FKSale703296 FOREIGN KEY (ADVISOR_ID) REFERENCES TravelAdvisor (ADVISOR_ID);
ALTER TABLE 
  Blank 
ADD CONSTRAINT FKBlank931710 FOREIGN KEY (FLIGHT_COUPON_ID) REFERENCES FlightCoupon (FLIGHT_COUPON_ID);
ALTER TABLE 
  Stocks 
ADD CONSTRAINT FKStocks81788 FOREIGN KEY (ADVISOR_ID) REFERENCES TravelAdvisor (ADVISOR_ID);
ALTER TABLE 
  Stocks 
ADD CONSTRAINT FKStocks78215 FOREIGN KEY (GENERAL_STOCK_ID) REFERENCES GeneralStock (GENERAL_STOCK_ID);
ALTER TABLE 
  Administrator 
ADD CONSTRAINT FKAdministra130612 FOREIGN KEY (GENERAL_STOCK_ID) REFERENCES GeneralStock (GENERAL_STOCK_ID);
ALTER TABLE 
  GeneralStock 
ADD CONSTRAINT FKGeneralSto301240 FOREIGN KEY (OFFICE_MANAGER_ID) REFERENCES OfficeManager (OFFICE_MANAGER_ID);
ALTER TABLE 
  Report 
ADD CONSTRAINT FKReport470722 FOREIGN KEY (OFFICE_MANAGER_ID) REFERENCES OfficeManager (OFFICE_MANAGER_ID);
ALTER TABLE 
  PaymentType 
ADD CONSTRAINT FKPaymentTyp283955 FOREIGN KEY (SALE_ID) REFERENCES Sale (SALE_ID);
ALTER TABLE 
  Refund 
ADD CONSTRAINT FKRefund159407 FOREIGN KEY (SALE_ID) REFERENCES Sale (SALE_ID);
ALTER TABLE 
  Commission 
ADD CONSTRAINT FKCommission449796 FOREIGN KEY (SALE_ID) REFERENCES Sale (SALE_ID);
// DML – 2 Select, Insert, Update and Delete Statements 

  

//2 Select Statements: 

SELECT FLIGHT_COUPON_ID, DepartureDestination, ArrivalDestination, Duration, FlightNo, SeatNo, IsAuditorCoupon, Price, InvoiceNo, SALE_ID FROM FlightCoupon; 

  

SELECT SALE_ID, PaymentType, PaymentCurrency, CurrencyExchangeRate, PaymentAmount, SaleDate, DiscountApplied, Commission, CUSTOMER_ID, ADVISOR_ID FROM Sale; 

  

//2 Insert Statements: 

INSERT INTO Administrator(ADMINISTRATOR_ID, FName, LName, Email, PhoneNo, GENERAL_STOCK_ID) VALUES (0001, Bob, Hew, bob.hew@gmail.com, 07517939990, 1); 

  

INSERT INTO Report(REPORT_ID, CommissionRecord, SaleTurnover, Type, ReportCreatedDateTime, OFFICE_MANAGER_ID) VALUES (1 , 01, 0003, ‘gold’, 120523, 0034); 

  

//2 Update Statements: 

UPDATE Administrator SET FName = Denzel, LName = Washington, WHERE ADMINISTRATOR_ID = 0001; 

  

UPDATE Report SET SaleTurnover = 0004, CommissionRecord = 02 WHERE REPORT_ID = 1; 

  

//2 Delete Statements: 

DELETE FROM Administrator WHERE ADMINISTRATOR_ID = 0001; 

  

DELETE FROM Report WHERE REPORT_ID = 1; 
