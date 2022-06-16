use blog;

select * from reply;
select * from board;
select * from user;
delete from user;
desc user;
select * from category;
insert 
    into
        User
        (createDate, email, password, role, username) 
    values
        (?, ?, ?, ?, ?)
