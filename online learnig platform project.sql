Create database online_learning_platform;
use online_learning_platform;

create table Student(
student_id int primary key,
student_name varchar(20) not null,
Gender varchar(20),
Age int,
City varchar(50),
Email varchar(50) unique key,
Join_Date date);

desc Student;

INSERT INTO Student
(student_id, student_name, Gender, Age, City, Email, Join_Date)
VALUES
(101,'Aarav Sharma','Male',22,'Mumbai','aarav.sharma@gmail.com','2025-01-10'),
(102,'Ananya Patel','Female',21,'Pune','ananya.patel@gmail.com','2025-01-12'),
(103,'Rohan Mehta','Male',23,'Ahmedabad','rohan.mehta@gmail.com','2025-01-15'),
(104,'Priya Verma','Female',22,'Delhi','priya.verma@gmail.com','2025-01-18'),
(105,'Arjun Nair','Male',24,'Bengaluru','arjun.nair@gmail.com','2025-01-20'),
(106,'Sneha Kapoor','Female',23,'Hyderabad','sneha.kapoor@gmail.com','2025-01-23'),
(107,'Vivek Joshi','Male',24,'Chennai','vivek.joshi@gmail.com','2025-01-26'),
(108,'Isha Gupta','Female',22,'Kolkata','isha.gupta@gmail.com','2025-01-28'),
(109,'Karan Shah','Male',25,'Surat','karan.shah@gmail.com','2025-02-01'),
(110,'Meera Iyer','Female',23,'Mumbai','meera.iyer@gmail.com','2025-02-03'),
(111,'Rahul Singh','Male',24,'Lucknow','rahul.singh@gmail.com','2025-02-05'),
(112,'Pooja Mishra','Female',22,'Jaipur','pooja.mishra@gmail.com','2025-02-08'),
(113,'Nikhil Jain','Male',23,'Indore','nikhil.jain@gmail.com','2025-02-10'),
(114,'Riya Das','Female',21,'Kolkata','riya.das@gmail.com','2025-02-12'),
(115,'Aditya Kulkarni','Male',24,'Pune','aditya.kulkarni@gmail.com','2025-02-15'),
(116,'Neha Arora','Female',22,'Delhi','neha.arora@gmail.com','2025-02-18'),
(117,'Harsh Patel','Male',25,'Ahmedabad','harsh.patel@gmail.com','2025-02-20'),
(118,'Kavya Reddy','Female',23,'Hyderabad','kavya.reddy@gmail.com','2025-02-23'),
(119,'Siddharth Rao','Male',24,'Bengaluru','siddharth.rao@gmail.com','2025-02-25'),
(120,'Aditi Sharma','Female',22,'Mumbai','aditi.sharma@gmail.com','2025-02-28'),
(121,'Yash Malhotra','Male',23,'Noida','yash.malhotra@gmail.com','2025-03-02'),
(122,'Simran Kaur','Female',22,'Chandigarh','simran.kaur@gmail.com','2025-03-05'),
(123,'Mohit Agarwal','Male',24,'Kanpur','mohit.agarwal@gmail.com','2025-03-08'),
(124,'Nisha Menon','Female',23,'Kochi','nisha.menon@gmail.com','2025-03-10'),
(125,'Deepak Yadav','Male',25,'Patna','deepak.yadav@gmail.com','2025-03-12'),
(126,'Shruti Bansal','Female',21,'Bhopal','shruti.bansal@gmail.com','2025-03-15'),
(127,'Akash Verma','Male',22,'Nagpur','akash.verma@gmail.com','2025-03-18'),
(128,'Tanvi Deshmukh','Female',23,'Nashik','tanvi.deshmukh@gmail.com','2025-03-20'),
(129,'Manav Sethi','Male',24,'Gurugram','manav.sethi@gmail.com','2025-03-22'),
(130,'Diya Choudhary','Female',22,'Jaipur','diya.choudhary@gmail.com','2025-03-25');

