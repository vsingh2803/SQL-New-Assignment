use VS_xLearning

create table EmployeeTable
(
Employee_id int Primary Key,
First_name varchar(20),
Last_Name varchar(20),
Salary int,
Joining_date datetime,
Department varchar(20)
)

--drop table EmployeeTable

insert into EmployeeTable values (2,'Veena', 'Verma',80000,'2011-06-15 09:00:00','Admin')
insert into EmployeeTable values (3,'Vishal', 'Singhal',300000,'2020-02-16 09:00:00','HR')
insert into EmployeeTable values (4,'Shushanth', 'Singh',500000,'2020-02-17 09:00:00','Admin')
insert into EmployeeTable values (5,'Bhupal', 'Bhati',500000,'2011-06-18 09:00:00','Admin')
insert into EmployeeTable values (6,'Dheeraj', 'Diwan',200000,'2011-06-19 09:00:00','Account')
insert into EmployeeTable values (7,'Karan', 'Kumar',75000,'2020-01-14 09:00:00','Account')
insert into EmployeeTable values (8,'Chandrika', 'Chauhan',90000,'2011-04-15 09:00:00','Admin')

Select * from EmployeeTable



create table EmployeeBonusTable
(
Enployee_ref_id int,
Bonus_Amount int,
Bonus_Date datetime
)

insert into EmployeeBonusTable values (1,5000,'2020-02-16 00:00:00')
insert into EmployeeBonusTable values (2,3000,'2011-06-16 00:00:00')
insert into EmployeeBonusTable values (3,4000,'2020-02-16 00:00:00')
insert into EmployeeBonusTable values (1,4500,'2020-02-16 00:00:00')
insert into EmployeeBonusTable values (2,3500,'2011-06-16 00:00:00')

select * from EmployeeBonusTable


create table EmployeeTitleTable
(
Employee_ref_id int,
Employee_title varchar(50),
Affective_Date datetime
)

insert into EmployeeTitleTable values (1,'Manager','2016-02-20 00:00:00')
insert into EmployeeTitleTable values (2,'Executive','2016-06-11 00:00:00')
insert into EmployeeTitleTable values (8,'Executive','2016-06-11 00:00:00')
insert into EmployeeTitleTable values (5,'Manager','2016-06-11 00:00:00')
insert into EmployeeTitleTable values (4,'Asst. Manager','2016-06-11 00:00:00')
insert into EmployeeTitleTable values (7,'Executive','2016-06-11 00:00:00')
insert into EmployeeTitleTable values (6,'Lead','2016-06-11 00:00:00')
insert into EmployeeTitleTable values (3,'Lead','2016-06-11 00:00:00')

select * from EmployeeTitleTable


--Solutions:

--Tasks To Be Performed:
--Q1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

select First_name as Employee_name from EmployeeTable

--Q2 Display “LAST_NAME” from Employee table in upper case.

select upper(Last_Name) from EmployeeTable

--Q3 Display unique values of DEPARTMENT from EMPLOYEE table.

select distinct(Department) from EmployeeTable

--Q4 Display the first three characters of LAST_NAME from EMPLOYEE table.

select Left(Last_Name,3) as [3_Char_LN] from EmployeeTable

--Q5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

select distinct(Department), len(Department) as len_Dep_Name from EmployeeTable

--Q6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.  a space char should separate them.

select concat([First_name],' ',[Last_Name]) as [FULL_NAME] from EmployeeTable

--Q7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

select * from EmployeeTable  order by [First_name]

--Q8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from EmployeeTable order by  [First_name] , Department desc

--Q9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

select * from EmployeeTable where First_name = 'Veena' or First_name = 'Karan'

--Q10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

select * from EmployeeTable where Department = 'Admin'

--Q11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

select * from EmployeeTable where First_name like '%v%'

--Q12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

select * from EmployeeTable where Salary between 100000 and  500000

--Q13 Display details of the employees who have joined in Feb-2020.

SELECT * FROM EmployeeTable WHERE Joining_date >= '01 Feb 2020' and Joining_date < '01 Mar 2020'

--Q14 Display employee names with salaries >= 50000 and <= 100000.

select * from EmployeeTable where Salary >= 50000 and Salary <=100000

--Q16 DISPLAY details of the EMPLOYEES who are also Managers.

select A.* from EmployeeTable A
inner join  EmployeeTitleTable B
on A.Employee_id = B.Employee_ref_id
where B.Employee_title = 'Manager'

--Q17 DISPLAY duplicate records having matching data in some fields of a table.

select Employee_title from EmployeeTitleTable group by Employee_title having count(Employee_title)>1


--Q18 Display only odd rows from a table.

select * from EmployeeTable where (Employee_ID%2)=1

--Q19 Clone a new table from EMPLOYEE table.

select * into EmployeeTable_NEW from EmployeeTable
select * from EmployeeTable_NEW

--Q20 DISPLAY the TOP 2 highest salary from a table.

select top 2 E.* from EmployeeTable E order by Salary desc

--Q21. DISPLAY the list of employees with the same salary.

select * from EmployeeTable where salary = (select Salary from EmployeeTable group by Salary having count(Salary)>1)

--Q22 Display the second highest salary from a table.

select max(Salary) as '2nd_highest_salary'  from EmployeeTable where Salary<(select max(Salary) from EmployeeTable)

--Q23 Display the first 50% records from a table.

select top 50 percent * from EmployeeTable

--Q24. Display the departments that have less than 4 people in it.

select Department from EmployeeTable group by Department having count(Department) < 4

--Q25. Display all departments along with the number of people in there.

select Department, count(Department) as Total_No_of_Emp from EmployeeTable group by Department

--Q26 Display the name of employees having the highest salary in each department.
Select concat([First_name],' ',[Last_Name]) as [FULL_NAME],E.[Salary],[Joining_date],E.[Department] from EmployeeTable E JOIN
(select Department,max(Salary) as Maxm_Salary from EmployeeTable group by Department) D
ON E.Department=D.Department and E.Salary=D.Maxm_Salary

--Q27 Display the names of employees who earn the highest salary.

Select * from EmployeeTable where Salary = (Select max(Salary) from EmployeeTable)

--Q28 Diplay the average salaries for each department

select Department,avg(Salary) as AVG_Salary from EmployeeTable group by Department

--Q29 display the name of the employee who has got maximum bonus

select * from EmployeeTable where [Employee_id] = 
(select [Enployee_ref_id] from EmployeeBonusTable
where Bonus_Amount 
= (select max(Bonus_Amount) as Maxm_Bonus from EmployeeBonusTable))


--Q30 Display the first name and title of all the employees
select E.[First_name],T.Employee_title from EmployeeTable E join
EmployeeTitleTable T
on E.[Employee_id]=T.Employee_ref_id

