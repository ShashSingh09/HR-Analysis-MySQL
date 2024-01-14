#1."Using HR Schema, Write a query to fetch the first name ,last name, 
#name of the department and the location of work of all the employees."
use hr;
select first_name,last_name,d.department_name,l.city from employees e
join departments as d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id;

#2."Using HR Schema, Write a query to fetch the first name ,
#last name of all the employees who are Sales Representative."
select first_name,last_name,j.job_title from employees e
join jobs j
on e.job_id=j.job_id
where job_title='Sales Representative';

#3"Using HR Schema, Write a Query to fetch all the departments 
#and the names of the person managing them."
select first_name,department_name from employees e
join departments d on
d.manager_id=e.manager_id;

#4"Using HR Schema, Write a Query to fetch all the departments 
#and the names of the person managing them in America Region."

select first_name,department_name,r.region_name from employees e
join departments d on
d.manager_id=e.manager_id
join locations l on
d.location_id=l.location_id
join countries c on
l.country_id=c.country_id
join regions r on
c.region_id=r.region_id 
where r.region_name='Americas';

#5"Using HR Schema, Write a query to fetch the names of the
 #departments that are unstaffed."
 
select d.department_name from employees e
right join departments d on
e.department_id=d.department_id
where first_name is null;

#6"Using HR Schema, Write a query to fetch the names of the
 #departments that are unstaffed and are located in Seattle."
select d.department_name from employees e
right join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
where first_name is null and l.city='Seattle';

#7"Using HR Schema, Write a query to identify the list of names of employees 
#who are not assigned any work and also the list of departments that are
 #unstaffed so that the employees can be utilised to staff the departments."

select first_name,last_name, department_name
from employees e
left join departments d on
e.department_id=d.department_id
UNION
select first_name,last_name, department_name
from employees e
right join departments d on
e.department_id=d.department_id;

#8"Using HR Schema, Write a query to identify the list of names of employees 
#who are not assigned any work and also the list of departments that are
 #unstaffed so that the employees can be utilised to staff the departments in London."
 
 select first_name,last_name, department_name
from employees e
left join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
where l.city='London'
UNION
select first_name,last_name, department_name
from employees e
right join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
where l.city='London';
 
 #9"Using HR Schema, Write a query to list the names of all people 
#who report to the same person."
select e2.first_name Emp_name,e1.first_name Reporting_to from employees e1
join employees e2 on
e1.employee_id=e2.manager_id;

#10"Using HR Schema, Write a query to list the names of all people 
#who report to the same person in department Accounting.

select e2.first_name Emp_name,e1.first_name Reporting_to,d.department_name from employees e1
join employees e2 on
e1.employee_id=e2.manager_id
join departments d on
e1.department_id=d.department_id
where d.department_name = 'Accounting';

#11"Write a query in SQL to display the first name, last name, 
#department number, and department name for each employee."

select first_name,last_name,d.department_id,d.department_name from employees e
join departments d on 
e.department_id=d.department_id;

#12."Write a query in SQL to display the first and last name, department, city
# and state province for each employee."

select first_name,last_name,d.department_name,l.city,l.state_province from employees e
join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id;

#13."Write a query in SQL to display the first name, last name, salary, 
#and job grade for all employees."
select first_name,last_name,j.job_title,j.min_salary from employees e
join jobs j on
j.job_id=e.job_id;

#14"Write a query in SQL to display the first name, last name, department number 
#and department name, for all employees for departments 80 or 40."

select first_name,last_name,d.department_id,d.department_name from employees e
join departments d on 
e.department_id=d.department_id
where d.department_id in (40,80);

#15"Write a query in SQL to display those employees who contain a letter z to
 #their first name and also display their last name, department, city, and state province."
 select first_name,last_name,d.department_name,l.city,l.state_province from employees e
join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
where first_name like '%z%';

#16.Write a query in SQL to display all departments including those where does not have any employee.
select first_name,last_name,d.department_name from employees e
right join departments d on
d.department_id=e.department_id;

#17."Write a query in SQL to display the first name of all employees including 
#the first name of their manager."

select e1.first_name,e2.first_name manager_name from employees e1
join employees e2 on
e1.manager_id=e2.employee_id;

#18.Write a query in SQL to display the department name, city, and state province for each department.

select d.department_name,l.city,l.state_province from employees e
join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id;

#19."Write a query in SQL to display the first name of all employees and the first name 
#of their manager including those who does not working under any manager."

select e1.first_name,e2.first_name manager_name from employees e1
left join employees e2 on
e1.employee_id=e2.manager_id;

#20."Write a query in SQL to display the first name, last name, and department number for those
# employees who works in the same department as the employee who holds the last name as Taylor"

select e1.first_name,e1.last_name,e2.department_id from employees e1
join employees e2 on
e1.department_id=e2.department_id
where e2.last_name='Taylor';

#21."Write a query in SQL to display the job title, department name, full name (first and last name ) of employee,
#and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997."

select concat(first_name,' ',last_name) Full_name,j.job_title,d.department_name,jh.start_date from employees e
join departments d on
e.department_id=d.department_id
join jobs j on
e.job_id=j.job_id
join job_history jh on
e.job_id=jh.job_id 
where jh.start_date >= '1993-01-01' and jh.start_date <='1997-08-31';

#22."Write a query in SQL to display the name of the department, average salary and number of
 #employees working in that department who got commission."
