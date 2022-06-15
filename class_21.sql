-- 언어 설정 확인 명령어

show variables like 'character_set%';
show variables like 'c';

-- 자바 프로그램(스프링 db 접속하는 전용 유저)

create user 'ten'@'%' identified by '1q2w3e4r5t!';
grant all privileges on *.* to 'ten'@'%';
flush privileges;

create user 'ten'@'localhost' identified by '1q2w3e4r5t!';
grant all privileges on *.* to 'ten'@'localhost';
flush privileges;

use mysql;
select user, host from user;

-- db 생성
create database blog;