-- C R U D

-- 데이터 생성 insert
desc memberTbL;

insert into memberTbL values("Dang", "탕탕이", "경기도 부천시");
insert into memberTbL values('Han', '한주연', "부산시 해운대구");
insert into memberTbL(memberAddress, memberName, memberId) values("서울시 상암동", '지운이', 'jee2');

-- 오류 구문 (memberTBL에 memberId, memberName 필드명이 not null로 설계되었기 때문)
insert into memberTbL(memberId) values('jee2');
insert into memberTBL(memberId, memberName) values('kee2', '홍길삼');

-- 전체 테이블에 대한 데이터 조회
select * from memberTbL;

-- 한건에 대한 데이터 조회를 어떻게 할까?
select * from memberTBL where memberId = 'jee';

-- 한건에 대한 조회 + 조건절
select memberName
from memberTBL
where memberId = 'kee2';

-- 한건에 대한 데이터 삭제
delete from memberTBL where memberId = 'kee2';

-- 전체에 대한 데이터 삭제 구문
delete from memberTBL;

truncate memberTBL;

-- 한건에 대한 데이터 수정
update memberTBL set memberName = '홍길동' where memberId = 'jee';

-- 전체 데이터에 대한 값 수정
update memberTBL set memberAddress = 'memberAddress';

-- ----------------------------
desc productTBL;

-- 문제1 productTBL 데이터를 3건 입력해주세요
select * from productTBL;
insert into productTBL values(1, '세탁기', 1000000,  'LG', 50);
insert into productTBL values(2, '냉장고', 1500000,  '삼성', 150);
insert into productTBL values(3, '컴퓨터', 800000,  '애플', 100);

delete from productTBL;
-- 불필요한 컬럼 삭제하는 방법
alter table productTBL drop makeDate;

-- 문제2 검색
select * from productTBL where cost = 1000000;
select * from productTBL where company = '삼성';
select * from productTBL where productId = 3;

-- 문제3 수정
update productTBL set productName = '식기세척' where productId = 3;
update productTBL set cost = 900000 where productName = "세탁기";

-- 문제4 삭제
delete from productTBL where productId = 3;
delete from productTBL where company = 'LG';