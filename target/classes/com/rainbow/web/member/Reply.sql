---------------------------------------
-- 완성된 댓글테이블
CREATE TABLE Reply( 
	reply_seq INT PRIMARY KEY AUTO_INCREMENT,
	writer_name VARCHAR(20),
	reg_time DATETIME,
	reply_content TEXT,
	movie_seq INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
----------------------------------------

---------------------------------------------------------
-- 외래키 추가 ==> 하지말자
ALTER TABLE Reply
ADD FOREIGN KEY (member_seq)
REFERENCES Reply(member_seq) ON DELETE CASCADE;
---------------------------------------------------------

-------------------------
-- Reply 테이블의 모든 내용 검색
SELECT * FROM Reply;
-------------------------

---------------------------
-- RainbowReply 테이블 삭제하기
DROP TABLE Reply CASCADE;
---------------------------