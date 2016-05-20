---------------------------------------
-- 완성된 구매테이블
CREATE TABLE Purchase( 
	purchase_seq INT PRIMARY KEY AUTO_INCREMENT,
	member_id VARCHAR(20),
	movie_title VARCHAR(70),
	begin_time VARCHAR(30),
	screen_number VARCHAR(10),
	reserve_seat VARCHAR(50),
	purchase_price INT,
	purchase_time VARCHAR(30),
	adult_count INT,
	student_count INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
----------------------------------------

----------------------------------------------
-- 외래키 추가
ALTER TABLE RainbowPurchase
ADD FOREIGN KEY (member_seq)
REFERENCES RainbowMember(member_seq) ON DELETE CASCADE;

ALTER TABLE RainbowPurchase
ADD FOREIGN KEY(movie_seq) 
REFERENCES RainbowMovie(movie_seq) ON DELETE CASCADE;
-----------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Purchase (member_id, movie_title, screen_number, begin_time, reserve_seat, purchase_price, purchase_time) 
VALUES ('kim', '아이언맨3', '1관', '09:40', 'A2', 8000, '05/02/2016');
INSERT INTO Purchase (member_id, movie_title, screen_number, begin_time, reserve_seat, purchase_price, date) 
VALUES ('test', '아이언맨3', '1관', '15:45', 'C10', 8000, '05/02/2016');
INSERT INTO Purchase (member_id, movie_title, screen_number, begin_time, reserve_seat, purchase_price, date) 
VALUES ('test', '헬보이', '1관', '09:40', 'E7', 9000, '05/03/2016');
INSERT INTO Purchase (member_id, movie_title, screen_number, begin_time, reserve_seat, purchase_price, date) 
VALUES ('test', '해리포터5', '1관', '09:40', 'A10', 8000, '05/02/2016');
INSERT INTO Purchase (member_id, movie_title, screen_number, begin_time, reserve_seat, purchase_price, purchase_time) 
VALUES ('test', '아이언맨3', '1관', '09:40', 'A5', 8000, '05/02/2016');
INSERT INTO Purchase (member_id, movie_title, screen_number, begin_time, reserve_seat, purchase_price, purchase_time) 
VALUES ('test2', '아이언맨3', '1관', '09:40', 'A9', 8000, '05/02/2016');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------
-- Purchase 테이블의 모든 내용 검색
SELECT * FROM Purchase;
-------------------------
delete from Purchase;
---------------------------
-- Purchase 테이블 삭제하기
DROP TABLE Purchase CASCADE;
---------------------------
UPDATE Purchase
		SET movie_title = '트랜스포머', screen_number='2관' where purchase_seq = 4;
		
SELECT member_id AS memberId, movie_title AS movieTitle, screen_number AS screenNumber, begin_time AS beginTime,
	   		reserve_seat AS reserveSeat, purchase_price AS purchasePrice, date, adult_count AS adultCount, student_count AS studentCount, image
	    FROM Purchase, Movie WHERE Purchase.movie_title = Movie.title and member_id = 'test' order by date desc;