--1
SELECT *
FROM student
WHERE grade = 1 AND hometown = '東京'
ORDER BY student_id ASC;

--2
SELECT *
FROM student
WHERE grade = 1
OR student_name LIKE '%本'
ORDER BY student_id DESC;

--3
SELECT major_id, max(grade)
FROM student
GROUP BY major_id
ORDER BY major_id;

--4
SELECT hometown, count(*)
FROM student
GROUP BY hometown
HAVING count(*) > 1
ORDER BY hometown;

--5
SELECT s.student_name, m.major_name
FROM student s
JOIN major m
ON s.major_id = m.major_id
ORDER BY major_name, student_name ASC;

--6
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student s
JOIN major m
ON s.major_id = m.major_id
WHERE s.hometown != '東京'
ORDER BY major_name, student_id ASC;

--7
SELECT student_id, student_name, grade
FROM student
WHERE major_id = (SELECT major_id
                    FROM major
                    WHERE major_name = '英文学');

--8
SELECT student_id, student_name, major_id
FROM student
WHERE major_id 
IN (SELECT major_id
    FROM student
    GROUP BY major_id
    HAVING count(*) > 2)
ORDER BY major_id, student_id ASC;