CREATE SCHEMA DBproj;
CREATE TABLE DBproj.customer(
  customerId INT(10) NOT NULL,
  fName VARCHAR(10) NULL ,
  lName VARCHAR(10) NULL ,
  phoneNum CHAR(10),
  invoice VARCHAR(35),
  CONSTRAINT customer_PK PRIMARY KEY (customerId));
  
  
CREATE TABLE DBproj.employee (
  employeeId INT(10) NOT NULL,
  deprtCode VARCHAR(5),
  national_Id INT(10) UNIQUE,
  fName VARCHAR(10),
  lName VARCHAR(10),
  employmentDate VARCHAR(20),
  salary DECIMAL(7,2),
  workingHours INT(2),
 CONSTRAINT employee_PK PRIMARY KEY (employeeId));
 
 CREATE TABLE DBproj.department (
  deprtCode VARCHAR(5) NOT NULL,
  deprtName VARCHAR(45),
  email VARCHAR(45),
  fax VARCHAR(45),
  noOfWorkers INT(5),
  street VARCHAR(15),
  city VARCHAR(10),
  state VARCHAR(10),
  zipcode INT(10),
  managerId INT(10),
  CONSTRAINT department_PK PRIMARY KEY (deprtCode),
  CONSTRAINT department_FK FOREIGN KEY (managerId) 
  REFERENCES employee (employeeId)); 
  
  
CREATE TABLE DBproj.reservation (
  reservationId INT(10) NOT NULL,
  customerId INT(10),
  dateIN VARCHAR(35),
  dateOut VARCHAR(35),
  breakfast VARCHAR(20) CHECK (breakfast IN ('continental', 'english', 'american', 'buffet')),
  lunch VARCHAR(20) CHECK (lunch IN ('traditional', 'japanies', 'indian')),
  dinner VARCHAR(20) CHECK (dinner IN ('italian', 'korean', 'traditional')),
  employeeId INT(10),
  CONSTRAINT reservation_PK PRIMARY KEY (reservationId),
  CONSTRAINT reservation_FK1 FOREIGN KEY (customerId)
  REFERENCES customer (customerId),
  CONSTRAINT reservation_FK2 FOREIGN KEY (employeeId)
  REFERENCES employee (employeeId));
  
CREATE TABLE DBproj.room (
  roomNum INT(5) NOT NULL,
  roomView VARCHAR(20) CHECK ( roomView IN ('Abraj AL-bait','Chuk E. Cheese','Salamah Garden','AL-Hejaz mall')),
  roomType VARCHAR(10) CHECK (roomType IN ( 'suite', 'king' , 'double' , 'single')),
  roomFloor INT(2),
  roomPrice DECIMAL(7,2),
  reservationId INT(10),
  deprtCode VARCHAR(5),
  CONSTRAINT room_PK PRIMARY KEY (roomNum),
  CONSTRAINT room_FK FOREIGN KEY (reservationId)
  REFERENCES reservation (reservationId));
  
  
ALTER TABLE DBproj.employee
  ADD ( CONSTRAINT employee_FK FOREIGN KEY (deprtCode)
  REFERENCES department (deprtCode));
  
  
  
CREATE TABLE DBproj.services_preferences (
  roomNum INT(10) NOT NULL,
  houseKeepingTimePref VARCHAR(45) ,
  breakfastTimePref VARCHAR(45) ,
 CONSTRAINT SERVICES_PREFERNCES_PK PRIMARY KEY (roomNum)
 );
  
CREATE TABLE DBproj.serves (
 employeeId INT(10) NOT NULL,
 roomNum INT(10) NOT NULL,
 CONSTRAINT SERVES_PK PRIMARY KEY (employeeId,roomNum),
CONSTRAINT SERVES_FK1 FOREIGN KEY (employeeId) REFERENCES employee (employeeId),
CONSTRAINT SERVES_FK2 FOREIGN KEY (roomNum) REFERENCES room (roomNum)
);

  
CREATE TABLE DBproj.deptPhoneNum (
 deprtCode VARCHAR(5) NOT NULL,
 DphoneNo CHAR(10) NOT NULL,
 CONSTRAINT deptPhoneNum_PK PRIMARY KEY (deprtCode,DphoneNo),
CONSTRAINT deptPhoneNum_FK FOREIGN KEY (deprtCode) REFERENCES department (deprtCode)
);


CREATE TABLE DBproj.room_customer (
  roomNum INT(10) NOT NULL,
  customerId INT(10) NOT NULL,
 CONSTRAINT room_customer_PK PRIMARY KEY (roomNum,customerId),
 CONSTRAINT room_customer_FK1 FOREIGN KEY (customerId) REFERENCES customer (customerId),
 CONSTRAINT room_customer_FK2 FOREIGN KEY (roomNum) REFERENCES services_preferences (roomNum)
 );
 
 
INSERT INTO DBproj.customer
VALUE(7236,'Eman','alhazmi',0548483750,'IV-00040');

INSERT INTO DBproj.customer
VALUE(29004,'Thanaa','alhydary',0548483751,'IV-00041');

