-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

DROP TABLE IF EXISTS airlines CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS cities CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER NOT NULL REFERENCES countries
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines ON DELETE CASCADE,
  from_city INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  from_country INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE,
  to_city INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  to_country INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE
);


INSERT INTO airlines (name)
VALUES
  ('Air Peace'),
  ('Air France'), 
  ('Delta'), 
  ('Luftansa'), 
  ('Fly Emirates'), 
  ('Egypt Air'), 
  ('British Airways');

INSERT INTO countries (name)
VALUES
  ('Nigeria'), 
  ('United States Of America'),
  ('Egypt'),
  ('Kenya'),
  ('Cameroon'),
  ('United Kingdom'),
  ('Japan'),
  ('Spain'),
  ('Netherlands'),
  ('Brazil');

INSERT INTO cities (name, country_id) VALUES ('Asaba', 1);
INSERT INTO cities (name, country_id) VALUES ('Baltimore', 2);
INSERT INTO cities (name, country_id) VALUES ('Cairo', 3);
INSERT INTO cities (name, country_id) VALUES ('Nairobi', 4);
INSERT INTO cities (name, country_id) VALUES ('Yaoundé', 5);
INSERT INTO cities (name, country_id) VALUES ('London', 6);
INSERT INTO cities (name, country_id) VALUES ('Tokyo', 7);
INSERT INTO cities (name, country_id) VALUES ('Madrid', 8);
INSERT INTO cities (name, country_id) VALUES ('Amsterdam', 9);
INSERT INTO cities (name, country_id) VALUES ('Rio de Janeiro', 10);

INSERT INTO tickets (first_name, last_name, seat, departure, arrival, airline_id, from_city, from_country, to_city, to_country)
VALUES('Jeremy', 'Benedict', '12C', '2022-04-02 10:30:00', '2022-04-03 06:00:00', 1, 1, 1, 2, 2);

INSERT INTO tickets (first_name, last_name, seat, departure, arrival, airline_id, from_city, from_country, to_city, to_country)
VALUES('Kennedy', 'George', '15B', '2022-07-04 08:30:00', '2022-04-03 06:00:00', 6, 6, 6, 10, 10);



  
-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');