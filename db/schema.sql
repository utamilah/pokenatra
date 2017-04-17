DROP TABLE IF EXISTS pokemon;

CREATE TABLE pokemon(
  id SERIAL PRIMARY KEY,
  poke_type VARCHAR,
  cp INT,
  img_url VARCHAR
);
