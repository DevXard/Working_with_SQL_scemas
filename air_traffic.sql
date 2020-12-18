-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE from_destination
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);

CREATE TABLE to_destination
(
 id SERIAL PRIMARY KEY,
  arrival TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  airline_id INTEGER REFERENCES airline,
  from_destination_id INTEGER REFERENCES from_destination,
  to_destination_id INTEGER REFERENCES to_destination
);

INSERT INTO from_destination (departure, from_city, from_country)
VALUES
('2018-04-08 09:00:00', 'Washington DC', 'United States'),
('2018-12-19 12:45:00', 'Tokyo', 'Japan'),
('2018-01-02 07:00:00', 'Los Angeles', 'United States');

INSERT INTO to_destination (arrival, to_city, to_country)
VALUES
('2018-04-08 12:00:00', 'Seattle', 'United States'),
('2018-12-19 16:15:00', 'London', 'United Kingdom'),
('2018-01-02 08:03:00', 'Las Vegas', 'United States');

INSERT INTO airline (airline)
VALUES
('United'),
('British Airways'),
('Delta');

INSERT INTO tickets
  (first_name, last_name, seat, airline_id, from_destination_id, to_destination_id)
VALUES
  ('Jennifer', 'Finch', '33B', 1, 1, 1),
  ('Thadeus', 'Gathercoal', '8A', 2, 2, 2),
  ('Sonja', 'Pauley', '12F', 3, 3, 3);
  -- ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  -- ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  -- ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  -- ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  -- ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  -- ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  -- ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');