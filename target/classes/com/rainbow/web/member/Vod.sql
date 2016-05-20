 

create table Vod(
	vod_seq int PRIMARY KEY AUTO_INCREMENT,
	vod_name VARCHAR(200) NOT NULL,
	vod_content_title VARCHAR(300) NULL,
	vod_content VARCHAR(3000) NULL,
	vod_price INT NOT NULL,
	vod_category VARCHAR(50) NOT NULL,
	vod_time INT NOT NULL,
	vod_rating varchar(10) null, 
	vod_url VARCHAR(1000) not null, 
	vod_image VARCHAR(50) not null,
	vod_date datetime not null,
	vod_free VARCHAR(10) default 'n',
	vod_grade VARCHAR(20) null,
	vod_actor VARCHAR(60) null,
	vod_director VARCHAR(100) not null,
	vod_country VARCHAR(100) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
drop table Vod cascade;
	    UPDATE Vod 
	    set 
	    vod_content = '니 내랑 부산 접수할랭???',
	    vod_country = '한쿡인'
	    WHERE vod_name = '친구2';
		
show tables;
drop table RainbowVod;

SELECT * FROM RainbowMovie;
SELECT * FROM Vod;
SELECT * FROM Member;
SELECT * FROM RainbowVod WHERE vod_name = '친구2';

		SELECT 
     	  	id,
       		password,
       		name,
       		gender,
	        birth,
	        addr,
	        email,
	        point,
	        grade
    	FROM RainbowMember 
  		where id = 'bingoori' and password = '1';
  		
  		 SELECT COUNT(*) FROM RainbowVod;
  		 
CREATE TABLE RainbowMember( 
	member_seq INT PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	name VARCHAR(30) NOT NULL,
	gender VARCHAR(10),
	birth VARCHAR(30),
	addr VARCHAR(70),
	point INT,
	grade VARCHAR(10),
	reg_date DATETIME
);

insert into Member(id,password,name,gender,birth,addr,email,addr,point,grade,reg_date) 
values ('bingoori','1','빙구리','여','18840101','인천시','bingoor@.com','Unknown',0,'브론즈',now());  

      SELECT 
       id,
       password,
       name,
       gender,
       birth,
       addr,
       email,
       point,
       grade,
       DATE_FORMAT(reg_date,'%Y-%m-%d %T') AS regDate
       FROM RainbowMember
       WHERE id = 'bingoori' and password = '1';

SELECT *
FROM Vod
delete from Vod where vod_price = 1;
WHERE DATE_FORMAT(now(),'%Y-%m-%d') - DATE_FORMAT(vod_date,'%Y-%m-%d') > 30;  
SELECT DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d'))
FROM Vod;

	SELECT
		vod_name AS vodName,
		vod_content_title AS vodContentTitle,
		vod_content AS vodContent,
		vod_price AS vodPrice,
		vod_category AS vodCategory,
		vod_time AS vodTime,
		vod_rating AS vodRating,
		vod_url AS vodUrl,
		vod_image AS vodImage,
		vod_date AS vodDate,
		vod_free AS vodFree,
		vod_grade AS vodGrade,
		vod_actor AS vodActor,
		vod_director AS vodDirector,
		vod_country AS vodCountry
		FROM Vod
		order by vodName
select DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d'))
from Vod
order by vod_date;
select DATE_FORMAT(vod_date,'%Y-%m-%d') AS a
from Vod
order by vod_date

-- 180일 미만이면 최신 8
SELECT * 
FROM Vod
WHERE DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) <= 180
order by vod_date
limit 9
-- 365일 미만 일반 7
SELECT *
FROM Vod
WHERE DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) < 365 AND DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) > 180
-- 365일 보다 크면 무료 영화 6
SELECT *
FROM Vod
WHERE DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) > 365;
-- 무료 영화 전환
update Vod set vod_free ='y'
WHERE DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) > 365;
		SELECT		
		vod_name AS vodName,
		vod_content_title AS vodContentTitle,
		vod_content AS
		vodContent,
		vod_price AS vodPrice,
		vod_category AS vodCategory,
		vod_time
		AS vodTime,
		vod_rating AS vodRating,
		vod_url AS vodUrl,
		vod_image AS vodImage,
		vod_date AS vodDate,
		vod_free AS vodFree,
		vod_grade AS vodGrade,
		vod_actor AS vodActor,
		vod_director AS vodDirector,
		vod_country AS vodCountry
		FROM Vod
		WHERE DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) <= 365 AND DATEDIFF(NOW(),DATE_FORMAT(vod_date,'%Y-%m-%d')) > 180
select * from Vod where vod_name like '%스%';

truncate table Vod;

SELECT * FROM Vod;
SELECT * FROM Vod
WHERE vod_name ='개구리왕국 : Frog Kingdom, 2013';
SELECT * FROM Member;




