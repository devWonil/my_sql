-- mysql function

-- MySQL String Function
select ascii('b');

select char_length('MY SQL TEST') as 문자길이; -- 공백도 글자 수에 포함 (필드명 별칭으로 변경가능)
select char_length('홍길동') as 이름;
select concat('boot', 'class', '100%') as class_name; -- 문자열을 더해줌
select concat_ws('->', 'boot', 'class', '100%') as class_name;
select find_in_set('l', 's,q,l'); -- 문자열 목록 내에서 q를 검색할 수 있다

select format(250500.5634, 0);
-- 숫자 형식은 "#.##.##.##"(소수점 2자리 반올림)으로 지정한다

select lcase('HELLO JAVA'); -- hello java
select ucase('hello java'); -- HELLO JAVA

select trim('   M Y S Q L       ');

select replace('     aaa 11         ', ' ', '');

-- inner join 2
select a.userName, a.addr, a.mobile, b.prodName, b.price, b.amount, char_length(a.userName)
from usertbl as a
inner join buytbl as b
on a.userName = b.userName;

-- inner join 3 userName이 홍길동이면 1출력 아니면 0
select *, find_in_set('홍길동', u.userName)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- userName이 야스오인 로우 찾아서 야*오로 바꾸기
select replace('야스오', '스', '*'), u.birthYear, u.addr, u.mobile 
from usertbl as u
where u.userName = '야스오';

-- usertbl기준으로 buytbl left join한다.
-- mobile에서 -빼고 조회
select a.username, a.birthYear, a.addr, replace(a.mobile,'-',''), b.prodname, b.price, b.amount
from usertbl as a
left join buytbl as b
on a.username = b.username;

-- 주소에있는 문자열 글자수 확인하기,
-- amount ascii 값 확인하기. as(별칭)
select u.userName, u.addr as 주소, b.prodName,b.amount, char_length(u.addr) as 주소글자_길이, ascii(b.amount) as amount_ascii
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- usertbl 기준으로 buytbl과 공통되는 userName 출력하고, 글자수 반환하기
select u.userName, char_length(u.userName)
from usertbl as u
left join buytbl as b
on u.userName = b.userName;

-- 전화번호에서 "-" 제거
select a.username, a.addr, replace(a.mobile, '-', ''), b.prodname, b.price, b.amount, char_length(a.username)
from usertbl as a
inner join buytbl as b
on a.username = b.username;

-- '누가 구매한 상품명' 으로 리스트를 만들고, 가격과 수량 조회하기
select concat_ws('가 구매한 ', u.userName, b.prodName) as 'list', b.amount, b.price
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- usertble을 기준으로 buytbl inner join. 
-- usertbl의 이름과 번호, buytbl의 가격과 수량 데이터를 가져오고, 번호의 문자길이 조회하기
select u.userName, u.mobile, b.price, b.amount, char_length(u.mobile)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- inner join 1
select u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount, char_length(b.prodName)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- inner join 2
select concat_ws('->',u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

-- inner join 3
select concat(u.userName, u.addr, u.mobile, b.prodName, b.price, b.amount)
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;