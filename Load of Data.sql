USE devcamp_sql_project;

INSERT INTO students(students_name)
VALUES 
	("Kristine"),
    ("Jordan"),
    ("Joaquín"),
    ("David"),
    ("Laia"),
    ("Pau"),
    ("Sandra"),
    ("Marcos");

SELECT * from students;

INSERT INTO courses(courses_name, courses_students_id, courses_grades_id, courses_professors_id)
VALUES 
	("Python", 1, 8, 5), 
	("Python", 3, 9, 5),
	("Python", 5, 10, 5),
    ("Python", 6, 8, 5),
    ("React", 7, 9, 4),
    ("React", 4, 4, 4),
    ("React", 8, 3, 4),
    ("React", 2, 5, 4),
    ("React", 6, 10, 4),
    ("React", 1, 7, 4),
    ("Css", 3, 5, 3),
    ("Css", 5, 5, 3),
    ("Css", 2, 8, 3),
    ("Css", 8, 10, 3),
    ("Css", 4, 5, 3),
    ("HTML", 7, 7, 2),
    ("HTML", 3, 6, 2),
    ("HTML", 6, 7, 2),
    ("HTML", 4, 6, 2),
    ("Kotlin", 1, 4, 1),
    ("Kotlin", 2, 6, 1),
    ("Kotlin", 6, 8, 1),
    ("Kotlin", 8, 10, 1);

SELECT * from courses;

INSERT INTO grades(grades_score)
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

SELECT * from grades;

INSERT INTO professors(professors_name)
VALUES ("John"), ("Jordan"), ("Michelle"), ("Nathaniel"), ("Mark");

SELECT * from professors;

/*DISABLING ONLY GROUP BY Source: https://stackoverflow.com/questions/23921117/disable-only-full-group-by*/
SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));