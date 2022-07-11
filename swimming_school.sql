USE Project;
CREATE TABLE students(
	student_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	group_id VARCHAR(10),
	poolpass_id INT
);

ALTER TABLE students ADD CONSTRAINT students_pk PRIMARY KEY ( student_id );
ALTER TABLE instructors ADD CONSTRAINT instructors_pk PRIMARY KEY ( instructor_id );
ALTER TABLE groups ADD CONSTRAINT groups_pk PRIMARY KEY ( group_id );
ALTER TABLE pool_passes ADD CONSTRAINT pool_passes_pk PRIMARY KEY ( poolpass_id );
ALTER TABLE grades ADD CONSTRAINT grades_pk PRIMARY KEY ( grade_id );
ALTER TABLE individual_classes ADD CONSTRAINT individual_classes_pk PRIMARY KEY ( individualclass_id );
ALTER TABLE fees ADD CONSTRAINT fees_pk PRIMARY KEY ( fee_id );

CREATE TABLE instructors(
	instructor_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary INT
);


CREATE TABLE groups(
	group_id VARCHAR(10) NOT NULL,
	group_type VARCHAR(50) NOT NULL,
	class_day VARCHAR(20) NOT NULL,
	class_time TIME NOT NULL,
	instructor_id INT
);


CREATE TABLE pool_passes(
	poolpass_id INT NOT NULL,
	[expiry_date] DATE NOT NULL,
	is_paid VARCHAR(3) NOT NULL
);	

ALTER TABLE pool_passes
ALTER COLUMN is_paid VARCHAR(5) NOT NULL;

CREATE TABLE grades(
	grade_id INT NOT NULL,
	instructor_id INT NOT NULL,
	grade INT NOT NULL
);	

ALTER TABLE grades
ALTER COLUMN grade FLOAT;


CREATE TABLE individual_classes(
	individualclass_id INT NOT NULL,
	class_date DATETIME NOT NULL,
	instructor_id INT NOT NULL,
	student_id INT NOT NULL
);	

CREATE TABLE fees(
	fee_id INT NOT NULL,
	individualclass_id INT NOT NULL,
	is_paid VARCHAR(5) NOT NULL
);	



ALTER TABLE students ADD CONSTRAINT fk_student_poolpass FOREIGN KEY ( poolpass_id )
REFERENCES pool_passes ( poolpass_id );

ALTER TABLE students ADD FOREIGN KEY ( group_id )
REFERENCES groups ( group_id );

ALTER TABLE groups ADD FOREIGN KEY ( instructor_id )
REFERENCES instructors ( instructor_id );

ALTER TABLE grades ADD FOREIGN KEY ( instructor_id )
REFERENCES instructors ( instructor_id );

ALTER TABLE individual_classes ADD FOREIGN KEY ( instructor_id )
REFERENCES instructors ( instructor_id );

ALTER TABLE individual_classes ADD FOREIGN KEY ( student_id )
REFERENCES students ( student_id );

ALTER TABLE fees ADD FOREIGN KEY ( individualclass_id )
REFERENCES individual_classes ( individualclass_id );

INSERT INTO instructors (instructor_id, first_name, last_name, salary)
VALUES 
(100, 'John', 'Smith', 2000);

INSERT INTO instructors (instructor_id, first_name, last_name, salary)
VALUES 
(101, 'Sofia', 'Jones', 2500),
(102, 'Mark', 'White', 2000),
(103, 'Steven', 'King', 2000),
(104, 'David', 'Austin', 1800),
(105, 'Nancy', 'Greenberg', 2000),
(106, 'Louis', 'Popp', 2200),
(107, 'Karren', 'Nayer', 2000);

INSERT INTO grades (grade_id, instructor_id, grade)
VALUES 
(10, 100, 4),
(11, 104, 2),
(12, 106, 5),
(13, 107, 5),
(14, 107, 4);


INSERT INTO groups (group_id, group_type, class_day, class_time, instructor_id)
VALUES 
('B10', 'beginners', 'Wednesday', '12:00', 100),
('B11', 'beginners', 'Wednesday', '15:00', 100),
('I10', 'intermediate', 'Monday', '12:00', 100),

