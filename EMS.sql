CREATE TABLE Department (ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) not null,
    Location NVARCHAR(100) not null)
CREATE TABLE Employee (ID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) not null,
    LastName NVARCHAR(100) not null,
    SSN CHAR(11) not null,
    Dept_ID int Not null,
    FOREIGN KEY (Dept_ID) REFERENCES Department(ID))
CREATE TABLE EmpDetails (ID INT PRIMARY KEY IDENTITY(1,1),
    Employee_ID int not null,
    Salary DECIMAL not null,
    Address_1 NVARCHAR(100) not null,
    Address_2 NVARCHAR(100) not null,
    city NVARCHAR(100) not null,
    State NVARCHAR(2) not null,
    Country NVARCHAR(20) not null,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(ID))
INSERT INTO Department(Name,Location) VALUES('Marking','Denver');
INSERT INTO Department(Name,Location) VALUES('IT','Denver');
INSERT INTO Department(Name,Location) VALUES('MAIL','Denver');
INSERT INTO Employee(FirstName,LastName,SSN,Dept_ID) VALUES('Tina','Smith','11111111111',1);
INSERT INTO Employee(FirstName,LastName,SSN,Dept_ID) VALUES('Bob','Boy',   '22222222222',2);
INSERT INTO Employee(FirstName,LastName,SSN,Dept_ID) VALUES('Wolf','New',  '33333333333',3);
INSERT INTO EmpDetails(Employee_ID,Salary,Address_1,Address_2,city,state,Country) VALUES(1,80000.00,'1 street','apt 1','Aurora','CO','US');
INSERT INTO EmpDetails(Employee_ID,Salary,Address_1,Address_2,city,state,Country) VALUES(2,50000.00,'2 place','apt 34','Denver','CO','US');
INSERT INTO EmpDetails(Employee_ID,Salary,Address_1,Address_2,city,state,Country) VALUES(3,40000.00,'3 way', 'apt 67','Aurora','CO','US');

SELECT [FirstName.Employee] [Name.Department] from Employee
Join Department ON Department.ID=Employee.Dept_ID
where [Name.Department]='Marking';

SELECT sum(Salary) from EmpDetails
join Employee on Department.ID=Employee.Dept_ID
join Employee on Employee.ID=EmpDetails.Employee_ID
WHERE Department='Marking';

UPDATE EmpDetails
set EmpDetail.salary = 90000.00
from employee EmpDetails
join Employee on Employee.ID=EmpDetails.Employee_ID


drop TABLE EmpDetails
drop TABLE Employee
DROP TABLE Department