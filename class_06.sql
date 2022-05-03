
-- MYSQL Numberic Function

select ABS(-252.2); -- 절대값

select * from buytbl;

-- 평균값
select *, sum(price) as 합계
from buytbl;

-- 합계
select sum(price) as 합계
from buytbl;

-- 서브쿼리 (3가지)
select *, (select sum(price) from buytbl) as 총합계
from buytbl;

-- 평균값
select *, avg(price) as 평균값
from buytbl;

-- 서브쿼리
select *, (select avg(price) from buytbl) as 평균값
from buytbl;

-- 올림 처리
select ceil(25.12) as 올림값;

-- 반올림 처리
select round(134.523) as 반올림처리;
select round(134.523, 2) as 반올림처리;

-- 내림 처리
select floor(25.81) as 내림처리;

select ceil(round(10 - 5) + 5);

-- max 값
select max(price)
from buytbl;

-- min 값
select min(price)
from buytbl;

-- usertbl , buytbl 문제
select *
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- 홍길동의 총구매금액
select userName, sum(price) as 총구매금액
from buytbl as b
where userName = '홍길동';

-- '이승기' 고객이 구매한 제품가격의 평균 출력하기 (buytbl 사용)
select avg(price)
from buytbl
where userName = '이승기';

-- ex 1
select avg(price) as 이승기구매액
from buytbl
where userName = '이승기';

-- 가격의 평균을 구하고 반올림하기
select round(avg(price)) as 가격평균
from buytbl;

-- ex 2
select round(avg(price)) as 가격평균
from buytbl;

-- buytbl에서 가장 비싼 값과 가장 저렴한 값을 조회하고, 가격의 평균값을 반올림하기
select max(price) as 최고금액, min(price) as 최저금액, round(avg(price))as 평균금액
from buytbl;

-- ex 3
select max(price) as 최고금액, min(price) as 최저금액, round(avg(price)) as 평균금액
from buytbl;

-- usertbl 기준으로 서브 쿼리를 이용해서 price의 합계,max값 구하기
select * ,(select sum(price)from buytbl)as 합계,(select max(price)from buytbl)as max값 
from usertbl;

-- ex 4
select * ,(select sum(price) from buytbl)as 합계, (select max(price) from buytbl) as max값
from usertbl;

-- 판매실적 및 총합
select  *, (price * amount) as 판매실적, (select sum(price) from buytbl) as 총합계 
from buytbl;

-- ex 5
select *, (price * amount) as 판매실적, (select sum(price) from buytbl) as 총합계
from buytbl;

-- usertbl에서 최대 출생년도와 최저 출생년도 뽑아내기
select max(birthYear) as maxYear, min(birthYear) as minYear
from usertbl;

-- ex 6
select max(birthYear) as maxYear, min(birthYear) as minYear
from usertbl;

-- buytbl에서 구매한 상품의 평균값 구하기
select *, (select avg(price / amount) from buytbl)as 1개당평균가 
from buytbl;

-- ex 7
select b.*, (select avg(price * amount) / amount from buytbl where prodName = b.prodName) as 1개당평균가
from buytbl as b;

-- 가격 * 판매수량 = 판매실적 , 총합계 , 평균구매가
select u.userName as 고객명, b.price as 가격, b.amount as 판매수량,  (price * amount) as 판매실적, (select sum(price) from buytbl) as 총합계 , (select avg(price) from buytbl) as 평균구매가
from usertbl as u
inner join buytbl as b
on b.userName = u.userName;

-- ex 8
select u.userName as 고객명, b.price as 가격, b.amount as 판매수량, (price * amount) as 판매실적, (select sum(price) from buytbl) as 총합, (select avg(price) from buytbl) as 평균구매가
from usertbl as u
inner join buytbl as b
on b.userName = u.userName;

-- buytbl에서 총 매출과 전체 평균을 구하세요 평균은 1의 자리에서 반올림 해주세요
select sum(amount * price) as '총 매출', round(avg(amount * price), 1) as '전체 평균'
from buytbl;

-- ex 9
select sum(amount * price) as '총 매출', round(avg(amount * price), 1) as '전체 평균'
from buytbl;