갓 블레스 아메리카 : God Bless America, 2011
개구리왕국 : Frog Kingdom, 2013 
겨울왕국 : Frozen, 2013
고스트보트 : Ghostboat, 2014
구스범스 : Goosebumps, 2015
내부자들 : Inside Men, 2015
더 랍스터 : The Lobster, 2015
동경가족 : Tokyo Family, 2013
드래곤 파이터 2015 : Dracano, 2013
런던시계탑 밑에서 사랑을 찾을 확률 : Man Up, 2015
로미오와 줄리엣 : Romeo + Juliet, 1996
버스 657 : Heist, Bus 657, 2015
버크셔 전기톱 살인사건 : Berkshire County, 2014
볼트 : Bolt, 2008
스타워즈 : 깨어난 포스 , Star Wars : The Force Awakens, 2015
스파이 브릿지 : Bridge of Spies, 2015
스파이 서바이버 : Survivor, 2015
연인들 : Die geliebten Schwestern, Beloved Sisters, 2014
<!-- URL 변경되면 http://nuridol.net/ut_convert.html 에서 확인한다 -->

select * from Vod;
update Vod 
set vod_category = 'drama' 
WHERE vod_name ='갓 블레스 아메리카 : God Bless America, 2011';
update Vod 
set vod_category = 'animation' 
WHERE vod_name ='개구리왕국 : Frog Kingdom, 2013';
update Vod 
set vod_category = 'animation' 
WHERE vod_name ='겨울왕국 : Frozen, 2013';
update Vod 
set vod_category = 'thriller' 
WHERE vod_name ='고스트보트 : Ghostboat, 2014';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='구스범스 : Goosebumps, 2015';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='내부자들 : Inside Men, 2015';
update Vod 
set vod_category = 'mellow' 
WHERE vod_name ='더 랍스터 : The Lobster, 2015';
update Vod 
set vod_category = 'drama' 
WHERE vod_name ='동경가족 : Tokyo Family, 2013';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='드래곤 파이터 2015 : Dracano, 2013';
update Vod 
set vod_category = 'comedy' 
WHERE vod_name ='런던시계탑 밑에서 사랑을 찾을 확률 : Man Up, 2015';
update Vod 
set vod_category = 'drama' 
WHERE vod_name ='로미오와 줄리엣 : Romeo + Juliet, 1996';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='버스 657 : Heist, Bus 657, 2015';
update Vod 
set vod_category = 'thriller' 
WHERE vod_name ='버크셔 전기톱 살인사건 : Berkshire County, 2014';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='볼트 : Bolt, 2008';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='스타워즈 : 깨어난 포스 , Star Wars : The Force Awakens, 2015';
update Vod 
set vod_category = 'drama' 
WHERE vod_name ='스파이 브릿지 : Bridge of Spies, 2015';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='스파이 서바이버 : Survivor, 2015';
update Vod 
set vod_category = 'drama' 
WHERE vod_name ='연인들 : Die geliebten Schwestern, Beloved Sisters, 2014';
update Vod 
set vod_category = 'action' 
WHERE vod_name ='친구 : Friend, 2001';


	SELECT
		vod_name AS vodName,
		vod_content_title AS vodContentTitle,
		vod_content AS vodContent,
		vod_price AS vodPrice,
		vod_category AS vodCategory,
		vod_time AS vodTime,
		vod_rating AS vodRating,
		vod_url AS vodUrl,
		vod_image AS vodImage,
		vod_date AS vodDate,
		vod_free AS vodFree,
		vod_grade AS vodGrade,
		vod_actor AS vodActor,
		vod_director AS vodDirector,
		vod_country AS vodCountry
		FROM Vod
		WHERE vod_name like CONCAT('%', 'at', '%')


