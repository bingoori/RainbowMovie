---------------------------------------
-- 완성된 영화테이블
CREATE TABLE Movie( 
	movie_seq INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(70),
	rating INT,
	genre VARCHAR(20),
	open_date VARCHAR(30),
	grade VARCHAR(10),
	runningtime VARCHAR(20),
	director VARCHAR(20),
	actor VARCHAR(70),
	content TEXT,
	image VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
----------------------------------------

-------------------------
-- Movie 테이블의 모든 내용 검색
SELECT * FROM Movie;
-------------------------

---------------------------
-- Movie 테이블 삭제하기
DROP TABLE Movie CASCADE;
---------------------------


--List
select movie_seq, rating, title, genre, open_date, grade, runningtime,director,actor,content,image 
from Movie
WHERE movie_seq = 1;
--제목으로 검색
select movie_seq, rating, title, genre, open_date, grade, runningtime,director,actor,content,image 
from Movie
WHERE title = '';
--
select movie_seq, rating, title, genre, open_date, grade, runningtime,director,actor,content,image 
from Movie
WHERE movie_seq = 1;
--인설트
INSERT INTO Movie(rating, title, genre, open_date, grade, runningtime,director,actor,content,image)
VALUES( null, '배트맨 대 슈퍼맨: 저스티스의 시작','액션', '2016-03-24', '12세 관람가 ', '151분', '잭 스나이더 ', '헨리 카빌', '슈퍼맨과 조드 장군의 격렬한 전투 이후 메트로폴리스는 파괴되었고... ', 'bantmanVsuperman.jpg');
--업데이트
UPDATE Movie SET rating= 6, title='시간이탈자', genre='스릴러', open_date='2016-04-13', grade='15세 관람가', runningtime='107분',director='곽재용',actor='임수정',content='서로 다른 시대, 하나의 살인사건',image='Time_Renegades.jpg'
WHERE movie_seq = 6;

--카운트
SELECT COUNT(*)
FROM Movie;
--삭제
DELETE FROM Movie
WHERE movie_seq= #{movie_seq};

-----------------------------
INSERT INTO Movie(title, rating, genre, open_date, grade, runningtime, director, actor, content, image)
VALUES('캡틴아메리카2', null, '액션', '2016-02-17', '12세', '147분', '하워드', '지니퍼', '룰루랄라', 'captain_america_2.jpg');
INSERT INTO Movie(title, rating, genre, open_date, grade, runningtime, director, actor, content, image)
VALUES('해리포터5', null, '판타지', '2016-03-15', '12세', '180분', '롤링', '엠마왓슨', '너무이뻐요yes', 'harry_potter_5.jpg');


------------------------------------------------------- FINAL


DROP TABLE IF EXISTS `Movie`;
CREATE TABLE `Movie` (
  `movie_seq` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  `open_date` varchar(30) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `runningtime` varchar(20) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `actor` varchar(70) DEFAULT NULL,
  `content` text,
  `image` varchar(50) DEFAULT NULL,
  `screen` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`movie_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

#
# Data for table "Movie"
#

INSERT INTO `Movie` VALUES (1,'베트맨VS슈퍼맨',1,'액션,모험,판타지','2016-03-24','12세','151분','잭 스나이더','헨리 카빌, 벤 애플랙, 에이미 아남스','\t\t        \t\t\t        \t슈퍼맨과 조드 장군의 격렬한 전투 이후 메트로폴리스는 파괴되었고 슈퍼맨은 세계 최고 논쟁의 인물이 되어버린다. \r\n 한편 배트맨은 그 동안 타락했던 많은 자들처럼 슈퍼맨 역시 언젠가 타락을 할 것이라 생각하며 사회에서 가장 위험한 존재로 여긴다. \r\n 세계의 미래를 위해 무모하고 제어할 수 없는 힘을 가진 슈퍼맨으로 인해 벌어졌던 일들을 바로 잡으려 하는데…\r\n\t\t        \t\r\n\t\t        \t','Batman_VS_Superman.jpg','1관'),(2,'캡틴아메리카 : 윈터솔져',2,'액션,모험,SF','2014-03-26','15세','136분','조 루소','크리스 에반스, 스칼렛 요한슨','\t\t        \t\t\t        \t\t\t        \t\t\t        \t어벤져스의 뉴욕 사건 이후 닉 퓨리, 블랙 위도우와 함께 \r\n 쉴드의 멤버로 현대 생활에 적응해 살아가는 캡틴 아메리카. \r\n  \r\n 어느 날, 죽은 줄 알았던 친구 버키가 \r\n 적 윈터 솔져가 되어 돌아오고, \r\n 어벤져스를 향한 최악의 위기가 시작된다.\r\n\t\t        \t\r\n\t\t        \t\r\n\t\t        \t\r\n\t\t        \t','CaptainAmerica2.jpg','2관'),(3,'해리포터5',3,'판타지,가족,모험','2007-07-11','전체관람가','137분','데이빗 예이츠','다니엘 래드클리프, 엠마왓슨, 루퍼트 그린트','\t\t        \t\t\t        \t\t\t        \t길고도 지루한 여름 날 호그와트 마법학교 다섯 번째 해를 기다리고 있는 해리포터(다니엘 래드클리프). 이모부 더즐리 식구들과 참고 사는 것도 지겨운데다 친구 론(루퍼트 그린트)과 헤르미온느(엠마 왓슨)에게서는 편지 한 통 오지 않는다. 그러던 중 예상치 못했던 편지 한 장이 도착한다. 그것은 해리가 학교 밖인 리틀 위닝에서 얄미운 사촌 두들리, 즉 머글 앞에서 디멘터들의 공격을 막는 마법을 사용했기 때문에 호그와트 마법학교에서 퇴학 당하게 되었다는 소식이었다. 앞이 캄캄한 해리. 갑자기 어둠의 마법사 오러들이 나타나 해리를 불사조 기사단의 비밀 장소로 데리고 간다.\r\n\t\t        \t\r\n\t\t        \t\r\n\t\t        \t','HarryPotter5.jpg','3관'),(4,'헬보이',4,'SF,액션,모험','2008-09-25','12세','120분','길예르모 델 토로','론 펄먼, 셀마 블레어','\t\t        \t\t\t        \t인간과 요괴 사이에서 존재하던 고대의 휴전 협정이 수 천년이 지난 후, 세상을 지배하려는 요괴 세상의 누아다 왕자에 의해 깨어진다. 누아다 왕자는 세상을 장악하기 위해 파괴를 목적으로 한 기이한 창조물들을 찾고, 수 천년간 잠들어있던 최강의 군단 ‘골든 아미(Golden Army)’ 를 깨운다. 이에 \'헬보이\'는 불을 다스리는 여자 친구 ‘리즈’, 사람의 마음을 읽는 ‘에이브’ 등, 각기 다른 능력을 가진 BPRD 요원들과 함께 누아다 왕자와 골든 아미를 막기 위한 최강의 대결을 시작한다!\r\n\t\t        \t\r\n\t\t        \t','HellBoy2.jpg','4관'),(5,'아이언맨3',5,'액션,SF,모험','2013-04-25','12세','129분','셰인 블랙','로버트 다우니 주니어, 기네스 팰트로','\t\t        \t\t\t        \t\t\t        \t\t\t        \t21세기 가장 매력적인 히어로의 귀환 지금까지의 아이언맨은 잊어라! <어벤져스> 뉴욕 사건의 트라우마로 인해 영웅으로서의 삶에 회의를 느끼는 토니 스타크(로버트 다우니 주니어). 그가 혼란을 겪는 사이 최악의 테러리스트 만다린(벤 킹슬리)을 내세운 익스트리미스 집단 AIM이 스타크 저택에 공격을 퍼붓는다. 이 공격으로 그에게 남은 건 망가진 수트 한벌 뿐. 모든 것을 잃어버린 그는 다시 테러의 위험으로부터 세계와 사랑하는 여인(기네스 팰트로)를 지켜내야 하는 동시에 머릿속을 떠나지 않던 한가지 물음의 해답도 찾아야만 한다. 과연 그가 아이언맨인가? 수트가 아이언맨인가?\r\n\t\t        \t\r\n\t\t        \t\r\n\t\t        \t\r\n\t\t        \t','IronMan3.jpg','5관'),(6,'매트릭스4',6,'SF,스릴러,액션','2003-11-05','15세','128분','앤디 워쇼스키, 래리 워쇼스키','키아누 리브스, 로렌스 피쉬번','\t\t        \t\t\t        \t\t\t        \t2199년, 시스템이 인간을 지배하는 세상. 인간들은 태어나자마자 인공 자궁 안에 갇혀 기계들의 생명 연장을 위한 에너지로 사용되고 뇌세포에 매트릭스라는 프로그램을 입력 당해 평생 기계에 의해 설정된 가상 현실을 살아간다. 가상 현실의 꿈에서 깨어난 인간들은 \'시온\'이라는 세상을 건설하고 인류를 구원할 영웅 \'그\'를 찾아 나선다. 마침내 발견한 \'그\'는 낮에는 평범한 회사원으로 밤에는 \'네오\'라는 이름으로 컴퓨터 해킹을 하는 컴퓨터 프로그래머, 토마스 앤더슨(키아누 리브스). 앤더슨은 트리니티(캐리 앤 모스)라는 여인에게 이끌려 매트릭스 밖의 우주를 만나면서 모든 진실과 직면하게 된다. 숨겨진 진실을 알게 된 앤더슨은 이제 \'네오\'라는 이름으로 인류를 구원해야 하는 자신의 운명을 받아들이게 된다.\r\n\t\t        \t\r\n\t\t        \t\r\n\t\t        \t','Matrix4.jpg','6관'),(7,'셜록홈즈',7,'액션,모험,범죄','2009-12-23','12세','128분','가이 리치','로버트 다우니 주니어, 수드 로','\t\t        \t\t\t        \t세기의 명탐정_“범죄는 흔하다. 그러나 논리는 흔치 않다” 셜록 홈즈(로버트 다우니 주니어), 천재적인 추리 능력과 주먹의 힘까지 갖추고 친구 왓슨 박사(주드 로)와 함께 치밀하게 얽힌 미스터리 속에서 진실을 찾아내는 명탐정. 그에게 이제껏 경험하지 못했던 최대의 위협이자 지금껏 그토록 갈구했던 진정한 모험이 몰려오고 있었다.\r\n\t\t        \t\r\n\t\t        \t','SherlockHolmes.jpg','7관'),(8,'터미네이터3',8,'액션,스릴러,SF','2003-07-25','15세','108분','조나단 모스토우','아놀드 슈왈드 제네거, 닉 스탈','\t\t        \t\t\t        \t10여 년 전 미래로부터 파견된 강력한 T-1000의 살해 위협에서 벗어난 미래의 인류저항군 지도자 \'존 코너\'는 엄마인 \'사라 코너\'가 죽은 뒤 집과 신용카드, 핸드폰, 직업 등 모든 것을 버리고 은둔의 길을 택해 다가올 위협에 준비하며 홀로 살아가고 있었다. 자신에 대한 모든 기록을 지워버리고 사는 것, 그것만이 \'스카이 넷\'이라는 최첨단 네트워크의 추적을 피하기 위한 유일한 방법이었기 때문이다. 기계들의 반란을 이끌어 인류를 멸망시키려 했던 고도로 발달된 기계들의 네트워크 \'스카이 넷\'... 그들의 목표는 미래 인간들의 지도자가 \'존 코너\'가 성장하기 전에 그를 암살해서 기계들이 세상을 지배하는 \'운명의 날\'을 맞이하는 것이었다.\r\n\t\t        \t\r\n\t\t        \t','Terminator3.jpg','8관'),(9,'토르2',9,'액션,모험,판타지','2013-10-30','12세','112분','앨런테일러','크리스 헴스워스, 나탈리 포트만','\t\t        \t\t\t        \t\t\t        \t<어벤져스>의 뉴욕 사건 후, 다시 신들의 고향인 아스가르드 왕국으로 돌아간 토르(크리스 헴스워스)와 로키(톰 히들스턴). 지구를 위협한 로키는 지하 감옥에 갇히고, 토르는 아버지 오딘(안소니 홉킨스)과 함께 우주의 질서를 재정립하기 위해 나선다. 1년 후, 지구에 혼자 남은 제인(나탈리 포트만)은 우연히 태초부터 존재해왔던 어둠의 종족 ‘다크 엘프’의 무기 ‘에테르’를 얻게 된다. 이 사실을 안 ‘다크 엘프’의 리더 ‘말레키스’는 ‘에테르’를 되찾기 위해 제인과 아스가르드를 공격하고, 토르는 사랑하는 여인 제인과 아스가르드 왕국을 지키기 위해 로키에게 위험한 동맹을 제안하게 된다.\t\t        \t\t\t        \t\t\t        \t','Thor2.jpg','9관');

