USE devcamp_sql_project;

/*	SQL query scripts for:
1	The average grade that is given by each professor
2	The top grades for each student
3	Sort students by the courses that they are enrolled in
4	Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course
5	Finding which student and professor have the most courses in common */

/*1 The average grade that is given by each professor*/
SELECT AVG(grades_score) AS 'Score', professors_name AS 'Professor'
FROM professors p
JOIN courses c
ON p.professors_id = c.courses_professors_id
JOIN grades g
ON g.grades_id = c.courses_grades_id
GROUP BY Professor
ORDER BY Score DESC;
/*TEST to get all the grades given by professor Mark (e.g.) to calculate if he has an average grade of 8.75 as shown in the report*/
SELECT * from courses
WHERE courses_professors_id = 5;
/*TEST result is OK as (8+9+10+8)/4 = 8.75*/

/*2 The top grades for each student*/
SELECT students_name AS 'Student', courses_name AS 'Name', MAX(grades_score) AS 'Grade'
FROM students s
JOIN courses c
ON s.students_id = c.courses_students_id
JOIN grades g
ON g.grades_id = c.courses_grades_id
GROUP BY Student
ORDER BY Student ASC;
/*Testing that my max score/grade (David) is 6*/
SELECT students_name, courses_name, MAX(grades_score) AS 'Grade'
FROM courses c
JOIN students s
ON c.courses_students_id = s.students_id
JOIN grades g
ON c.courses_grades_id = g.grades_id
WHERE students_name = "David"
ORDER BY Grade;

/*3 Sort students by the courses that they are enrolled in*/
SELECT courses_name AS 'Course', students_name AS 'Student'
FROM students s
JOIN courses c
ON s.students_id = c.courses_students_id
ORDER BY Course;

/*4 Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course*/
SELECT courses_name AS 'Course', AVG(grades_score) AS 'Average'
FROM courses c
JOIN grades g
ON c.courses_grades_id = g.grades_id
GROUP BY Course
ORDER BY Average ASC;

/*5 Finding which student and professor have the most courses in common*/
	/*As initially I related each professor with a different course, the result of this Query will return not just one value. The result won't be interesting.*/
	/*This is why I add herebelow on extra entry to relate professor Jordan and student David in Css to have at least a second relation between a student and a same professor*/
/*INSERT INTO courses(courses_name, courses_students_id, courses_grades_id, courses_professors_id)
VALUES ("Css", 4, 5, 2);*/
SELECT students_name AS 'Students', professors_name AS 'Professors', COUNT(distinct courses_id) AS 'Common'
FROM courses c
JOIN students s
ON s.students_id = c.courses_students_id
JOIN professors p
ON p.professors_id = c.courses_professors_id
GROUP BY Students, Professors
ORDER BY Common DESC;
/*So, no the result is that student David and Professor Jordan has the max number of courses in common*/


/*OTHER TESTS AND SETUPS DONE*/
SELECT distinct students_name, courses_name
FROM students AS s
INNER JOIN courses c ON s.students_id = c.courses_students_id;

UPDATE students
SET students_name = "Leo"
WHERE students_id = 2;

UPDATE students
SET students_name = "Ian"
WHERE students_id = 3;

SELECT *
FROM students;
SELECT *
FROM grades;
SELECT *
FROM courses;
SELECT *
FROM professors;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM grades;
DELETE FROM professors;
DELETE FROM courses;
DELETE FROM students;

ALTER TABLE grades AUTO_INCREMENT = 1;
ALTER TABLE professors AUTO_INCREMENT = 1;
ALTER TABLE courses AUTO_INCREMENT = 1;
ALTER TABLE students AUTO_INCREMENT = 1;