update Vod 
set vod_url = 'https://www.youtube.com/embed/VJaLrINeZPc' 
WHERE vod_name ='갓 블레스 아메리카 : God Bless America, 2011';
update Vod 
set vod_url = 'https://www.youtube.com/embed/vXNfNRoJ0yU' 
WHERE vod_name ='개구리왕국 : Frog Kingdom, 2013';
update Vod 
set vod_url = 'https://www.youtube.com/embed/Qw9a1AKTsuc' 
WHERE vod_name ='겨울왕국 : Frozen, 2013';
update Vod 
set vod_url = 'https://www.youtube.com/embed/myMNKA_ANWg' 
WHERE vod_name ='고스트보트 : Ghostboat, 2014';
update Vod 
set vod_url = 'https://www.youtube.com/embed/thuFlPtt4zc' 
WHERE vod_name ='구스범스 : Goosebumps, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/UP38GHwWg8I' 
WHERE vod_name ='내부자들 : Inside Men, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/D7ZWl0HCk14' 
WHERE vod_name ='더 랍스터 : The Lobster, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/C7PVxJ944mk' 
WHERE vod_name ='동경가족 : Tokyo Family, 2013';
update Vod 
set vod_url = 'https://www.youtube.com/embed/hD7yzQ-DCXU' 
WHERE vod_name ='드래곤 파이터 2015 : Dracano, 2013';
update Vod 
set vod_url = 'https://www.youtube.com/embed/mMHejG4lPHs' 
WHERE vod_name ='런던시계탑 밑에서 사랑을 찾을 확률 : Man Up, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/4FHpmn-KYec' 
WHERE vod_name ='로미오와 줄리엣 : Romeo + Juliet, 1996';
update Vod 
set vod_url = 'https://www.youtube.com/embed/JS-0GMTDIhY' 
WHERE vod_name ='버스 657 : Heist, Bus 657, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/Zy53IJZ8z8Y' 
WHERE vod_name ='버크셔 전기톱 살인사건 : Berkshire County, 2014';
update Vod 
set vod_url = 'https://www.youtube.com/embed/GgO2HkVGQmw' 
WHERE vod_name ='볼트 : Bolt, 2008';
update Vod 
set vod_url = 'https://www.youtube.com/embed/sGbxmsDFVnE' 
WHERE vod_name ='스타워즈 : 깨어난 포스 , Star Wars : The Force Awakens, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/wRqjFy5nLeA' 
WHERE vod_name ='스파이 브릿지 : Bridge of Spies, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/2caXbRdQU-Y' 
WHERE vod_name ='스파이 서바이버 : Survivor, 2015';
update Vod 
set vod_url = 'https://www.youtube.com/embed/PDVJwzrUxos' 
WHERE vod_name ='연인들 : Die geliebten Schwestern, Beloved Sisters, 2014';
update Vod 
set vod_url = 'https://www.youtube.com/embed/WVMILGfcM8E' 
WHERE vod_name ='친구 : Friend, 2001';


select * from Vod;

update Vod 
set vod_country = '미국' 
WHERE vod_name ='갓 블레스 아메리카 : God Bless America, 2011';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='개구리왕국 : Frog Kingdom, 2013';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='겨울왕국 : Frozen, 2013';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='고스트보트 : Ghostboat, 2014';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='구스범스 : Goosebumps, 2015';
update Vod 
set vod_country = '한국' 
WHERE vod_name ='내부자들 : Inside Men, 2015';
update Vod 
set vod_country = '영국' 
WHERE vod_name ='더 랍스터 : The Lobster, 2015';
update Vod 
set vod_country = '일본' 
WHERE vod_name ='동경가족 : Tokyo Family, 2013';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='드래곤 파이터 2015 : Dracano, 2013';
update Vod 
set vod_country = '영국' 
WHERE vod_name ='런던시계탑 밑에서 사랑을 찾을 확률 : Man Up, 2015';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='로미오와 줄리엣 : Romeo + Juliet, 1996';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='버스 657 : Heist, Bus 657, 2015';
update Vod 
set vod_country = '캐나다' 
WHERE vod_name ='버크셔 전기톱 살인사건 : Berkshire County, 2014';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='볼트 : Bolt, 2008';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='스타워즈 : 깨어난 포스 , Star Wars : The Force Awakens, 2015';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='스파이 브릿지 : Bridge of Spies, 2015';
update Vod 
set vod_country = '미국' 
WHERE vod_name ='스파이 서바이버 : Survivor, 2015';
update Vod 
set vod_country = '독일' 
WHERE vod_name ='연인들 : Die geliebten Schwestern, Beloved Sisters, 2014';
update Vod 
set vod_country = '한국' 
WHERE vod_name ='친구 : Friend, 2001';

SELECT * FROM Vod;
SELECT * FROM Movie;

alter table Movie modify grade varchar(100);

select * from Movie;

갓 블레스 아메리카 : God Bless America, 2011
개구리왕국 : Frog Kingdom, 2013 
겨울왕국 : Frozen, 2013
고스트보트 : Ghostboat, 2014
구스범스 : Goosebumps, 2015
내부자들 : Inside Men, 2015
더 랍스터 : The Lobster, 2015
동경가족 : Tokyo Family, 2013
드래곤 파이터 2015 : Dracano, 2013
런던시계탑 밑에서 사랑을 찾을 확률 : Man Up, 2015
로미오와 줄리엣 : Romeo + Juliet, 1996
버스 657 : Heist, Bus 657, 2015
버크셔 전기톱 살인사건 : Berkshire County, 2014
볼트 : Bolt, 2008
스타워즈 : 깨어난 포스 , Star Wars : The Force Awakens, 2015
스파이 브릿지 : Bridge of Spies, 2015
스파이 서바이버 : Survivor, 2015
연인들 : Die geliebten Schwestern, Beloved Sisters, 2014
		SELECT * 
		FROM Vod
		ORDER BY vod_name
		LIMIT 15,5
		
		delete from Vod where vod_director ='샘 피스쳐';