create database joins;
use joins;
create table student (
st_id int primary key auto_increment,
st_name varchar(100),
st_age int
);
-- insert values
insert into student values(101,'raju',25),
(102,'kumal',22),
(103,'shiva',24),
(104,'anil',26);
select * from student;

use joins;
create table marks (
st_id int primary key auto_increment,
marks int,
percentage Decimal(5,2)
);

-- insert values
insert into marks values(101,200,40.5),
(103,250,45),
(105,300,50),
(106,350,55);
select * from marks;

-- inner join 
select student.st_id,marks.marks from student
inner join marks on student.st_id=marks.st_id;
-- inner join
select student.st_id,marks.marks from marks
inner join student on student.st_id=marks.st_id;
-- left join 
select student.st_name,marks.marks from student
left join marks on student.st_id=marks.st_id;
-- left join
select student.st_name,st_age,marks.marks from marks
left join student on student.st_id=marks.st_id;
-- right join
select student.st_name,st_age,marks.marks from student
right join marks on student.st_id=marks.st_id;
-- right join
select student.st_name,st_age,marks.marks from marks
right join student on student.st_id=marks.st_id;
-- full join 
select student.st_id,st_age,marks.marks from student
full join marks on student.st_id=marks.st_id;

select student.st_id, student.st_age, marks.st_id,marks.marks from marks
right join student on student.st_id=marks.st_id;