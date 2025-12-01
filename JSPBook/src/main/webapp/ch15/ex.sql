CREATE TABLE IF NOT EXISTS Student(
    num INT NOT NULL,        -- 학번
    depart VARCHAR(20),      -- 학과
    name VARCHAR(30),        -- 이름
    address VARCHAR(50),     -- 주소
    phone VARCHAR(20),       -- 전화번호
    PRIMARY KEY (num)
);

desc Student;

INSERT INTO Student (num, depart, name, address, phone) VALUES
(202310001, '모바일과', '홍길순', '서울시',  '010-9002-1234'),
(202310002, '모바일과', '홍길동', '경기도', '010-2009-4321'),
(202320001, '영어과',   '수여인', '인천시', '010-3918-0007'),
(202320002, '영어과',   '김다윤', '서울시', '010-3002-0101');

SELECT *
FROM Student
ORDER BY num;

SELECT *
FROM Student
WHERE depart = '모바일과'
ORDER BY num;

UPDATE Student
SET depart = '컴퓨터과'
WHERE depart = '모바일과';

SELECT *
FROM Student
ORDER BY num;

DELETE FROM Student
WHERE depart = '영어과';

SELECT *
FROM Student
ORDER BY num;



