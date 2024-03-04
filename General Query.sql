USE myseond;
CREATE TABLE Student
(
 Roll CHAR(4) Primary Key,
 Name VARCHAR(50) NOT NULL,
 Email VARCHAR(60) UNIQUE,
 Address VARCHAR(255),
 Age INT CHECK (Age>19)
 );
 
INSERT INTO Student(Roll,Name,Email,Address,Age) VALUES ('001','Meem','mmeem134','gazipur',21);
INSERT INTO Student(Roll,Name,Email,Address,Age) VALUES ('002','Meem','mmeem184','gazipur',21);
INSERT INTO Student(Roll,Name,Email,Age) VALUES ('004','Khushnor','m84',24);
INSERT INTO Student(Roll,Name,Email,Address,Age) VALUES ('006','Wakil','wko89','Dhaka',25);
INSERT INTO Student(Roll,Name,Email,Address,Age) VALUES ('007','MD Wakil Ahmed','wk999','Sadhupara',28);
#alternative
CREATE TABLE Student
(
 Roll CHAR(4),
 Name VARCHAR(50) NOT NULL,
 Email VARCHAR(60) UNIQUE,
 Address VARCHAR(255),
 Age INT, 
 Primary Key(Roll),
 #not null is not allowed writing here
 UNIQUE(Email),
 CHECK (Age>19)
 );
 
 #alternative
CREATE TABLE Student
(
 Roll CHAR(4),
 Name VARCHAR(50) NOT NULL,
 Email VARCHAR(60) UNIQUE,
 Address VARCHAR(255),
 Age INT, 
 constraint pk_rule Primary Key(Roll),
 #not null is not allowed writing here
 constraint un_rule UNIQUE(Email),
 constraint check_cnd CHECK (Age>19)
 );
 
 CREATE TABLE Library
 (
 Book_name VARCHAR(100) primary key,
 Hired_roll CHAR(4),
 FOREIGN KEY (Hired_roll) references Student(Roll)
 );
 
 #composite primary key
 CREATE TABLE Course
 (
 course_name VARCHAR(70),
 credit INT,
 uni_name VARCHAR(100),
 PRIMARY KEY(course_name,uni_name)  #composite primary key
 );
#show all data
#way 1 
 SELECT Roll,Name,Email,Address,Age
 FROM Student;
 #way 2
 SELECT *
 FROM Student;
 
 #show selected fields
 
 SELECT Roll
 FROM Student;
 
 SELECT Age
 FROM Student
 WHERE Name='khushnor';
 
 #all the arithmatic operations will be done in SELECT
 SELECT Age+Roll
 From student
 where Name='Meem';
 
 SELECT *
 From student
 where Age<>24; #not equals
 
 SELECT *
 From Student
 where Age>=21 and Address='gazipur';
 
 SELECT distinct Age
 FROM Student;
 
 SELECT name
FROM Student
Order by Age asc; # dsc means descending

SELECT *
From Student
limit 3 #first 1ta baad diye porer 3ta dekhabe
offset 1; #limit(1,3)

SELECT Name
FROM Student
where Age not in (21,24);

SELECT Email
FROM student
WHERE name like '%Wakil%';

SELECT Address as location
FROM student;

CREATE TABLE Employee
(
id CHAR(4) primary key,
name varchar(15),
salary INT,
join_date datetime
);

INSERT INTO Employee(id,name,salary,join_date) VALUES('1001','Rahim',16000, '2008-11-11 13:23:44'  );
INSERT INTO Employee(id,name,salary,join_date) VALUES('1002','Fahim',18000, '2008-10-29 14:56:59');

SET SQL_SAFE_UPDATES=0;
DELETE FROM employee WHERE name='Rahim';

ALTER TABLE Employee
ADD Birth_year INT CHECK (Birth_year>2000),
ADD Designation VARCHAR(10) UNIQUE;


CREATE TABLE Student
(
Id CHAR (4) primary key,
Name VARCHAR(30) NOT NULL,
Department VARCHAR(5),
Email CHAR(20) UNIQUE,
Age INT CHECK (Age>17)
);

CREATE TABLE Library
(
BookId CHAR(6) primary Key ,
Book_Name VARCHAR(20) NOT NULL,
Regi_fees INT DEFAULT 100,
Return_date Datetime UNIQUE,
Hired_Id CHAR(4),
foreign key (hired_Id) references Student(Id)
);

CREATE TABLE Fees
(
Trans_ID CHAR(12) UNIQUE,
amount INT DEFAULT 50000,
due DOUBLE,
fees_for VARCHAR(15) NOT NULL,
Primary key (Trans_ID, fees_for)
);

CREATE TABLE Employee
(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(10),
LastName VARCHAR(10),
Age INT,
Department VARCHAR(10)
);

INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (1,'John','Doe',28,'Sales');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (2,'Jane','Smith',32,'Marketing');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (3,'Michael','Johnson',35,'Finance');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (4,'Sarah','Brown',30,'HR');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (5,'William','Davis',25,'Eng');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (6,'Emily','Wilson',28,'Sales');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (7,'Robert','Lee',33,'Marketing');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (8,'Laura','Hall',29,'Finance');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (9,'Thomas','White',31,'HR');
INSERT INTO Employee (EmployeeID,FirstName,LastName,Age,Department) VALUES (10,'Olivia','Clark',27,'Eng');

SELECT DISTINCT Department
FROM Employee;

SELECT LastName
FROM Employee
order by Age desc;

SELECT LastName
FROM Employee
WHERE Age>30 AND Department='Marketing';

SELECT *
FROM Employee;

SELECT *
FROM Employee
WHERE FirstName like '%son%' or LastName like '%son%';

SELECT *
FROM Employee
WHERE Department ='Eng';