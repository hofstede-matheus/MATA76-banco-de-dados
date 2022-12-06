CREATE TABLE authors (
	id INTEGER NOT NULL, 
	name VARCHAR, 
	PRIMARY KEY (id)
);

CREATE INDEX ix_authors_name ON authors (name);
CREATE INDEX ix_authors_id ON authors (id);

CREATE TABLE books (
	id INTEGER NOT NULL, 
	isbn VARCHAR, 
	name VARCHAR, 
	author_id INTEGER, 
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_books_isbn ON books (isbn);
CREATE INDEX ix_books_id ON books (id);

CREATE TABLE customers (
	id INTEGER NOT NULL, 
	name VARCHAR, 
	birth_day VARCHAR, 
	address VARCHAR, 
	PRIMARY KEY (id)
);

CREATE INDEX ix_customers_id ON customers (id);

CREATE TABLE loans (
	id INTEGER NOT NULL, 
	date VARCHAR, 
	customer_id INTEGER, 
	book_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(customer_id) REFERENCES customers (id), 
	FOREIGN KEY(book_id) REFERENCES books (id)
);

CREATE INDEX ix_loans_id ON loans (id);
CREATE INDEX ix_loans_date ON loans (date);

-- 978-3-16-148410-0
