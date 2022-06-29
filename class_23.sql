
create database BLOG2;
create database BLOG3;

use blog2;
desc board;
desc user;

SELECT * FROM USER;
SELECT * FROM board;

delete from board where id = 100;

use blog;

select * from reply;
desc reply;

insert into reply(content, boardId, userId, createDate)
values("댓글 1번 글", 2, 1, now());

insert into reply(content, boardId, userId, createDate)
values("댓글 2번 글", 2, 1, now());

insert into reply(content, boardId, userId, createDate)
values("댓글 3번 글", 2, 1, now());

insert into reply(content, boardId, userId, createDate)
values("댓글 4번 글", 2, 1, now());

insert into reply(content, boardId, userId, createDate)
values("댓글 5번 글", 2, 1, now());

delete from board where id=1;