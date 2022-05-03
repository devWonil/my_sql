use shopdb;

select * from usertbl;
select * from buytbl;

-- inner join
select *
from usertbl
inner join buytbl
on usertbl.userName = buytbl.userName;

-- inner join 2
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- inner join 3
select a.userName, a.birthYear, a.addr, a.mobile, b.prodName, b.price, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- inner join 4
select a.username, a.birthYear, a.mobile, b.prodName, b.amount
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- left join 1
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

-- usertbl 고객 등록
select * from usertbl;
insert into usertbl values('야스오', 2000, '여수', '010-1234-1234');

-- left join 2
select *
from usertbl as u
left join buytbl as b
on u.userName = b.userName
where b.userName is not null;

-- 구매 테이블 생성할 때 외래키에 제약을 생성했기 때문
insert into buytbl values('티모', '노트북', 150, 1); -- 불가능

-- 하지만 구매 테이블을 생성할 때 외래키(FK) 제약하지 않았다면 insert는 가능하다
select * from buytbl;

-- left join 3
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName;

-- left join 4
select *
from buytbl as b
left join usertbl as u
on u.userName = b.userName
where u.userName is not null;

-- right join 1
select u.userName, b.prodName, b.price, b.amount
from usertbl as u
right join buytbl as b
on u.username = b.username;

-- 곱 집합 cross join 1
select *
from usertbl as u
cross join buytbl as b
on u.userName = b.userName;

-- 곱 집합 cross join 2
select *
from usertbl
cross join buytbl
on usertbl.userName = buytbl.userName
where usertbl.userName is null
or buytbl.userName is null