-- Authors
insert into authors (name) values ('J. R. R. Tolkien');
insert into authors (name) values ('George R. R. Martin');
insert into authors (name) values ('Stephen King');
insert into authors (name) values ('J. K. Rowling');
insert into authors (name) values ('Dan Brown');
insert into authors (name) values ('Fiódor Dostoiévski');

select * from authors;

update authors set name = 'J. R. R. Tolkien' where id = 'f0f0f0f0-f0f0-f0f0-f0f0-f0f0f0f0f0f0';

delete from authors where id = 'f0f0f0f0-f0f0-f0f0-f0f0-f0f0f0f0f0f0';