-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE customers 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE flights 
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  airline_id INTEGER REFERENCES airlines
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers,
  seat TEXT NOT NULL,
  flight_id INT REFERENCES flights
);

INSERT INTO customers 
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brazil');

INSERT INTO flights
  (departure, arrival, from_city, from_country, to_city, to_country, airline_id)
VALUES 
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'Washington DC', 'United States', 'Seattle', 'United States', 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'Tokyo', 'Japan', 'London', 'United Kingdom', 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Los Angeles', 'United States', 'Las Vegas', 'United States', 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Seattle', 'United States', 'Mexico City', 'Mexico', 3),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'Paris', 'France', 'Casablanca', 'Morocco', 4),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Dubai', 'UAE', 'Beijing', 'China', 5),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'New York', 'United States', 'Charlotte', 'United States', 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'Cedar Rapids', 'United States', 'Chicago', 'United States', 6),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'Charlotte', 'United States', 'New Orleans', 'United States', 6),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile', 7);
  
INSERT INTO tickets
  (customer_id, seat, flight_id)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (3, '12F', 3),
  (1, '20A',4),
  (4, '23D',5),
  (2, '18C',6),
  (5, '9E',7),
  (6, '1A',8),
  (5, '32B',9),
  (7, '10D',10);

