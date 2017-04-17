DROP TABLE IF EXISTS pokemons;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  cp INT,
  poke_type VARCHAR,
  img_url VARCHAR
);
