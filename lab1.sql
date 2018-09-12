CREATE database lab1;
CREATE table users(
  id SERIAL CONSTRAINT users_pkey PRIMARY KEY,
  firstname varchar(50),
  lastname varchar(50)
);
SELECT * FROM users;
ALTER TABLE users ADD COLUMN isadmin INT;
ALTER TABLE users ALTER COLUMN isadmin DROP DEFAULT;
ALTER TABLE users ALTER COLUMN isadmin TYPE bool using users.isadmin::boolean;
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT TRUE;
INSERT INTO users (firstname, lastname) VALUES ('Leila','Dos');
INSERT INTO users (firstname, lastname, isadmin) VALUES ('Leila','Dos', DEFAULT );


CREATE TABLE tasks(
  id_1 SERIAL,
  name varchar(50),
  user_id INTEGER
);
DROP TABLE tasks;
DROP DATABASE lab1;









