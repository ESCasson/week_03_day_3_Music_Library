DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artist_list;


CREATE TABLE artist_list(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE album_list(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  genre VARCHAR,
  artist_id INT REFERENCES artist_list(id)
);