select * 
from Student;

create table Enrollment(
enrollment_id int primary key,
student_id int,
course_id int,
enrollment_date date,
Progress int,
E_status varchar(20),
foreign key (student_id) references Student(student_id),
foreign key (course_id) references Course(course_id)
);

desc Enrollment;

INSERT INTO Enrollment
(enrollment_id, student_id, course_id, enrollment_date, Progress, E_status)
VALUES
(401,101,301,'2025-04-01',100,'Completed'),
(402,102,303,'2025-04-02',85,'Active'),
(403,103,305,'2025-04-03',100,'Completed'),
(404,104,309,'2025-04-04',60,'Active'),
(405,105,315,'2025-04-05',40,'Active'),
(406,106,304,'2025-04-06',100,'Completed'),
(407,107,306,'2025-04-07',75,'Active'),
(408,108,307,'2025-04-08',100,'Completed'),
(409,109,310,'2025-04-09',55,'Active'),
(410,110,312,'2025-04-10',100,'Completed'),
(411,111,314,'2025-04-11',30,'Active'),
(412,112,318,'2025-04-12',90,'Active'),
(413,113,320,'2025-04-13',100,'Completed'),
(414,114,321,'2025-04-14',65,'Active'),
(415,115,325,'2025-04-15',100,'Completed'),
(416,116,330,'2025-04-16',45,'Active'),
(417,117,326,'2025-04-17',80,'Active'),
(418,118,327,'2025-04-18',100,'Completed'),
(419,119,328,'2025-04-19',70,'Active'),
(420,120,329,'2025-04-20',100,'Completed'),
(421,121,302,'2025-04-21',55,'Active'),
(422,122,305,'2025-04-22',100,'Completed'),
(423,123,311,'2025-04-23',35,'Active'),
(424,124,313,'2025-04-24',100,'Completed'),
(425,125,316,'2025-04-25',50,'Active'),
(426,126,319,'2025-04-26',100,'Completed'),
(427,127,324,'2025-04-27',25,'Active'),
(428,128,322,'2025-04-28',95,'Active'),
(429,129,323,'2025-04-29',100,'Completed'),
(430,130,330,'2025-04-30',65,'Active');

select * 
from Enrollment;

create table Course(
course_id int primary key,
instructor_id int,
course_name varchar(50) not null,
category varchar(50),
duration_hours int ,
price decimal (10,2),
foreign key(instructor_id)references Instructor (instructor_id));

desc Course;

INSERT INTO Course
(course_id ,course_name,category, duration_hours, Price,instructor_id)
VALUES
(301,'SQL for Beginners','Database',25,2999.00,201),
(302,'Advanced SQL','Database',35,4999.00,211),
(303,'Microsoft Excel Essentials','Productivity',20,2499.00,202),
(304,'Advanced Microsoft Excel','Productivity',30,3999.00,216),
(305,'Power BI for Beginners','Business Intelligence',30,4499.00,203),
(306,'Advanced Power BI','Business Intelligence',40,5999.00,214),
(307,'Tableau Desktop','Business Intelligence',28,4499.00,204),
(308,'Advanced Tableau','Business Intelligence',35,5499.00,227),
(309,'Python Programming','Programming',40,5999.00,205),
(310,'Python for Data Analysis','Programming',45,6999.00,213),
(311,'Python Automation','Programming',32,5499.00,228),
(312,'Statistics for Data Science','Statistics',24,3499.00,207),
(313,'Business Analytics','Analytics',30,4999.00,219),
(314,'Data Analytics using Excel','Analytics',32,4299.00,208),
(315,'Machine Learning Fundamentals','Artificial Intelligence',50,7999.00,206),
(316,'Advanced Machine Learning','Artificial Intelligence',60,9999.00,230),
(317,'Data Visualization','Visualization',25,3799.00,212),
(318,'Cloud Computing Basics','Cloud',35,6499.00,210),
(319,'SQL Server Administration','Database',38,6999.00,217),
(320,'Data Warehousing','Database',42,7499.00,218),
(321,'ETL Development using SSIS','Data Engineering',45,7999.00,224),
(322,'Data Modeling Concepts','Database',30,4999.00,226),
(323,'Artificial Intelligence Basics','Artificial Intelligence',35,6499.00,215),
(324,'Deep Learning Essentials','Artificial Intelligence',55,10999.00,230),
(325,'Big Data with Hadoop','Big Data',45,8499.00,220),
(326,'SQL Performance Tuning','Database',30,5499.00,222),
(327,'Dashboard Design Best Practices','Business Intelligence',20,2999.00,225),
(328,'Data Cleaning Techniques','Analytics',24,3499.00,221),
(329,'Predictive Analytics','Data Science',40,7499.00,223),
(330,'Complete Data Analyst Bootcamp','Data Analytics',80,14999.00,208);

