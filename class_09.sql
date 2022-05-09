create database shop_db;
use shop_db;

create table shop_db.product(
	id tinyint not null,
    p_name varchar(30) not null,
    created date,
    company varchar(30)
);

-- index : create index(UNIQUE INDEX)

create index idx_product_name
on product (p_name);

-- 가상 테이블 (뷰 테이블)
select * from product;

-- 데이터 생성
insert into product values(1, '세탁기', '2020-12-12', '삼성');
insert into product values(2, '냉장고', now(), 'LG');
insert into product values(3, '모니터', curdate(), '삼성');
insert into product values(4, '컴퓨터', curdate(), '삼성');

desc product;

-- 컬럼 추가하기
alter table product add input_time timestamp;

-- 가상 테이블 생성하기 (정보은닉 가능)
create view product_view
as select p_name, created, company
from product;

select * from product_view;

-- delete (계정에 삭제 권한 안주면 삭제안됨)
delete from product_view where p_name = '컴퓨터';

-- drop database shop_db;

show databases;

-- drop index
-- index 조회하는 방법
show index from product;

-- index 수정하는 방법
alter table product;

-- index 삭제하는 방법
alter table product
drop index idx_product_name;

-- 테이블 복사
select * from product;

create table product_2 select * from product;
select * from product_2;

-- 집계함수
-- group by
use shopdb;

select * from buytbl;

-- group by
select userName
from buytbl
group by userName;

select *
from buytbl
group by price;

select *
from buytbl
group by amount;

-- 이름으로 묶고 amount가 3보다 큰 사람들을 출력하라
select *
from buytbl
where amount >= 3
group by userName;

-- 집계 함수
select count(*) as 판매횟수
from buytbl;

-- 집계 함수와 그룹 바이
select userName, sum(price) as '구매 금액'
from buytbl
group by userName;

delete from buytbl where userName = '야스오';

-- product 테이블에서 이름으로 묶고 제조일이 2020년 12월 12일 이후인 것만 출력 
select *
from product
where created >= '2020-12-12'
group by company;