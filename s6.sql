create table students (
    id int primary key auto_increment,
    name varchar(50),
    age int,
    department_id int
);

insert into students(name,age,department_id)
value('Ahmend',22,1);

INSERT INTO students (name, age, department_id)
VALUES ('Mona', 21, 2);

INSERT INTO students (name, age, department_id)
VALUES ('Khaled', 24, 1);

INSERT INTO students (name, age, department_id)
VALUES ('Sara', 23, 3);

INSERT INTO students (name, age, department_id)
VALUES ('Nour', 20, 2);

select * from students

create table departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) UNIQUE
);

INSERT INTO departments(name) VALUES
('Engineering'), ('Commerce'), ('Science');

update students
set age=23
where name='Ahmed'; 

alter table students add email varchar(80);

alter table students add constraint uq_students_email unique (email);

select * from students

alter table students
add constraint fk_students_dept
foreign key (department_id)
references departments(id);

create table courses (
    id int primary key auto_increment,
    title varchar(80),
    dept_id int,
    constraint fk_couses_dept foreign key (dept_id) references department(id)
);

INSERT INTO courses(title, dept_id) VALUES
('SQL Basics',2), ('Control Systems',1), ('Biology 101',3), ('Data Structures',1);

CREATE TABLE enrollments (
  student_id INT,
  course_id INT,
  grade INT,
  PRIMARY KEY (student_id, course_id),
  CONSTRAINT fk_enr_stu FOREIGN KEY (student_id) REFERENCES students(id),
  CONSTRAINT fk_enr_crs FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO enrollments(student_id, course_id, grade) VALUES
(1,1,85), (1,4,90),
(2,1,78), (2,3,88),
(3,2,70), (3,4,80),
(4,3,92),
(5,1,60);

delete e 
from enrollments e 
join students s on s.id=e.student_id
join courses c on c.id=e.course_id
where s.name='Ahmed' and c.title='Data structures';

select * from enrollments

set @dept:='Engineering'
select count(*) as cnt 
from students s 
join department d on d.id=s.department_id
where d.name=@dept ;

SELECT s.name, d.name AS dept
FROM students s
INNER JOIN departments d ON d.id = s.department_id;