select *
from Course;

create table Instructor (
instructor_id int primary key,
instructor_name varchar(20) not null,
Experience int,
Rating decimal (2,1),
specialization varchar(100));

desc Instructor;

INSERT INTO Instructor
(instructor_id, instructor_name, Experience, Rating, specialization)
VALUES
(201,'Dr. Rajesh Kumar',12,4.9,'SQL & Database'),
(202,'Neha Sharma',8,4.8,'Microsoft Excel'),
(203,'Kunal Mehta',6,4.7,'Power BI'),
(204,'Aditi Singh',5,4.6,'Tableau'),
(205,'Vikram Desai',10,4.9,'Python'),
(206,'Rohit Kapoor',7,4.5,'Machine Learning'),
(207,'Anjali Nair',9,4.8,'Statistics'),
(208,'Manish Verma',11,4.7,'Data Analytics'),
(209,'Sonal Gupta',8,4.6,'Business Intelligence'),
(210,'Amit Khanna',13,4.9,'Cloud Computing'),
(211,'Pankaj Sharma',10,4.8,'SQL Server'),
(212,'Ritu Malhotra',7,4.5,'Data Visualization'),
(213,'Sandeep Joshi',9,4.7,'Python Programming'),
(214,'Kriti Agarwal',6,4.6,'Microsoft Power BI'),
(215,'Abhishek Jain',11,4.8,'Artificial Intelligence'),
(216,'Megha Kapoor',8,4.7,'Advanced Excel'),
(217,'Rahul Chawla',10,4.9,'Database Administration'),
(218,'Nitin Rao',12,4.8,'Data Warehousing'),
(219,'Swati Mehta',7,4.6,'Business Analytics'),
(220,'Deepak Sharma',9,4.7,'Big Data'),
(221,'Shreya Nair',6,4.5,'Data Cleaning'),
(222,'Harshit Verma',8,4.7,'SQL Optimization'),
(223,'Priyanka Singh',9,4.8,'Data Science'),
(224,'Varun Patel',10,4.9,'ETL Development'),
(225,'Nidhi Arora',7,4.6,'Dashboard Design'),
(226,'Ankit Mishra',11,4.8,'Data Modeling'),
(227,'Pallavi Desai',8,4.7,'Tableau'),
(228,'Gaurav Bansal',9,4.8,'Python Automation'),
(229,'Sakshi Kapoor',6,4.5,'Statistical Analysis'),
(230,'Rakesh Iyer',14,5.0,'Machine Learning');

select * 
from Instructor;

create table Payment(
payment_id int primary key,
enrollment_id int,
payment_date date,
Amount decimal(10,2),
payment_mode varchar(20),
payment_status varchar(20),
foreign key(enrollment_id) references enrollment(enrollment_id));

desc Payment;

