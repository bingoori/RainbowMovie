--------------------------------------------------
-- 완성된 예약좌석 테이블
CREATE TABLE ReserveSeat( 
	reserve_seq INT PRIMARY KEY AUTO_INCREMENT,
	movie_title VARCHAR(70),
	screen_number VARCHAR(10),
	reserve_date VARCHAR(30),
	begin_time VARCHAR(30),
	seat VARCHAR(70)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
--------------------------------------------------

-------------------------
-- ReserveSeat 테이블의 모든 내용 검색
SELECT * FROM ReserveSeat;
-------------------------

----------------------------------
-- ReserveSeat 테이블 삭제하기
DROP TABLE ReserveSeat CASCADE;
----------------------------------

---------------------------------
SELECT COUNT(*) FROM ReserveSeat
---------------------------------

UPDATE ReserveSeat
		SET seat = ' '
		WHERE movie_title ='헬보이';

INSERT INTO ReserveSeat(movie_title,screen_number,reserve_date,begin_time,seat)
		VALUES ('트랜스포머','2관','05/02/2016','09:40','B5');
		

delete from ReserveSeat;
SELECT
		reserve_seq As reserveSeq,
		movie_title AS movieTitle,
		screen_number AS screenNumber,
		reserve_date AS reserveDate,
		begin_time AS beginTime,
		seat
	FROM ReserveSeat
	WHERE 
		movie_title = '트랜스포머' AND
		reserve_date = '05/02/2016' AND
		begin_time = '09:40' AND id = 'kim';