show databases;

show tables;

DROP TABLE IF EXISTS member;

CREATE TABLE member (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    passwd VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

desc member;

ALTER TABLE Member ADD phone VARCHAR(100);

ALTER TABLE Member drop phone;

ALTER TABLE Member CHANGE COLUMN passwd password VARCHAR(60);

rename table Member to Student;


select * from Student;