('A10', 'advanced', 'Monday', '11:00', 101),
('A11', 'advanced', 'Monday', '13:00', 101),
('A12', 'advanced', 'Monday', '15:00', 101),
('A13', 'advanced', 'Friday', '10:00', 101),
('A14', 'advanced', 'Friday', '17:00', 101),

('B12', 'beginner', 'Tuesday', '10:00', 102),
('I11', 'intermediate', 'Thursday', '10:00', 102),
('I12', 'intermediate', 'Friday', '10:00', 102),

('B13', 'beginner', 'Tuesday', '12:00', 103),
('I13', 'intermediate', 'Tuesday', '15:00', 103),
('A15', 'advanced', 'Tuesday', '18:00', 103),

('B14', 'beginner', 'Thursday', '10:00', 104),
('B15', 'beginner', 'Friday', '14:00', 104),

('B16', 'beginner', 'Monday', '18:00', 105),
('I14', 'intermediate', 'Wednesday', '12:00', 105),
('A16', 'advanced', 'Tuesday', '16:00', 105),

('I15', 'intermediate', 'Monday', '15:00', 106),
('I16', 'intermediate', 'Friday', '10:00', 106),
('A17', 'advanced', 'Friday', '17:00', 106),

('B17', 'beginner', 'Friday', '19:00', 107),
('I17', 'intermediate', 'Friday', '16:00', 107);


INSERT INTO pool_passes(poolpass_id, [expiry_date], is_paid)
VALUES 
(200, '2022-06-12', 'TRUE');

INSERT INTO pool_passes(poolpass_id, [expiry_date], is_paid)
VALUES 
(201, '2022-06-12', 'TRUE'), 
(202, '2022-06-18', 'FALSE'),
(203, '2022-06-20', 'TRUE'),
(204, '2022-05-12', 'TRUE'),
(205, '2022-04-10', 'TRUE'),
(206, '2022-06-01', 'TRUE'),
(207, '2022-05-13', 'TRUE'),
(208, '2022-05-11', 'TRUE'),
(209, '2022-05-28', 'TRUE'),
(210, '2022-06-13', 'FALSE'),
(211, '2022-06-02', 'TRUE'),
(212, '2022-06-05', 'FALSE'),
(213, '2022-05-30', 'TRUE'),
(214, '2022-06-13', 'TRUE'),
(215, '2022-06-13', 'TRUE'),
(216, '2022-06-18', 'TRUE'),
(217, '2022-06-17', 'TRUE'),
(218, '2022-05-12', 'TRUE'),
(219, '2022-05-30', 'TRUE'),
(220, '2022-05-30', 'TRUE'),
(221, '2022-06-12', 'TRUE'),
(222, '2022-06-30', 'TRUE'),
(223, '2022-02-12', 'TRUE'),
(224, '2022-01-18', 'TRUE'),
(225, '2022-04-11', 'TRUE'),
(226, '2021-06-12', 'TRUE'),
(227, '2021-06-19', 'TRUE'),
(228, '2022-03-21', 'TRUE'),
(229, '2021-12-12', 'TRUE'),
(230, '2022-06-12', 'TRUE'),
(231, '2022-06-11', 'FALSE'),
(232, '2022-06-12', 'TRUE'),
(233, '2022-06-12', 'TRUE'),
(234, '2021-06-12', 'TRUE'),
(235, '2022-06-12', 'TRUE'),
(236, '2022-05-12', 'TRUE'),
(237, '2022-05-13', 'TRUE'),
(238, '2022-05-11', 'TRUE'),
(239, '2022-05-29', 'TRUE'),
(240, '2022-05-29', 'TRUE'),
(241, '2022-06-19', 'TRUE'),
(242, '2022-06-17', 'TRUE'),
(243, '2022-06-14', 'TRUE'),
(244, '2022-05-14', 'TRUE'),
(245, '2022-01-12', 'TRUE'),
(246, '2022-04-12', 'TRUE'),
(247, '2022-06-12', 'TRUE'),
(248, '2021-06-12', 'TRUE'),
(249, '2022-06-12', 'TRUE'),
(250, '2022-06-28', 'TRUE'),
(251, '2022-06-12', 'TRUE'),
(252, '2022-02-20', 'TRUE'),
(253, '2022-06-12', 'TRUE'),
(254, '2022-06-30', 'TRUE'),
(255, '2022-06-29', 'TRUE'),
(256, '2022-06-30', 'TRUE'),
(257, '2022-06-12', 'TRUE'),
(258, '2022-06-12', 'TRUE'),
(259, '2022-06-12', 'TRUE'),
(260, '2022-06-18', 'TRUE'),
(261, '2022-06-14', 'FALSE'),
(262, '2022-06-11', 'TRUE'),
(263, '2022-06-14', 'TRUE'),
(264, '2022-06-17', 'TRUE'),
(265, '2022-05-30', 'TRUE'),
(266, '2022-05-29', 'TRUE'),
(267, '2022-05-28', 'TRUE'),
(268, '2022-06-12', 'TRUE'),
(269, '2022-05-28', 'TRUE'),
(270, '2022-05-22', 'TRUE'),
(271, '2022-05-24', 'TRUE'),
(272, '2022-05-29', 'TRUE'),
(273, '2022-06-12', 'TRUE'),
(274, '2022-06-12', 'TRUE'),
(275, '2022-06-12', 'TRUE'),
(276, '2022-06-12', 'FALSE'),
(277, '2022-06-20', 'TRUE'),
(278, '2022-06-21', 'TRUE'),
(279, '2022-06-17', 'TRUE');

