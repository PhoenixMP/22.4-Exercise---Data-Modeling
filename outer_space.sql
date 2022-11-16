-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbital_center
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy INTEGER REFERENCES galaxy NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbital_center NOT NULL
);

CREATE TABLE moons_planets
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  moon_id INTEGER REFERENCES moons
);



INSERT INTO galaxy
(name)
VALUES ('Milky Way');

INSERT INTO moons
(name)
VALUES ('The Moon'),
('Phobos'),  
('Deimos'),
('Naiad' ),
('Thalassa'), 
('Despina' ),
('Galatea'),
('Larissa'),
('S/2004 N 1'),
('Proteus'),
('Triton'),
('Nereid'),
('Halimede'), 
('Sao'),
('Laomedeia'), 
('Psamathe'),
('Neso');

INSERT INTO orbital_center
(name, galaxy)
VALUES ('The Sun',1),('Proxima Centauri',1),('Gliese 876',1);



INSERT INTO planets
  (name, orbital_period_in_years, orbits_around)

VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62,1),
  ('Neptune', 164.8, 1 ),
  ('Proxima Centauri b', 0.03, 1),
  ('Gliese 876 b', 0.23, 2 );


INSERT INTO moons_planets 
(planet_id,moon_id)
VALUES
(1,1),
(2,2),
(2,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10),
(4,11),
(4,12),
(4,13),
(4,14),
(4,15),
(4,16),
(4,17);

INSERT INTO moons_planets 
(planet_id)
VALUES
(3),
(5),
(6);
