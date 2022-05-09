use shopdb;
select * from memberTBL;

SELECT * FROM memberTBL WHERE memberId IN('jsa', 'Dang');

select * from userTBL;
select * from buyTBL;

select *
from userTBL as u
inner join buyTBL as b
on u.userName = b.userName;

select *
from userTBL as u
left join buyTBL as b
on u.userName = b.userName
where b.userName is not null;

use employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from titles;
select * from salaries;

select *
from employees as e
inner join dept_emp as d
on e.emp_no = d.emp_no;