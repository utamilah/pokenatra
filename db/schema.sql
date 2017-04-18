DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

CREATE TABLE trainers (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  level INTEGER,
  img_url VARCHAR
);

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  cp INTEGER,
  poke_type VARCHAR,
  img_url VARCHAR,
  trainer_id INTEGER
);