INSERT INTO Payment
(payment_id , enrollment_id, payment_date , Amount,payment_mode,payment_status)
VALUES
(501,401,'2025-04-01',2999.00,'UPI','Success'),
(502,402,'2025-04-02',2499.00,'Credit Card','Success'),
(503,403,'2025-04-03',4499.00,'Debit Card','Success'),
(504,404,'2025-04-04',5999.00,'Net Banking','Success'),
(505,405,'2025-04-05',7999.00,'UPI','Pending'),
(506,406,'2025-04-06',3999.00,'Credit Card','Success'),
(507,407,'2025-04-07',5999.00,'Debit Card','Success'),
(508,408,'2025-04-08',4499.00,'UPI','Success'),
(509,409,'2025-04-09',6999.00,'Net Banking','Success'),
(510,410,'2025-04-10',3499.00,'UPI','Success'),
(511,411,'2025-04-11',4299.00,'Credit Card','Pending'),
(512,412,'2025-04-12',6499.00,'Debit Card','Success'),
(513,413,'2025-04-13',7499.00,'Net Banking','Success'),
(514,414,'2025-04-14',7999.00,'UPI','Success'),
(515,415,'2025-04-15',8499.00,'Credit Card','Success'),
(516,416,'2025-04-16',14999.00,'Debit Card','Success'),
(517,417,'2025-04-17',5499.00,'UPI','Success'),
(518,418,'2025-04-18',2999.00,'Net Banking','Success'),
(519,419,'2025-04-19',3499.00,'Credit Card','Pending'),
(520,420,'2025-04-20',7499.00,'Debit Card','Success'),
(521,421,'2025-04-21',4999.00,'UPI','Success'),
(522,422,'2025-04-22',4499.00,'Credit Card','Success'),
(523,423,'2025-04-23',5499.00,'Net Banking','Failed'),
(524,424,'2025-04-24',4999.00,'Debit Card','Success'),
(525,425,'2025-04-25',9999.00,'UPI','Success'),
(526,426,'2025-04-26',6999.00,'Credit Card','Success'),
(527,427,'2025-04-27',10999.00,'Net Banking','Pending'),
(528,428,'2025-04-28',4999.00,'Debit Card','Success'),
(529,429,'2025-04-29',6499.00,'UPI','Success'),
(530,430,'2025-04-30',14999.00,'Credit Card','Success');

select * 
from Payment;

-- joins queries
-- inner join
-- display the student name, course name , instructor name and payment amount for all sucssfull payment.
select s.student_name,
c.course_name,
i.instructor_name,
p.Amount,
p.payment_status
from Student s
inner join Enrollment e
on s.student_id=e.student_id
inner join Course c
on c.course_id=e.course_id
inner join Instructor i
on c.instructor_id= i.instructor_id
inner join Payment p
on e.enrollment_id=p.enrollment_id
where payment_status="Success";

-- left join
-- Display all students along with their payment details. Include students who have not made any payment.

select s.student_name,
p.Amount,
p.payment_mode,
p.payment_status
from Student s
left join Enrollment e
on s.student_id=e.student_id
left join Payment p
on p.enrollment_id=e.enrollment_id;

-- right join
-- Show all instructors and the courses they teach, including instructors who are not assigned to any course.
select i.Instructor_ID,
    i.Instructor_Name,
    c.Course_ID,
    c.Course_Name
from Course c
right join Instructor i
on c.Instructor_ID = i.Instructor_ID;

-- full outer join
-- Display all students and all payment records, including students who have never made a payment and payments without matching student details.
select s.Student_ID,
    s.Student_Name,
    p.Payment_ID,
    p.Amount,
    p.Payment_Status
from Student s
left join  Enrollment e
on s.Student_ID = e.Student_ID
left join Payment p
on e.Enrollment_ID = p.Enrollment_ID
union
select s.Student_ID,
    s.Student_Name,
    p.Payment_ID,
    p.Amount,
    p.Payment_Status
from  Student s
right join  Enrollment e
on  s.Student_ID = e.Student_ID
right join  Payment p
on  e.Enrollment_ID = p.Enrollment_ID;

