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
drop table reviewTbl;
drop table teachersDay;

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
 
 create table reviewTbl(
	reviewNumber int not null primary key,
    nickname varchar(7),
    movieNumber int,
    movieName varchar(20),
    releasedDate date,
    audience int,
    starRating decimal(4,2),
    review varchar(100),
    foreign key (movieNumber) references movieTbl(movieNumber)
 );

 insert into reviewtbl values(1, '홍원일', 1, '명량', '2014-07-30', 17613682, 9.79, '노잼');
 insert into reviewtbl values(3, '홍원일', 1, '명량', '2014-07-30', 17613682, 9.79, '노잼');
 insert into reviewtbl values(100, '홍원일', 1, '명량', '2014-07-30', 17613682, 9.79, '노잼');
 alter table 영화금액 modify 영화번호 int(3);

 select * from movieTbl;
 select * from actorTbl;
 select * from roleTbl;
 select * from costTbl;
 select * from reviewTbl;
 
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
INSERT INTO movieTbl VALUES (6, '겨울왕국2', '2019-11-21', 114810421450, 13747792, 2648, 8.95);
INSERT INTO movieTbl VALUES (7, '아바타', '2009-12-17', 128447097523, 13624328, 912, 9.07);
INSERT INTO movieTbl VALUES (8, '베테랑', '2015-08-05', 105168155250, 13414009, 1064, 9.24);
INSERT INTO movieTbl VALUES (9, '괴물', '2006-07-27', 0, 13019740, 167, 8.62);
INSERT INTO movieTbl VALUES (10, '도둑들', '2012-07-25', 93665568500, 12983330, 1072, 8.00);
INSERT INTO movieTbl VALUES (11, '7번방의 선물', '2013-01-23', 91431914670, 12811206, 787, 8.83);
INSERT INTO movieTbl VALUES (12, '암살', '2015-07-22', 98463132781, 12705700, 1519, 9.10);
INSERT INTO movieTbl VALUES (13, '알라딘', '2019-05-23', 106983620359, 12555894, 1311, 9.42);
INSERT INTO movieTbl VALUES (14, '광해, 왕이 된 남자', '2012-09-13', 88900208769, 12319542, 810, 9.25);
INSERT INTO movieTbl VALUES (15, '왕의 남자', '2005-12-29', 0, 12302831, 94, 9.04);
INSERT INTO movieTbl VALUES (16, '신과 함께-인과 연', '2018-08-01', 102666146909, 12274996, 2235, 8.63);
INSERT INTO movieTbl VALUES (17, '택시운전사', '2017-08-02', 95855737149, 12186684, 1906, 9.28);
INSERT INTO movieTbl VALUES (18, '태극기 휘날리며', '2004-02-05', 0, 11746135, 110, 9.21);
INSERT INTO movieTbl VALUES (19, '부산행', '2016-07-20', 93178283048, 11565479, 1788, 8.6);
INSERT INTO movieTbl VALUES (20, '해운대', '2009-07-22', 81934638201, 11453338, 753, 7.44);
INSERT INTO movieTbl VALUES (21, '변호인', '2013-12-18', 82871759300, 11374610, 923, 9.0);
INSERT INTO movieTbl VALUES (22, '어벤져스:인피니티 워', '2018-04-25', 99919006769, 11211880, 2553, 9.08);
INSERT INTO movieTbl VALUES (23, '실미도', '2003-12-24', 0, 11081000, 83, 8.39);
INSERT INTO movieTbl VALUES (24, '어벤져스:에이지 오브 울트론', '2015-04-23', 88582586366, 10494499, 1843, 8.59);
INSERT INTO movieTbl VALUES (25, '기생충', '2019-05-30', 87459829095, 10313086, 1948, 9.07);
INSERT INTO movieTbl VALUES (26, '알라딘', '1993-07-03', 593488168, 647266, 26, 9.35);

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