INSERT INTO students (student_id, first_name, last_name, group_id, poolpass_id)
VALUES 
(1000, 'John', 'Cena', 'A17',200);

INSERT INTO students (student_id, first_name, last_name, group_id, poolpass_id)
VALUES 
(1001, 'Lex', 'Haan', 'B10',201),
(1002, 'Alexander', 'Hunold', 'B10',202),
(1003, 'Bruce', 'Ernst', 'B11',203),
(1004, 'Valli', 'Pataballa', 'B11', 206),
(1005, '2022-04-10', 'TRUE', 'B12',209),
(1006, 'Diana', 'Lorentz', 'B12',210),
(1007, 'Daniel', 'Faviet', 'B13',211),
(1008, 'John', 'Chen', 'B13',212),
(1009, 'Ismael', 'Sciarra', 'B13',213),
(1010, 'Den', 'Raphaely', 'B13',214),
(1011, 'Alexander', 'Khoo', 'B13',215),
(1012, 'Shelli' ,'Baida', 'B14',216),
(1013, 'Sigal', 'Tobias', 'B14',217),
(1014, 'Guy', 'Himuro', 'B15',219),
(1015, 'Matthew', 'Weiss', 'B15',220),
(1016, 'Adam', 'Fripp', 'B16',221),
(1017, 'Payam', 'Kaufling', 'B16',222),
(1018, 'Shanta', 'Vollman', 'B17',226),
(1019, 'Kevin', 'Mourgos', 'I10',227),
(1020, 'Irene', 'Mikkilineni', 'I10',230),
(1021, 'James', 'Landry', 'I11',231),
(1022, 'Steven', 'Markle', 'I11',232),
(1023, 'Laura', 'Bissot', 'I11',233),
(1024, 'Mozhe', 'Atkinson', 'I12',234),
(1025, 'James', 'Marlow', 'I12',235),
(1026, 'TJ', 'Olson', 'I13',239),
(1027, 'Jason', 'Mallin', 'I13',240),
(1028, 'Michael', 'Rogers', 'I14',241),
(1029, 'Ki', 'Gee', 'I14',242),
(1030, 'Hazel', 'Philtanker', 'I15',243),
(1031, 'Renske', 'Ladwig', 'I15',247),
(1032, 'Stephen', 'Stiles', 'I16',248),
(1033, 'John', 'Seo', 'I16',249),
(1034, 'Joshua', 'Patel', 'I17',250),
(1035, 'Trenna', 'Rajs', 'I17',251),
(1036, 'Curtis', 'Davies', 'I17',253),
(1037, 'Randall', 'Matos', 'A10',254),
(1038, 'Peter', 'Vargas', 'A10',255),
(1039, 'John', 'Russell', 'A10',256),
(1040, 'Karen', 'Partners', 'A11',257),
(1041, 'Alberto', 'Errazuriz', 'A11',258),
(1042, 'Gerald', 'Cambrault', 'A11',259),
(1043, 'Eleni', 'Zlotkey', 'A12',260),
(1044, 'Elena', 'Klotkey', 'A12',261),
(1045, 'Elleni', 'Oldkey', 'A13',262),
(1046, 'Geraldos', 'Kambrault', 'A13',263),
(1047, 'Gera', 'Cambr', 'A14',264),
(1048, 'Gerd', 'Ambrault', 'A14',265),
(1049, 'Albert', 'Errazuri', 'A15',266),
(1050, 'Al', 'Errazu', 'A15',267),
(1051, 'Berto', 'Err', 'A16',268),
(1052, 'Karren', 'Arters', 'A16',269),
(1053, 'Caren', 'Part', 'A17',270),
(1054, 'Kare', 'Parrs', 'A17',271),
(1055, 'Johny', 'Russee', 'A17',272),
(1056, 'Jo', 'Russ', 'B10',273),
(1057, 'Jon', 'See', 'B10',274),
(1058, 'Pete', 'Cargas', 'B11',275),
(1059, 'Pepper', 'Vegas', 'I10',276),
(1060, 'Peter', 'Gas', 'I10',277),
(1061, 'Rand', 'Mate', 'I12',278),
(1062, 'Randal', 'Mato', 'I12',279),
(1063, 'Ra', 'Matose', NULL,252),
(1064, 'Curt', 'Davi', NULL,246),
(1065, 'Kurtis', 'David', NULL,245),
(1066, 'Curr', 'Daviee', NULL,244),
(1067, 'Vienna', 'Rajs',  NULL,238),
(1068, 'Tren', 'Ray',  NULL,237),
(1069, 'Tree', 'Ras',  NULL,236),
(1070, 'Josh', 'Pateln', NULL,229),
(1071, 'Jose', 'Atel', NULL,228),
(1072, 'Johua', 'Matel', NULL,225),
(1073, 'Johny', 'Ceo', NULL,224),
(1074, 'Jo', 'Seeo',  NULL,223),
(1075, 'Johnny', 'Peo', NULL,218),
(1076, 'Steph', 'Piles', NULL,208),
(1077, 'Stepheny', 'Tiles', NULL,207),
(1078, 'Step', 'Miles', NULL,205),
(1079, 'Ladwig', 'Renske', NULL,204);


