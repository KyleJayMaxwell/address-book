DROP DATABASE IF EXISTS address_book;
CREATE DATABASE address_book;

\connect address_book;

CREATE TABLE contacts (
  id serial PRIMARY KEY,
  first_name varchar(70) NOT NULL,
  last_name varchar(70) NOT NULL,
  phone int NOT NULL,
  email varchar(70) NOT NULL,
  img_url varchar(70) NOT NULL
);

CREATE TABLE addresses (
  id serial PRIMARY KEY,
  line_1 varchar(70) NOT NULL,
  line_2 varchar(70) NOT NULL,
  city varchar(70) NOT NULL,
  state varchar(70) NOT NULL,
  zip_code int
);

CREATE TABLE homes (
  contact_id integer references contacts(id) on delete cascade,
  address_id integer references addresses(id) on delete cascade
);

