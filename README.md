# Online Learning Platform Analytics Using SQL

## Project Overview
**Online Learning Platform Analytics using SQL** is a database project designed to manage and analyze data related to students, instructors, courses, enrollments, and payments.
The project uses a **relational database structure** with primary and foreign key relationships to maintain data accuracy and consistency. SQL queries are used for data retrieval, joins, filtering, aggregation, subqueries, and reporting to generate meaningful insights.

## Project Objectives

* Manage student and instructor information
* Store and analyze course details
* Track student course enrollments
* Analyze payment transactions
* Understand relationships between students, courses, instructors, and payments
* Practice SQL joins and subqueries
* Create SQL views for analytical reporting

## Database Tables
The project contains five main tables:
### 1. Student
Stores personal and registration details of learners. Each student has a unique `Student_ID` as the primary key.
### 2. Enrollment
Records the courses in which students are enrolled and connects students with their selected courses. It also tracks enrollment progress and completion status.
### 3. Course
Stores information about courses available on the platform. Each course has a unique `Course_ID` and is associated with an instructor.
### 4. Instructor
Stores information about instructors who teach courses. Each instructor has a unique `Instructor_ID`.
### 5. Payment
Stores payment information related to student course enrollments. Each payment has a unique `Payment_ID`.

## ER Diagram
<img width="2000" height="956" alt="image" src="https://github.com/user-attachments/assets/8d9ab37d-e9b2-426c-9af9-a1536036bdff" />

## SQL Joins
The project demonstrates different types of joins:
* **INNER JOIN**
-- display the student name, course name , instructor name and payment amount for all sucssfull payment.
```sql
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
```
* **LEFT JOIN**
-- Display all students along with their payment details. Include students who have not made any payment.
```sql
select s.student_name,
p.Amount,
p.payment_mode,
p.payment_status
from Student s
left join Enrollment e
on s.student_id=e.student_id
left join Payment p
on p.enrollment_id=e.enrollment_id;
```
* **RIGHT JOIN**
-- Show all instructors and the courses they teach, including instructors who are not assigned to any course.
```sql
select i.Instructor_ID,
    i.Instructor_Name,
    c.Course_ID,
    c.Course_Name
from Course c
right join Instructor i
on c.Instructor_ID = i.Instructor_ID;
```
* **FULL OUTER JOIN concept**
-- Display all students and all payment records, including students who have never made a payment and payments without matching student details.
```sql
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
```
* **Multiple JOINs**
-- Display the student name, course name, instructor name, payment mode, payment amount, and payment status.
```sql
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
```
## Subqueries
The project includes subqueries for analytical questions such as:
* Finding students whose payment amount is greater than the average payment
```sql
select s.student_id, s.student_name, p.Amount from Student s
inner join Enrollment e
on s.student_id=e.student_id
inner join Payment p
on e.enrollment_id=p.enrollment_id
where p.Amount >
(select avg(p.Amount) as avg_amount from Payment p);
```
* Finding the instructor with the highest rating
```sql
select * from Instructor
where  Rating = 
(
    select MAX(Rating)
    from  Instructor
);
```
* Finding students enrolled in **SQL for Beginners**
```sql
select * from Student
where student_id in 
(
select student_id from Enrollment 
where course_id =
(
select course_id from Course 
where course_name="SQL for Beginners")
);
```
* Finding the instructor teaching the course with the highest fee
```sql
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
```
* Finding students whose payment status is successful
```sql
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
```
## SQL Views
Three analytical views are created in the project.
### 1. Student Enrollment View
The `student_enrollment_view` combines:
* Student ID
* Student Name
* Course Name
* Instructor Name
* Enrollment Date
* Enrollment Status
```sql
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
```
### 2. Course Performance View
The `Course_Performance_View` provides course-level performance information including:
* Course ID
* Course Name
* Course Fee
* Total Students Enrolled
* Total Revenue Generated
```sql
REATE VIEW Course_Performance_View AS
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
```
### 3. Student Payment View
The `Student_Payment_View` provides:
* Student ID
* Student Name
* Course Name
* Payment Amount
* Payment Date
* Payment Status
```sql
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
```

## 📁 Project Files
### Online-Learning-Platform-SQL
### Project.sql
Contains the SQL queries, joins, subqueries, and view creation statements used in the project.
* <a href="https://github.com/Akshita-Munpelli/Online-Learning-Platform-SQL/blob/main/online%20learnig%20platform%20project.sql">Sql File</a>
### SQL project.pptx
Contains the project presentation, database structure, table descriptions, SQL queries, and outputs.
* <a href="https://github.com/Akshita-Munpelli/Online-Learning-Platform-SQL/blob/main/SQL%20project.pptx">Sql PPT</a>
## Key Insights

* Analyzed **student enrollments and course participation**.
* Identified **successful and above-average payment transactions**.
* Analyzed **instructor ratings and course fees**.
* Evaluated **course-wise enrollment and revenue**.
* Created views for **student enrollment and payment analysis**.