INSERT INTO DBproj.customer
VALUE(33851,'Rawan','Sadis',0548483752,'IV-00042');

INSERT INTO DBproj.customer
VALUE(17305,'Sarah','alshehri',0548483753,'IV-00043');

INSERT INTO DBproj.customer
VALUE(3892,'Haneen','Alsherif',0548483754,'IV-00044');



INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (156678,1095678220,'Khaled','Sabbagh','12-05-2017',6800,70);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (167789,1094234555,'Mohammed','Ghawi','09-01-2019',4500,63);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (256679,1095667332,'Jehad','Saadi','30-11-2013',7000,70);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (267780,1089977099,'Rashed','ALHassan','27-6-2016',6500,49);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (356680,1097889001,'Aminah','Qurashi','01-8-2015',4000,35);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (267791,1095882341,'Saleh','Saddeq','07-2-2016',3500,28);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (456681,1086672344,'Abdullah','ALNuqali','23-12-2014',6000,70);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (167792,1096778534,'Omar','Barigi','19-4-2015',5500,70);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (556682,1096669878,'Rami','Srour','27-9-2017',4000,28);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (567793,1096334980,'Shoroug','Hadrami','19-3-2018',2800,21);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (656683,1096657740,'Mahdeyah','Alshehri','01-5-2019',2500,14);

INSERT INTO dbproj.employee(employeeId, national_Id, fName, lName, employmentDate,salary, workingHours)
VALUES (667794,1095498742,'Wesal','Ba Rasheed','26-7-2019',2500,14);



INSERT INTO dbproj.department
VALUES ('DP101','suit rooms Department','Hotel.DPRS101@Gmail.com','101-778-7658',30,'AL-Khalidiyah','Mecca','Mecca',23455,156678);

INSERT INTO dbproj.department
VALUES ('DP202','Rooms And House Keeping Department','Hotel.DPRHK202@Gmail.com','202-778-7658',102,'AL-Khalidiyah','Mecca','Mecca',23455,256679);

INSERT INTO dbproj.department
VALUES ('DP303','Food Production Department','Hotel.DPFP303@Gmail.com','303-781-7662',150,'AL-Nasseem','Mecca','Jeddah',22231,356680);

INSERT INTO dbproj.department
VALUES ('DP404','Security Department','Hotel.DPS404@Gmail.com','404-779-7677',86,'AL-Shawqiyah','Mecca','Mecca',23456,456681);

INSERT INTO dbproj.department
VALUES ('DP505','Front Office Department','Hotel.DPFO505@Gmail.com','505-778-7658',50,'AL-Khalidiyah','Mecca','Mecca',23455,556682);

INSERT INTO dbproj.department
VALUES ('DP606','Information Technology Department','Hotel.DPIT606@Gmail.com','606-778-7658',36,'AL-Nuzha','Mecca','Mecca',23457,656683);


UPDATE dbproj.employee
SET deprtCode ='DP101'
WHERE employeeId= 156678 ;

UPDATE dbproj.employee
SET deprtCode ='DP101'
WHERE employeeId= 167789 ;

UPDATE dbproj.employee
SET deprtCode ='DP202'
WHERE employeeId= 256679 ;

UPDATE dbproj.employee
SET deprtCode ='DP202'
WHERE employeeId= 267780 ;

UPDATE dbproj.employee
SET deprtCode ='DP303'
WHERE employeeId= 356680 ;

UPDATE dbproj.employee
SET deprtCode ='DP202'
WHERE employeeId= 267791 ;

UPDATE dbproj.employee
SET deprtCode ='DP404'
WHERE employeeId= 456681;

UPDATE dbproj.employee
SET deprtCode ='DP101'
WHERE employeeId= 167792 ;

UPDATE dbproj.employee
SET deprtCode ='DP505'
WHERE employeeId= 556682 ;

UPDATE dbproj.employee
SET deprtCode ='DP505'
WHERE employeeId= 567793;

UPDATE dbproj.employee
SET deprtCode ='DP606'
WHERE employeeId= 656683 ;

UPDATE dbproj.employee
SET deprtCode ='DP606'
WHERE employeeId= 667794 ;


INSERT INTO dbproj.reservation
VALUES (12030,33851,'01-10-2022','06-10-2022','buffet','indian','traditional',556682);

INSERT INTO dbproj.reservation
VALUES (12102,29004,'09-11-2022','11-11-2022','american','japanies','korean',567793);

INSERT INTO dbproj.reservation
VALUES (12230,17305,'22-10-2022','30-10-2022','english','traditional','traditional',556682);

INSERT INTO dbproj.reservation
VALUES (12356,7236,'15-10-2022','27-10-2022','continental','traditional','italian',567793);

INSERT INTO dbproj.reservation
VALUES (12441,3892,'29-10-2022','31-10-2022','continental','indian','korean',556682);

INSERT INTO dbproj.reservation
VALUES (12703,29004,'22-9-2022','25-9-2022','english','japanies','italian',567793);




