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

SELECT * FROM Reply;

SELECT r.reply_seq AS replySeq, 
       r.writer_name AS writerName, 
       r.reg_time AS regTime,
       r.reply_content AS replyContent,
       r.movie_seq AS movieSeq,
       m.title AS title
FROM Reply r
JOIN Movie m ON m.movie_seq = r.movie_seq;

SELECT r.reply_seq, r.writer_name, r.reg_time, r.reply_content ,r.movie_seq, m.title
FROM Reply r 
JOIN Movie m ON m.movie_seq = r.movie_seq
WHERE r.reply_seq = '1';



INSERT INTO Reply(writer_name,reg_time,reply_content,movie_seq)
VALUES ('hong', SYSDATE(), NULL, 10);

UPDATE Reply SET writer_name ='kim' , reply_content = NULL
WHERE writer_name = 'hong';



SELECT * FROM Reply WHERE reply_seq = '2';

DROP TABLE Reply CASCADE;

INSERT INTO Reply(writer_name, reg_time, reply_content, movie_seq)
VALUES ('김희태', SYSDATE(), '1232131', 10);