
select * from courses;

Select * from departments;

Select * from scores;

select * from teacher;


select teacher_id, teacher_name, sex from teacher;

--How many departments does brightfuture have?
select count(distinct(department_id)) from departments

--How many courses are there in each department?
select department ,count(course_id) from courses
group by department;

--courses offered in Ms Excel depatment (DP1) 
Select * from courses where department = 'DP1';

--Scores containing advanced excel(EX103) and powerbi for dummies(PB101)
select * from scores where course_id in('EX103', 'PB101');

select * from scores where course_id Not In('EX103', 'PB101');


/*1 Generate a report showing the names of courses along with the department they belong to */

Select courses.course_name, department_name
from courses
inner join departments on courses.department = departments.department_id;

/*2 List of Students with their respective courses and scores for those scoring above 75 */

select scores.student_name, courses.course_name, scores.score
from courses
inner join scores on courses.course_id = scores.course_id
where scores.score > 75;

--3 Provide an overview of all courses, including those without assigned teachers

select courses.course_name, teacher.teacher_name
from courses
left join teacher on courses.course_id = teacher.teacher_course;

--4 Generate a report showing all courses along with any avg scores, rounded to the nearest integer
select courses.course_name, courses.course_id, round(avg(scores.score))
from courses
left join scores 
on courses.course_id = scores.course_id
group by courses.course_id, course_name;

--Provide the list of all student with their respective courses,including those not assigned to an course.
select scores.student_name, courses.course_name
from courses 
right join scores on courses.course_id = scores.course_id;

--Identify courses and their total student enrollment, including courses with no student enrolled.

select courses.course_name, count(distinct(scores.course_id))
from courses
Right join scores on courses.course_id = scores.course_id
group by courses.course_name;


--The Avg number of course units offered by each department, Using Inner Join.

select departments.department_name, round(avg(courses.course_unit)) as "Avg course_unit"
from departments
join courses on departments.department_id = courses.department
group by departments.department_name;

--Identify teachers not currently assigned to any courses. Using Left Join.

select courses.course_name, teacher.teacher_name
from courses
left join teacher on courses.course_id = teacher.teacher_course;

/*Calculate the Average score for each course, including courses where some students might not have associated scores */

select courses.course_name, round(avg(scores.score)) as "avg score"
from courses
Right join scores on courses.course_id = scores.course_id
group by courses,course_name;

/* List of all Departments alongside all courses, including those with no direct association */

select departments.department_name, courses.course_name
from departments
full join courses on departments.department_id = courses.department;












