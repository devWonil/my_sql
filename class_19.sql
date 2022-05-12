USE SHOPDB;
select * FROM USERTBL;
select * FROM BUYTBL;

DELETE FROM USERTBL WHERE USERNAME = '이승기'; -- 삭제 안됨 (제약조건이 걸려있다)
DELETE FROM BUYTBL WHERE USERNAME = '이승기';


create database movies;

use movies;

select * from 영화정보 order by 영화번호;
select * from 배우정보 order by 배우번호;

drop table movieTbl;
drop table roleTbl;
drop table actorTbl;
drop table costTbl;

create table movieTbl(
    movieNumber int not null primary key,
    movieName varchar(20),
    releasedDate date,
    revenue bigint,
    audience int,
    screen int,
    starRating decimal(4,2)
);
-- 필드 수정, 컬럼 수정

alter table 영화정보 modify 평점 decimal(4,2);
alter table 영화정보 modify 영화번호 int(3);

create table actorTbl(
	actorNumber int not null primary key,
	actor varchar(20),
    birthYear int,
    height decimal(4,1),
    weight decimal(4,1),
    spouse varchar(10)
);
alter table actorTbl change 출연자출생 출생년도 int;
create table roleTbl(
	movieNumber int not null,
    actorNumber int not null,
    role varchar(30),
    roleName varchar(30),
    foreign key (movieNumber) references movieTbl(movieNumber),
    foreign key (actorNumber) references actorTbl(actorNumber)
);

 alter table 출연 modify 영화번호 int(3);
 
 create table costTbl(
	movieNumber int not null primary key,
    productionCost bigint,
    sales bigint,
    revenue bigint,
    ticketPrice int,
    foreign key (movieNumber) references movieTbl(movieNumber)
 );
 
 alter table 영화금액 modify 영화번호 int(3);

 select * from movieTbl;
 select * from actorTbl;
 select * from roleTbl;
 select * from costTbl;
 
 desc 영화정보;
 desc 출연;
 desc 배우정보;
 desc 영화금액;
 
select * from movieTbl;

INSERT INTO movieTbl VALUES (1, '명량', '2014-07-30', 135748398910, 17613682, 1587, 9.79);
INSERT INTO movieTbl VALUES (2, '극한직업', '2019-01-23', 139647979516, 16264944, 1978, 6.79);
INSERT INTO movieTbl VALUES (3, '신과 함께 - 죄와 벌', '2017-12-20', 115698654137, 12319542, 1912, 7.9);
INSERT INTO movieTbl VALUES (4, '국제시장', '2014-12-17', 110913469630, 14257115, 966, 7.60);
INSERT INTO movieTbl VALUES (5, '어벤져스:엔드게임', '2019-04-24', 122182694160, 13934592, 2835, 9.29);


insert into actorTbl values (1, '최민식', 1962, 177.1, 77.2, '김활란');
insert into actorTbl values (2, '류승룡', 1970, 175.3, 72.5, '유');
insert into actorTbl values (3, '조진웅', 1976, 187.9, 128, '김민아');
insert into actorTbl values (4, '이하늬', 1983, 173.1, 60.5, '유');
insert into actorTbl values (5, '공명', 1990, 183.2, 70.6, null);
insert into actorTbl values (6, '이동휘', 1985, 179.5, 72.6, null);
insert into actorTbl values (7, '하정우', 1978, 184.2, 75.4, null);
insert into actorTbl values (8, '주지훈', 1982, 188.5, 79.5, null);
insert into actorTbl values (9, '이정재', 1972, 180.4, 72.1, null);
insert into actorTbl values (10, '황정민', 1970, 180.7, 75.5, '김미혜');
insert into actorTbl values (11, '김윤진', 1973, 168.8, 48.2, '박정혁');
insert into actorTbl values (12, '오달수', 1968, 176.5, 68.2, null);
insert into actorTbl values (13, '로버트 다우니 주니어', 1965, 173.9, 68.1, '수전 러빈');
insert into actorTbl values (14, '크리스 에반스', 1981, 183.6, 79.8, null);
insert into actorTbl values (15, '스칼렛 요한슨', 1984, 160.5, 57.2, '콜린 조스트');
-- delete from actorTbl where 배우번호 = 1;

insert into roleTbl values(1,1,'주연', '이순신');
insert into roleTbl values(1,2,'조연', '구루지마');
insert into roleTbl values(1,3,'조연','와키자카');
insert into roleTbl values(2,2,'주연', '고반장');
insert into roleTbl values(2,4,'조연', '장형사');
insert into roleTbl values(2,5,'조연', '재훈');
insert into roleTbl values(2,6,'조연', '영 호');
insert into roleTbl values(3,7,'주연', '강림도령');
insert into roleTbl values(3,8,'주연', '해원맥');
insert into roleTbl values(3,9,'주연', '염라대왕');
insert into roleTbl values(4,10,'주연', '윤덕수');
insert into roleTbl values(4,11,'주연', '오영자');
insert into roleTbl values(4,12,'조연', '천달구');
insert into roleTbl values(5,13,'주연', '아이언맨');
insert into roleTbl values(5,14,'주연', '캡틴 아메리카');
insert into roleTbl values(5,15,'조연', '블랙 위도우');

insert into costTbl values (1, 14800000000, 135748398910, 120948398910, 9000);
insert into costTbl values (2, 9500000000, 139647979516, 130147979516, 11000);
insert into costTbl values (3, 40000000000, 115698654137, 75698645137, 10000);
insert into costTbl values (4, 18000000000, 110913469630, 92913469630, 9000);
insert into costTbl values (5, 422800000000, 122182694160, 3590113800000, 11000);
