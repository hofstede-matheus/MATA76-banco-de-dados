-- Config
create extension if not exists "uuid-ossp";

-- Tables
create table authors (
  id uuid primary key default uuid_generate_v4(),
  name varchar(255) not null
);


-- Seeds