-- multi join 
-- Display the student name, course name, instructor name, payment mode, payment amount, and payment status.
select s.student_name,
c.course_name,
i.instructor_name,
p.payment_mode,
p.Amount,
p.payment_status
from Student s
inner join Enrollment e
on s.student_id=e.student_id
inner join Course c
on c.course_id=e.course_id
inner join Instructor i
on c.instructor_id=i.instructor_id
inner join Payment p
on p.enrollment_id=e.enrollment_id;

-- subquery
-- Display the Student ID, Student Name, and Payment Amount of students 
-- whose payment amount is greater than the average payment amount
select s.student_id, s.student_name, p.Amount from Student s
inner join Enrollment e
on s.student_id=e.student_id
inner join Payment p
on e.enrollment_id=p.enrollment_id
where p.Amount >
(select avg(p.Amount) as avg_amount from Payment p);

 -- Find the instructor(s) with the highest rating 
select * from Instructor
where  Rating = 
(
    select MAX(Rating)
    from  Instructor
);
 
 -- Display the names of students who are enrolled in the course "SQL for Beginners".
select * from Student
where student_id in 
(
select student_id from Enrollment 
where course_id =
(
select course_id from Course 
where course_name="SQL for Beginners")
);

-- Display the Instructor Name who teaches the course with the highest fee.
select * from Instructor 
where instructor_id =
(
select instructor_id 
from Course where Price =
(
select max(Price) as high_fess 
from Course
)
);
 
 
 -- Display the Student ID and Student Name of students whose Student ID payment status is successfull in the Payments table.
select student_id,
       student_name
from Student
where student_id IN
(
    select e.student_id
    from Enrollment e
    join Payment p
    on e.enrollment_id = p.enrollment_id 
    where payment_status ="success"
);
 
 
 -- views
 -- 1. Student Enrollment View
-- Create a VIEW named Student_Enrollment_View to display the following details:
-- Student ID
-- Student Name
-- Course Name
-- Instructor Name
-- Enrollment Date
-- Enrollment Status

CREATE VIEW student_enrollment_view as 
select 
s.student_id,
s.student_name,
c.course_name,
i.instructor_name,
e.enrollment_date,
e.E_status
from Student s
inner join Enrollment e
on s.student_id=e.student_id
inner join Course c
on c.course_id= e.course_id
inner join Instructor i
on c.instructor_id=i.instructor_id;

select * from student_enrollment_view;

-- 2. Course Performance View
-- Create a VIEW named Course_Performance_View that displays:
-- Course ID
-- Course Name
-- Course Fee
-- Total Number of Students Enrolled
-- Total Revenue Generated

CREATE VIEW Course_Performance_View AS
SELECT
    c.course_id,
    c.course_name,
    c.price AS course_fee,
    COUNT(e.student_id) AS total_students_enrolled,
    SUM(p.Amount) AS total_revenue_generated
FROM Course c
LEFT JOIN Enrollment e
    ON c.course_id = e.course_id
LEFT JOIN Payment p
    ON e.enrollment_id = p.enrollment_id
GROUP BY
    c.course_id,
    c.course_name,
    c.price;
    
    select * from  Course_Performance_View ;

-- 3. Student Payment View
-- Create a VIEW named Student_Payment_View to display:
-- Student ID
-- Student Name
-- Course Name
-- Payment Amount
-- Payment Date
-- Payment Status
CREATE VIEW Student_Payment_View AS
SELECT
    s.student_id,
    s.student_name,
    c.course_name,
    p.Amount AS payment_amount,
    p.payment_date,
    p.payment_status
FROM Student s
INNER JOIN Enrollment e
    ON s.student_id = e.student_id
INNER JOIN Course c
    ON e.course_id = c.course_id
INNER JOIN Payment p
    ON e.enrollment_id = p.enrollment_id;
    
    SELECT * FROM Student_Payment_View;
  

    