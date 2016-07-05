DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE tags(
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants(
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id serial4 PRIMARY KEY,
  tag_id int4 REFERENCES tags(id),
  merchant_id int4 REFERENCES merchants(id),
  type VARCHAR(255),
  amount NUMERIC(4, 2),
  date_trans DATE
);