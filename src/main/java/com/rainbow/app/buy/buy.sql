create table Buy(
	buy_seq int PRIMARY KEY AUTO_INCREMENT,
	buy_date datetime NOT NULL,
	member_seq int not null, 
	vod_name varchar(200) not null

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table Buy;
	select * from Buy;
	constraint fk_Buy1 foreign key(member_id)
	REFERENCES  Member(id),
	constraint fk_Buy2 foreign key(vod_name)
	REFERENCES  Vod(vod_name)
ALTER TABLE Buy
ADD FOREIGN KEY (member_seq)
REFERENCES Member(member_seq) 

ALTER TABLE Buy
ADD FOREIGN KEY (vod_name)
REFERENCES Vod(vod_name) 

SELECT * FROM Vod;
select * from Member;
update Member set cash = 10000000 where id = 'kim';
truncate table Buy;
insert into Buy(buy_date,member_seq,vod_name)
values(now(),1,'갓 블레스 아메리카 : God Bless America, 2011');
select * from Buy;
select * from Buy where member_seq = 1;

select vod_image, vod_name a, vod_date, vod_price
from Vod left join Buy b
on  Vod.vod_name = b.vod_name;

select * from Member;
SELECT *
FROM Buy
LEFT JOIN Vod
ON Vod.vod_name = Buy.vod_name;

SELECT * FROM Vod;
select vod_url from Vod  ;

truncate table Buy;

SELECT * FROM Movie;