INSERT INTO individual_classes(individualclass_id, class_date, instructor_id, student_id)
VALUES 
(500, '2022-05-27 13:00:00', 100, 1001),
(501, '2022-05-11 13:00:00', 101, 1006),
(502, '2022-05-30 11:00:00', 101, 1005);

INSERT INTO fees(fee_id, individualclass_id, is_paid)
VALUES 
(1500, 500, 'TRUE'),
(1501, 501, 'TRUE'),
(1502, 502, 'FALSE');

--przypadki u¿ycia
--1. kursant przedluza waznosc karnetu 

UPDATE pool_passes
SET [expiry_date] = '2022-05-30'
WHERE poolpass_id = 205;
select * from pool_passes;


UPDATE pool_passes
SET expiry_date = dateadd(month,1, [expiry_date])
WHERE poolpass_id = 205;


Select * from pool_passes;

--2. kursant mo¿e zmieniæ poziom grupy(tzn. zapisaæ siê do innej)
UPDATE students
SET group_id = 'A10'
WHERE student_id = 1016;

Select * from students;

--3. Kursant przegl¹da dostêpnych instruktorów i sortuje ich wed³ug œredniej ocen
SELECT instructors.first_name, instructors.last_name, AVG(grades.grade) as avg_grade FROM instructors
LEFT OUTER JOIN grades ON instructors.instructor_id = grades.instructor_id 
GROUP BY instructors.first_name, instructors.last_name
ORDER BY AVG(grade) DESC;

--4. Kursant ocenia instruktora
INSERT INTO grades (grade_id, instructor_id, grade)
VALUES 
(15, 104, 1)

--5. Kursant zapisuje sie na dodatkowe indywidualne zajecia
INSERT INTO individual_classes(individualclass_id, class_date, instructor_id, student_id)
VALUES 
(503, '2022-05-26 17:00:00', 102, 1062);

INSERT INTO individual_classes(individualclass_id, class_date, instructor_id, student_id)
VALUES 
(504, '2022-05-25 17:00:00', 102, 1062)

SELECT * FROM individual_classes;

