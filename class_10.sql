-- MySQL 계정 생성 및 권한 관리

-- 현재 사용자 계정 확인
show databases;
use mysql;

select host, user from user;

-- 1. 사용자 추가 및 권한 세팅 (첫번째 방법)
create user tester1@localhost identified by 'asd123';
grant select, insert, update, delete on shop_db.* TO 'tester1'@'localhost';

-- MySQL 8에서 계정 생성 방법 (계정 생성 후 모든 권한을 할당)

-- 2. 모든 DB에 권한 할당, localhost만 접근 허용
create user tester2@localhost identified by 'asd123';
grant all privileges on *.* to 'tester2'@'localhost' with grant option;
flush privileges;

-- 3. 외부 접속 허용 계정
create user tester3@'%' identified by 'asd123';
grant all privileges on *.* to 'tester3'@'%' with grant option;

-- 4. 계정 삭제 방법
drop user 'tester3'@'%';
drop user 'tester2'@'localhost';

-- db에 만들어진 모든 테이블 확인
use shopdb;

show full tables;

-- 뷰 생성
create view usertbl_view as select userName, birthYear, addr from usertbl;

-- usertbl에서 2000년 이후 출생자 이름과 출생년도만 출력해서 usertbl_view3으로 정의
create view usertbl_view3 as select userName, birthYear from usertbl where birthYear >= 2000;
select * from usertbl_view3;

use mysql;
select * from user;

create user tencoding@'%' identified by 'asd123';
grant select on shopdb.usertbl_view to 'tencoding'@'%';

-- ex1
-- buytbl에서 제품별 판매량 구하기
select prodName as 제품명, count(prodName) as 판매량 from buytbl
group by prodName;
-- 외부에서 접근할 수 있는 korea_it 계정 생성하고 shopdb의 producttbl 테이블 조회할 수 있는 권한 부여하기
create user 'korea_it'@'%' identified by 'asd123';
grant select on shopdb.producttbl to 'korea_it'@'%';

-- ex2
-- shopdb에서 usertbl이랑 buytbl이랑 left join후
-- 일정 price이상 구매 고객에 대한 개인 정보 + 구매 정보 출력할 거임.
-- username으로 group하고
-- view로 생성해서
-- employee1에게 권한주기 (외부접근 가능)
use shopdb;
select * from usertbl;
select * from buytbl;
drop view vip_view;
create view vip_view as select a.*, b.prodName, b.price, b.amount from usertbl as a
inner join buytbl as b
on a.username = b.username
where price >=50
group by a.username;

select * from vip_view;

use mysql;
select * from user;
create user employee1@'%' identified by 'asd123';
grant select on shopdb.vip_view to employee1;

-- ex3
-- buytbl에서 이름으로 그룸화하여 그 사람이 총 지불한 금액을 조회하기
select userName, sum(price*amount) as 총지불금액
from buytbl
group by userName;
-- producttbl의 id, productName, cost, company에 접근할 수 있는 뷰를 생성하고,
 -- 이에 삭제만 불가능한 계정 만들기 (외부 접속 허용)
create view producttbl_view 
as select productId, productName, cost, company
from producttbl;

select * from producttbl_view;
create user tester2@'%' identified by 'asd123';
grant select, insert, update on shopdb.producttbl_view to tester2@'%';

-- ex4
-- buytbl에 userName,prodName, price 만 볼수있는  뷰 만들기
-- 계정을 새로 만들어서 buytbl_view에 생성 수정 보기 권한주기
create view buytbl_view
as select userName, prodName, price
from buytbl;

create user buytbl_view_id@'%' identified by 'asd123';
grant insert, update, select on shopdb.buytbl_view to buytbl_view_id@'%';

-- ex5
-- 이름으로 묶어서 amount 출력 
select userName, sum(amount) as '구매수량'
from buytbl
group by userName;

-- 사용자 추가하고 권한 세팅
create user test@localhost identified by 'asd123';
grant select, insert, update, delete on shop_db.* to 'test'@'localhost';

-- ex6
-- shopdb의 usertbl을 복사해서, 1900년대생 몇명인지 나타내기
create table usertbl_view4 select * from usertbl;

select count(*) as '1900년대생인원수'
from usertbl_view4
where birthYear < 2000;
-- 현재 계정에 사용자를 추가하여 shopdb의 buytbl테이블의 검색 권한만 부여하기
create user test1@localhost identified by 'asd123';
grant select on shopdb.* to test1@localhost;

-- ex7
-- 외부에서 CEO에게 buytbl에있는 장부를 조회할수 있는 권한 부여하기
create user 'CEO'@'%' identified by 'asd123';
grant select on showdb.buytbl to 'CEO'@'%';
select sum(price) as 총매출 ,count() as 판매횟수, sum(price)/count() as 평균판매금액
from buytbl;

-- ex8
select count(*) as 판매횟수
from buytbl;

select username, sum(price) as '구매 금액'
from buytbl;

-- 집계함수화 그룹바이 
select username, sum(price) as '구매 금액'
from buytbl
group by username;
-- 유저당 총 구매 갯수
select username "유저 이름", sum(amount) "구매 갯수"
from buytbl
group by username;
-- 유저당 총 사용 금액이 200 이상인 사람
select username "유저 이름", sum(amount * price) "총 사용 금액"
from buytbl
group by username
having sum(amount * price) > 200;

-- 유저당 평균 구매 횟수
select username, avg(amount) "평균 구매 횟수"
from buytbl
group by username;