select d.department_name,avg(e.salary) Average_Salary,count(e.commission_pct) No_of_individuals_receiving_commission from employees e
join departments d on
e.department_id=d.department_id
group by d.department_name;

#23."Write a query in SQL to display the country name, city, and number of those
 #departments where at least 2 employees are working."
 select c.country_name,l.city,d.department_name from employees e
join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
join countries c on
l.country_id=c.country_id
group by d.department_name,c.country_name,l.city
having count(employee_id) <= 2;

#24"Write a query in SQL to display the department name and number of employees
 #in each of the department."
  select d.department_name,count(e.employee_id) No_of_employees from employees e 
  join departments d on
  e.department_id=d.department_id
  group by d.department_name
  order by count(employee_id) desc;
  
#25."Write a query in SQL to display the full name (first and last name ) of employee with ID 
#and name of the country presently where (s)he is working"

select concat(first_name,' ',last_name) Full_name,employee_id,c.country_name from employees e 
join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
join countries c on
l.country_id=c.country_id;

#26.Write a query to display the name ( first name and last name ) for those employees 
#who gets more salary than the employee whose ID is 163.

select first_name,last_name from employees
where salary >
(select salary from employees
where employee_id = 163);

#27.Write a query to display the name ( first name and last name ), salary, department id 
#for those employees who earn such amount of salary which is the smallest salary of any of the departments.

select concat(first_name,' ',last_name) Name,salary,department_id from employees
where salary =
(select min(salary) from employees);

#28.Write a query to display the employee id, employee name (first name and last name ) for all employees 
#who earn more than the average salary.

select employee_id,concat(first_name,' ',last_name) Name from employees
where salary >
(select avg(salary) from employees);

#29.Write a query to display the employee name ( first name and last name ), employee id and salary of
# all employees who report to Payam.

select concat(first_name,' ',last_name) Name,employee_id,salary from employees
where manager_id =
(select manager_id from employees
where first_name='Payam');

#30.Write a query to display all the information of the employees who does not work in those departments 
#where some employees works whose manager id within the range 100 and 200.

select * from employees
where manager_id not in
(select manager_id from employees
where manager_id between 100 and 200);

#31.Write a query to display the employee name( first name and last name ) and hiredate 
#for all employees in the same department as Clara. Exclude Clara.

select name,hire_date from
(select concat(first_name,' ',last_name) name,hire_date from employees 
where department_id=
(select department_id from employees
where first_name='Clara'))t
where name != 'Clara Vishney';

#32.Write a query to display the employee id, name ( first name and last name ), salary, department name and city 
#for all the employees who gets the salary as the salary earn by the employee which is maximum within the
# joining person January 1st, 1997 and December 31st,1997.

select employee_id,concat(first_name,' ',last_name) name,salary,d.department_name,l.city from employees e
join departments d on
e.department_id=d.department_id
join locations l on
d.location_id=l.location_id
where salary =
(select max(salary) from employees
where hire_date between '1997-01-01' and '1997-12-31');

#33.Write a query in SQL to display the first and last name, salary, and department ID for those employees 
#who earn less than the average salary, and also work at the department where the employee Laura is working as a first name holder.

select * from
(select first_name,last_name,salary,department_id from employees 
where salary <
(select avg(salary) from employees))t
where department_id =
(select department_id from employees
where first_name='Laura');
 
 #34.Display the name & department ID of all departments that has at least one employee with salary greater than 10,000.
 
 select d.department_name,d.department_id from employees e
 join departments d on
 e.department_id=d.department_id
 where e.salary > 10000
 group by d.department_name,d.department_id;
 
 #35.Write a query to fetch the employee ID, First Name, Last Name, Salary and Department ID of those employees 
 #who draw a salary more than the average salary of their respective department.
 
 select employee_id,first_name,last_name,salary,department_id,avg(salary) over(partition by department_id) average_salary_departmentwise from employees;

 #36.Display first name ,last name of employees where deparment id is equal to Adam department id 
 #and employee_id is 144 using subquery.
 
 select first_name,last_name from employees
 where department_id =
 (select department_id from employees
 where first_name='Adam') and employee_id= 144;
 
 
 #37.Display all the employees who have their manager and department matching with the employee 
 #having an Employee ID of 121 or 200 but not 121 or 200 using subquery .
 
 select employee_id,manager_id,department_id from employees
 where  (manager_id, department_id) in
 (select manager_id,department_id from employees
 where employee_id in (121,200)) and employee_id not in (121,200);
 
#38.Display 5th highest salary of employee using subquery.
select salary from
(select salary from employees
order by salary desc
limit 6)t
where salary = 13000;

#39.Display the employee number, name (first name and last name) and job title for all employees
# whose salary is smaller than any salary of those employees whose job title is MK_MAN using subquery.
 select e.employee_id,e.first_name,e.last_name,j.job_title from employees e
 join jobs j on
 e.job_id=j.job_id
 where salary < 
 (select e.salary from employees e
join jobs j on
e.job_id=j.job_id
where e.job_id='MK_MAN');

#40.Write a query to find the name (first_name, last_name) of the employees who have a manager 
#and worked in a US based department using subquery. 

select first_name, last_name from employees 
where manager_id in 
(select employee_id from employees 
where department_id in 
(select department_id from departments where location_id in (select location_id from locations where country_id='US')));



 


 









  

 
 

 














 














 





 