INSERT INTO dbproj.room
VALUES (001,'Abraj AL-bait','suite',0,1400,12703,'DP101');

INSERT INTO dbproj.room
VALUES (030,'Abraj AL-bait','single',0,300,12030,'DP202');

INSERT INTO dbproj.room
VALUES (102,'Chuk E. Cheese','single',1,450,12102,'DP202');

INSERT INTO dbproj.room(roomNum,roomView,roomType,roomFloor,roomPrice,deprtCode)
VALUES (117,'Salamah Garden','single',1,450,'DP202');

INSERT INTO dbproj.room
VALUES (230,'Salamah Garden','double',2,550,12230,'DP202');

INSERT INTO dbproj.room
VALUES (356,'AL-Hejaz mall','suite',3,1400,12356,'DP101');

INSERT INTO dbproj.room(roomNum,roomView,roomType,roomFloor,roomPrice,deprtCode)
VALUES (420,'Chuk E. Cheese','double',4,550,'DP202');

INSERT INTO dbproj.room
VALUES (441,'Chuk E. Cheese','king',4,700,12441,'DP101');



INSERT INTO DBproj.services_preferences
VALUE(102,'2:00PM','8:00AM');

INSERT INTO DBproj.services_preferences
VALUE(1,'11:00PM','6:00AM');

INSERT INTO DBproj.services_preferences
VALUE(356,'10:00PM','6:30AM');

INSERT INTO DBproj.services_preferences
VALUE(441,'11:00PM','8:00AM');

INSERT INTO DBproj.services_preferences
VALUE(230,'1:00PM','7:00AM');




INSERT INTO DBproj.serves
VALUE(256679,30);

INSERT INTO DBproj.serves
VALUE(267780,102);

INSERT INTO DBproj.serves
VALUE(256679,230);

INSERT INTO DBproj.serves
VALUE(267780,356);

INSERT INTO DBproj.serves
VALUE(267791,441);


INSERT INTO DBproj.deptPhoneNum
VALUE('DP101',0128765430);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP101',0128729773);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP202',0128833679);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP303',0128765431);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP303',0128765432);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP404',0128765433);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP505',0128765434);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP606',0128737434);

INSERT INTO DBproj.deptPhoneNum
VALUE('DP606',0128229937);



INSERT INTO DBproj.room_customer
VALUE( 102,29004);

INSERT INTO DBproj.room_customer
VALUE( 1,29004);

INSERT INTO DBproj.room_customer
VALUE( 356,7236);

INSERT INTO DBproj.room_customer
VALUE( 441,3892);

INSERT INTO DBproj.room_customer
VALUE( 230,17305);





UPDATE DBproj.employee
SET workingHours=workingHours*1.1 
WHERE salary > 4000 ; 

UPDATE DBproj.room
SET roomPrice='850' 
WHERE roomType ='king'; 

DELETE FROM DBproj.deptPhoneNum
WHERE DphoneNo = 128765430; 

DELETE FROM DBproj.serves 
WHERE employeeId=256679 AND roomNum=30; 






CREATE VIEW DBproj.catering_rept AS 
SELECT reservationId,breakfast,lunch,dinner 
FROM DBproj.reservation; 

SELECT * 
FROM DBproj.catering_rept; 

SELECT  breakfast, COUNT(reservationId) AS count
FROM DBproj.catering_rept
GROUP BY breakfast
ORDER BY COUNT(reservationId) DESC;

SELECT * 
FROM DBproj.services_preferences
WHERE breakfastTimePref<=(SELECT AVG(breakfastTimePref) 
                          FROM DBproj.services_preferences ); 

SELECT e.deprtCode,deprtName,DphoneNo,employeeId,fName,lName,salary 
FROM DBproj.deptPhoneNum p , DBproj.department d, DBproj.employee e
WHERE p.deprtCode=d.deprtCode AND e.deprtCode=d.deprtCode 
ORDER BY d.deprtCode DESC; 

SELECT roomNum,roomPrice,roomType
FROM DBproj.room
WHERE roomType= 'King' OR roomType= 'single';

SELECT customerId,lName,invoice
FROM DBproj.customer 
ORDER BY customerId DESC; 

SELECT houseKeepingTimePref, COUNT(r.roomNum)
FROM DBproj.services_preferences p , DBproj.room r
WHERE r.roomNum = p.roomNum
GROUP BY houseKeepingTimePref ;

SELECT roomNum ,roomView,roomType,roomFloor 
FROM DBproj.room
WHERE roomView='Chuk E. Cheese';

CREATE VIEW DBproj.reservedRooms AS
SELECT * 
FROM DBproj.room 
WHERE reservationId IS NOT NULL;

SELECT roomFloor, COUNT(roomNum) AS count
FROM DBproj.reservedRooms
GROUP BY roomFloor;

SELECT deprtName, fName, lName
FROM DBproj.employee e , DBproj.department d
WHERE d.managerId = e.employeeId;

SELECT employeeId,salary,workingHours
FROM DBproj.employee
WHERE salary <= 4000 AND workingHours > 25