--6. Kursant generuje ile powinien zaplacic za indywidualne zajecia (przyjmujemy, ze kazda dodatkowa lekcja to 100 zl)
--to dla wszystkich zapisanych na dodatkowe zajecia
SELECT student_id, count(individualclass_id)*100 AS [sum] FROM individual_classes
GROUP BY student_id;

--6. Kursant generuje ile powinien zaplacic za indywidualne zajecia
SELECT student_id, count(individualclass_id)*100 AS [sum] FROM individual_classes
WHERE student_id = 1006
GROUP BY student_id;

--7. Trener sprawdza swój grafik
--SELECT groups.instructor_id, groups.class_day, groups.class_time, individual_classes.class_date as individual_class FROM groups
--FULL OUTER JOIN individual_classes ON groups.instructor_id = individual_classes.instructor_id;

--7. Trener sprawdza swój grafik
SELECT instructor_id, CONCAT (' group class ', class_day, ' ',CAST(class_time AS varchar)) AS classes FROM groups
WHERE instructor_id = 102
UNION
SELECT instructor_id, CONCAT(' individual class', CAST(class_date AS varchar)) FROM individual_classes
WHERE instructor_id = 102;

SELECT * FROM groups;
SELECT * FROM individual_classes;

--8. Trener sprawdza ile osob zapisalo sie do jego grup
--to dla wszystkich 
SELECT instructors.instructor_id, students.group_id, COUNT(students.student_id) AS [number of students] FROM students
INNER JOIN groups ON groups.group_id = students.group_id
INNER JOIN instructors ON instructors.instructor_id = groups.instructor_id
GROUP BY students.group_id, instructors.instructor_id;

--dla konkretnego trenera

--8. Trener sprawdza ile osob zapisalo sie do jego grup
SELECT instructors.instructor_id, students.group_id, COUNT(students.student_id) AS [number of students] FROM students
INNER JOIN groups ON groups.group_id = students.group_id
INNER JOIN instructors ON instructors.instructor_id = groups.instructor_id
WHERE instructors.instructor_id = 102
GROUP BY students.group_id, instructors.instructor_id;

SELECT * FROM GROUPS;
SELECT * FROM STUDENTS;
SELECT * FROM instructors;

--9. Trener sprawdza jakie ma oceny
SELECT instructor_id, grade FROM grades
WHERE instructor_id = 107;

--10. Recepcjonista usuwa kursanta
DELETE FROM students
WHERE student_id = 1079;
SELECT * FROM students;

--11. Recepcjonista dodaje nowego instruktora
INSERT INTO instructors (instructor_id, first_name, last_name, salary)
VALUES 
(108, 'Georgia', 'Hones', 2500)
SELECT * FROM instructors;

--12. Recepcjonista przegl¹da kto i do jakiej grupy jest zapisany
SELECT first_name, last_name, group_id FROM students
WHERE group_id IS NOT NULL
ORDER BY group_id DESC;

--1. Kusrant lub recepcjonista przedluza karnet oraz sprawdza waznosc
UPDATE pool_passes
SET expiry_date = dateadd(month,1, [expiry_date])
WHERE poolpass_id = 244;

SELECT students.student_id, students.first_name, students.last_name, pool_passes.[expiry_date] FROM students
INNER JOIN pool_passes ON pool_passes.poolpass_id = students.poolpass_id
WHERE pool_passes.poolpass_id = 244;

Select * from pool_passes;
SELECT * FROM STUDENTS;

--13. Recepcjonista sprawdza czy indywidualna lekcja zostala zaplacona na czas
SELECT individual_classes.student_id, individual_classes.individualclass_id, fees.is_paid FROM individual_classes
INNER JOIN fees ON individual_classes.individualclass_id = fees.individualclass_id;

SELECT * FROM individual_classes;
SELECT * FROM FEES

--14. Recepcjonista generuje przychody poszczegolnych trenerow (zakladamy, ze za kazda indywidualna lekcje otrzymuje 30 zl)
SELECT instructors.first_name, instructors.last_name, instructors.salary + COUNT(individual_classes.individualclass_id)*30 AS summary
FROM instructors
FULL OUTER JOIN individual_classes ON instructors.instructor_id = individual_classes.instructor_id
GROUP BY first_name, last_name, salary;
SELECT * FROM instructors
SELECT * FROM individual_classes;