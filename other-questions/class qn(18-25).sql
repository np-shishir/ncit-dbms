-- class practice qn

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    mobile_number VARCHAR(15),
    department_name VARCHAR(50)
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    name VARCHAR(50),
    credit_hour INT
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

--------------------------------------------------
-- Insert 10 Records into Students
--------------------------------------------------
INSERT INTO Students VALUES
(101, 'Ram Sharma', 20, 'ram@gmail.com', '9811111111', 'Computer Science'),
(102, 'Sita Karki', 21, 'sita@gmail.com', '9822222222', 'Information Technology'),
(103, 'Hari Thapa', 19, 'hari@gmail.com', '9833333333', 'Computer Science'),
(104, 'Gita Rai', 22, 'gita@gmail.com', '9844444444', 'Electronics'),
(105, 'Nabin KC', 20, 'nabin@gmail.com', '9855555555', 'Civil Engineering'),
(106, 'Pooja Shrestha', 21, 'pooja@gmail.com', '9866666666', 'Information Technology'),
(107, 'Bikash Lama', 23, 'bikash@gmail.com', '9877777777', 'Mechanical Engineering'),
(108, 'Anita Gurung', 20, 'anita@gmail.com', '9888888888', 'Computer Science'),
(109, 'Rohan Joshi', 22, 'rohan@gmail.com', '9899999999', 'Electronics'),
(110, 'Mina Adhikari', 19, 'mina@gmail.com', '9800000000', 'Civil Engineering');

INSERT INTO Students VALUES
(111, 'Ram Sharma Not Enrolled', 20, 'ram@gmail.com', '9811111111', 'Computer Science');



--------------------------------------------------
-- Insert 10 Records into Courses
--------------------------------------------------
INSERT INTO Courses VALUES
(201, 'Database Management System', 3),
(202, 'Data Structures', 4),
(203, 'Operating System', 3),
(204, 'Computer Networks', 3),
(205, 'Software Engineering', 3),
(206, 'Web Technology', 2),
(207, 'Artificial Intelligence', 4),
(208, 'Machine Learning', 4),
(209, 'Digital Logic', 3),
(210, 'Computer Graphics', 3);

--------------------------------------------------
-- Insert 10 Records into Enrollments
--------------------------------------------------
INSERT INTO Enrollments VALUES
(301, 101, 201, 'Spring 2025'),
(302, 102, 202, 'Spring 2025'),
(303, 103, 203, 'Spring 2025'),
(304, 104, 204, 'Fall 2025'),
(305, 105, 205, 'Fall 2025'),
(306, 106, 206, 'Spring 2025'),
(307, 107, 207, 'Fall 2025'),
(308, 108, 208, 'Spring 2025'),
(309, 109, 209, 'Fall 2025'),
(310, 110, 210, 'Spring 2025');


select * from Students
order by age desc 
limit 1;

-- 19
select c.name,count(*) from Students as s
join Enrollments as e
on s.student_id=e.student_id
join Courses as c
on c.course_id=e.course_id
group by c.name;

-- 20
select s.name from Students as s
join Enrollments as e
on s.student_id=e.student_id
join Courses as c
on c.course_id=e.course_id
where c.name="Data Structures";

select department_name, count(*) from Students
group by department_name;

-- 22
select count(*) from Enrollments;

-- 21
select * from Students left join Enrollments 
on Students.student_id = Enrollments.student_id
where Enrollments.enrollment_id is null;

with cte_eg as
(
select * from Students as s
left join Enrollments as e
on s.student_id = e.student_id
)
select s.student_id, s.name, s.age, s.email, s.mobile_number, s.department_name
from cte_eg
where e.enrollment_id is null;

-- 23 course with highest no of enrolled
select c.name, count(e.enrollment_id) as students
from Courses as c
join Enrollments as e
on c.course_id=e.course_id
group by c.name
order by students desc
limit 1;

-- 24 display students with letter 'A'
select * from Students
where name like 'A%';

-- 25 Create a view that shows student names and their enrolled courses.
create view student as
select s.name s_name, c.name c_name from Students as s
join Enrollments as e
on s.student_id=e.student_id
join Courses as c
on c.course_id=e.course_id;

select * from student;
