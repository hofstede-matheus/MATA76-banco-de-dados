-- Config
create extension if not exists "uuid-ossp";

-- Tables
create table authors (
  id uuid primary key default uuid_generate_v4(),
  name varchar(255) not null
);

CREATE INDEX ix_authors_name ON authors (name);

create table books (
  id uuid primary key default uuid_generate_v4(),
  isbn varchar(255) not null,
  name varchar(255) not null,
  pages int not null,
  author_id uuid not null,
  foreign key (author_id) references authors(id)
);

CREATE INDEX ix_books_isbn ON books (isbn);
CREATE INDEX ix_books_name ON books (name);

create table customers (
  id uuid primary key default uuid_generate_v4(),
  name varchar(255) not null,
  birth_day DATE not null,
  address varchar(255) not null,
  cpf varchar(11) not null unique
);

CREATE INDEX ix_customers_name ON customers (name);
CREATE INDEX ix_customers_cpf ON customers (cpf);


create table loans (
  book_id uuid not null,
  customer_id uuid not null,
  date DATE NOT NULL,
  primary key (book_id, customer_id),
  
  FOREIGN KEY(customer_id) REFERENCES customers (id), 
	FOREIGN KEY(book_id) REFERENCES books (id)
);

CREATE INDEX ix_customers_date ON loans (date);


-- Seeds
insert into authors (name) values ('J. R. R. Tolkien');
insert into authors (name) values ('George R. R. Martin');
insert into authors (name) values ('Stephen King');
insert into authors (name) values ('J. K. Rowling');
insert into authors (name) values ('Dan Brown');
insert into authors (name) values ('Fiódor Dostoiévski');

insert into books (isbn, name, pages, author_id) values ('978-3-16-148410-0', 'Book Number 1',100, (select id from authors where name = 'J. R. R. Tolkien'));
insert into books (isbn, name, pages, author_id) values ('978-3-16-148410-1', 'Book Number 2',100,(select id from authors where name = 'George R. R. Martin'));
insert into books (isbn, name, pages, author_id) values ('978-3-16-148410-2', 'Book Number 3',100,(select id from authors where name = 'Stephen King'));
insert into books (isbn, name, pages, author_id) values ('978-3-16-148410-4', 'Book Number 4',100,(select id from authors where name = 'J. K. Rowling'));

select * from books;

update books set name = 'J. R. R. Tolkien', pages = 200, author_id = (select id from authors where name = 'George R. R. Martin') where id = (select id from books where name = 'Book Number 1');

select * from books;

delete from books where name = 'J. R. R. Tolkien';

select * from books;

insert into customers (name, birth_day, address, cpf) values ('Joao Gomes', '2022-01-01', 'Endereço', '12345678912');
insert into customers (name, birth_day, address, cpf) values ('Cristiano Ronaldo', '2022-01-01', 'Endereço', '98765432112');
insert into customers (name, birth_day, address, cpf) values ('Neymar Jr', '2022-01-01', 'Endereço', '13524635789');
insert into customers (name, birth_day, address, cpf) values ('Lionel Messi', '2022-01-01', 'Endereço', '07645563765');
insert into customers (name, birth_day, address, cpf) values ('Daniel Alves', '2022-01-01', 'Endereço', '90878965412');
insert into customers (name, birth_day, address, cpf) values ('Jose Maria', '2022-01-01', 'Endereço', '08765412389');

select * from customers;

update customers set name = 'J. R. R. Tolkien', cpf = '07487976512' where id = (select id from customers where name = 'Joao Gomes');

select * from customers;

delete from customers where id = (select id from customers where name = 'Joao Gomes');

select * from customers;

insert into loans (book_id, customer_id, date) values ((select id from books where name = 'Book Number 2'), (select id from customers where name = 'Cristiano Ronaldo'), '2022-01-01');
insert into loans (book_id, customer_id, date) values ((select id from books where name = 'Book Number 3'), (select id from customers where name = 'Cristiano Ronaldo'),  '2022-01-01');

select date, isbn, books.name, customers.name, cpf from loans inner join books on loans.book_id = books.id inner join customers on loans.customer_id = customers.id;

update loans set date = '2023-01-01' where book_id = (select id from books where name = 'Book Number 2') AND customer_id = (select id from customers where name = 'Cristiano Ronaldo');

select date, isbn, books.name, customers.name, cpf from loans inner join books on loans.book_id = books.id inner join customers on loans.customer_id = customers.id;

delete from loans where book_id = (select id from books where name = 'Book Number 2') AND customer_id = (select id from customers where name = 'Cristiano Ronaldo');

select date, isbn, books.name, customers.name, cpf from loans inner join books on loans.book_id = books.id inner join customers on loans.customer_id = customers.id;