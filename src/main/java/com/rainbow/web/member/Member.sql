---------------------------------------
-- 완성된 멤버테이블
CREATE TABLE Member( 
	member_seq INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	name VARCHAR(30) NOT NULL,
	birth VARCHAR(30),
	addr VARCHAR(70),
	email VARCHAR(50),
	point INT,
	grade VARCHAR(10),
	cash int,
	reg_date DATETIME
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
----------------------------------------

-------------------------
-- Member 테이블의 모든 내용 검색
SELECT * FROM Member;
-------------------------
update Member set cash = 10000;
---------------------------
-- Member 테이블 삭제하기 
DROP TABLE Member CASCADE;
---------------------------

INSERT INTO Member (id, password, name) VALUES('admin','1','관리자');
-------------------------------

-------------------------------
DELETE FROM Member WHERE id = 'check2';