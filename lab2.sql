CREATE DATABASE  lab2;
CREATE TABLE countriez(
  country_id SERIAL CONSTRAINT o_key PRIMARY KEY,
  country_name varchar(50),
  region_id INTEGER,
  population INTEGER
);
select * from countriez;
INSERT INTO countriez VALUES (1, 'Petropavl', 8, 40000);
INSERT INTO countriez VALUES (2, 'Kokshetau', 10, 25000);
INSERT INTO countriez VALUES (3, 'Astana');
INSERT INTO countriez (country_id, region_id) VALUES (DEFAULT, NULL);
INSERT INTO countriez VALUES (DEFAULT, 'Karaganda', 11, 65000),
                             (DEFAULT, 'Borovoe', 14, 64000),
                             (DEFAULT , 'Pavlodar', 16, 45000);
ALTER TABLE ONLY countriez ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countriez (country_name) VALUES (DEFAULT);
INSERT INTO countriez VALUES (DEFAULT);
CREATE TABLE countriez_new ( LIKE countriez including all);
INSERT INTO countriez_new select * from countriez;
UPDATE countriez SET region_id=1 WHERE region_id is NULL;
UPDATE countriez SET population=(population*0.1)+population
RETURNING country_name, population AS "New Population";
DELETE FROM countriez WHERE population <100000;
DELETE FROM countriez_new USING countriez WHERE countriez_new.country_id=countriez.country_id
RETURNING *;
DELETE FROM countriez RETURNING *;





