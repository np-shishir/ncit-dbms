-- lab3 questions

create database class_qn;
use class_qn;
-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);

-- Create Enrollment Table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


-- Insert Data into Students
INSERT INTO Students (student_id, name, age, email, phone_number) VALUES
(1, 'Alice Smith', 20, 'alice@example.com', '555-0101'),
(2, 'Bob Johnson', 22, 'bob@example.com', '555-0102'),
(3, 'Charlie Brown', 19, 'charlie@example.com', '555-0103'),
(4, 'Diana Prince', 21, 'diana@example.com', '555-0104'),
(5, 'Evan Wright', 23, 'evan@example.com', '555-0105');

-- Insert Data into Courses
INSERT INTO courses (course_id, name, credit_hour) VALUES
(101, 'Introduction to Computer Science', 3),
(102, 'Data Structures', 4),
(103, 'Database Management Systems', 3),
(104, 'Web Development', 3),
(105, 'Artificial Intelligence', 4);

-- Insert Data into Enrollment
INSERT INTO enrollment (enrollment_id, course_id, student_id) VALUES
(1001, 101, 1),
(1002, 103, 1),
(1003, 102, 2),
(1004, 104, 2),
(1005, 101, 3),
(1006, 105, 4),

(1009, 102, 1);


select * from students;
select * from courses;
select * from enrollment;
-- Basic
select name, email from students;
select * from students where age>20;
select * from students where name like "A%";
select * from courses where name like "%Science%";
select * from students order by age desc;
select * from students where phone_number ='555-0103';

-- Part 1
alter table students add column address varchar(20);
alter table students add column is_active boolean default TRUE;
alter table students modify column phone_number varchar(50);
alter table courses rename column `name` to course_name;
alter table students drop column age ;
alter table courses add constraint credit_hours check (credit_hour>=1);

-- Part 2
update students
set phone_number="555-9999"
where student_id=1;
update students set name="Hello world", email="bob@@@@g.com" where student_id=2;
update courses set credit_hour=credit_hour+1 where credit_hour=3;
update students set email = lower(email);
update courses set credit_hour=5 where course_name="Data Structures";


-- Part 3
set foreign_key_checks=0;
delete from students where name = "Evan Wright";
delete from enrollment where student_id=5;
delete from courses where credit_hour<3;
truncate table enrollment;


-- Part 4
select count(*) from students;
select avg(student_id) from students;
select max(credit_hour) from courses;
select sum(credit_hour) from courses;

-- Grouping
select c.course_id, count(*)
from students as s
join enrollment as e
on s.student_id=e.student_id
join courses as c
on c.course_id = e.course_id
group by c.course_id;


