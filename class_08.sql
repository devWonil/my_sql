-- and 와 or

select *
from membertbl;

insert into membertbl values('jsa', '김주한', '부산시 진구');

insert into memberTbL(memberAddress, memberName, memberId) values("경기도 부천시", '탕탕이', 'Dang');
update memberTBL set memberAddress = '경기도 부천시' where memberName = '탕탕이';
update memberTBL set memberAddress = '부산시 해운대구' where memberName = '한주연';
update memberTBL set memberAddress = '경남 양산시' where memberName = '홍길동';

-- 이름 홍길동, 주소가 부산시 진구
select *
from membertbl
where memberName = '홍길동'
and memberAddress = '부산시 진구';

-- 주소가 부산시 진구 or 경기도 부천시
select *
from membertbl
where memberAddress = '부산시 진구'
or memberAddress = '경기도 부천시';

-- 주소가 (부산시 진구 or 경기도 부천시) and 이름이 김주한
select *
from membertbl
where (memberAddress = '부산시 진구' or memberAddress = '경기도 부천시') and memberName = '김주한';

-- 샘플 테이블 생성
create table memberCart(
	id int not null auto_increment,
    name varchar(30) not null,
    amount int not null,
    primary key(id)
);

desc memberCart;
select * from memberCart;

-- 테이블에 컬럼 추가
alter table memberCart add productName varchar(30) not null;

-- 테이블에 컬럼명을 수정해보자
alter table memberCart rename column name to name2;

-- 테이블에 컬럼명을 삭제해보자
alter table memberCart drop column name2;

select * from myCart;

-- 테이블 이름 변경하기
rename table memberCart to myCart; -- 1
alter table myCart rename shopCart; -- 2

-- 데이터 입력
insert into shopCart values(1, 1, '청바지');

-- 기본 전략 auto_increament()
insert into shopCart(amount, productName) values(2, '운동화');

insert into shopCart(amount, productName) values(12, '잠바');
insert into shopCart(amount, productName) values(3, '핸드폰');
insert into shopCart(amount, productName) values(5, '지갑');
desc shopCart;

select * from shopCart;

-- between
select *
from shopCart
where amount between 2 and 5;

select *
from buytbl;