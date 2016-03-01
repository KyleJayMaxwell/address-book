DROP DATABASE IF EXISTS address_book;
CREATE DATABASE address_book;

\connect address_book;

CREATE TABLE contacts (
  id serial PRIMARY KEY,
  first_name varchar(70) NOT NULL,
  last_name varchar(70) NOT NULL,
  phone bigint NOT NULL,
  email varchar(70) NOT NULL,
  img_url varchar(70) NOT NULL
);

CREATE TABLE addresses (
  id serial PRIMARY KEY,
  line_1 varchar(70) NOT NULL,
  line_2 varchar(70) NOT NULL,
  city varchar(70) NOT NULL,
  state varchar(70) NOT NULL,
  country varchar(70) NOT NULL,
  zip_code int
);

CREATE TABLE homes (
  contact_id integer references contacts(id) on delete cascade,
  address_id integer references addresses(id) on delete cascade
);

INSERT INTO contacts (id, first_name, last_name, phone, email, img_url) VALUES
(DEFAULT, 'Kyle', 'Maxwell', 7209843866, 'kylejaymaxwell@gmail.com', '../images/kyle.jpg'),
(DEFAULT, 'Tobin', 'Bode', 1351849327, 'Bode.T@email.com', '../images/tobin.jpg'),
(DEFAULT, 'Howell', 'Bartoletti', 6821889373, 'howell.bartoletti@email.net', '../images/howell.jpg'),
(DEFAULT, 'Lue', 'Effertz', 8073602406, 'lue.e@email.io', '../images/lue.jpg'),
(DEFAULT, 'Alvah', 'Kuhlman', 4070756014, 'kuhlman.alvah@email.com', '../images/alvah.jpg'),
(DEFAULT, 'Vernon', 'Kertzmann', 188958925, 'vernonvernon@email.com', '../images/vernon.jpg');

INSERT INTO addresses (id, line_1, line_2, city, state, country, zip_code) VALUES
(DEFAULT, '13724 West Auburn Avenue', '', 'Lakewood', 'CO', 'USA', 80228),
(DEFAULT, '37632 North Table Court', '#102', 'New York City', 'NY', 'USA', 94356),
(DEFAULT, '734 South Thomas Street', '#592', 'Phoenix', 'AZ', 'USA', 48536),
(DEFAULT, '2734 N. Sunset Boulevard', '', 'San Jose', 'CA', 'USA', 02347),
(DEFAULT, '1 Tower Place', '#9002', 'Paris', '', 'FR', 77777);

INSERT INTO homes (contact_id, address_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 5);


