USE BookMarketDB;

CREATE TABLE IF NOT EXISTS book(
    b_id VARCHAR(10) NOT NULL,
    b_name VARCHAR(20),
    b_unitPrice INTEGER,
    b_author VARCHAR(20),
    b_description TEXT,
    b_publisher VARCHAR(20),
    b_category VARCHAR(20),
    b_unitsInStock LONG,
    b_releaseDate VARCHAR(20),
    b_condition VARCHAR(20),
    b_fileName VARCHAR(20),
    PRIMARY KEY (b_id)
) DEFAULT CHARSET=utf8;

DESC book;

SHOW DATABASES;

SHOW TABLES;


DESC book;
DESC member;
DESC library;
DESC demo_use;


TRUNCATE TABLE demo_use;
SELECT * FROM demo_use

ALTER TABLE member
ADD COLUMN role VARCHAR(10) NOT NULL DEFAULT 'USER';

INSERT INTO member (m_id, m_password, m_name, role)
VALUES ('root', 'root1234', '관리자', 'ADMIN');



