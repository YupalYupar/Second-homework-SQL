CREATE TABLE IF NOT EXISTS Musical_genres 
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(17) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicians
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(21) NOT NULL,
   genre VARCHAR(17) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician_Genres
(
   genre_id INTEGER NOT NULL REFERENCES Musical_genres(id),
   musician_id INTEGER NOT NULL REFERENCES Musicians(id),
   CONSTRAINT Musician_genre_pk PRIMARY KEY (genre_id,musician_id)
);

CREATE TABLE IF NOT EXISTS Music_albums
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(21) NOT NULL,
   date DATE,
   musician VARCHAR(21) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicians_albums
(
   musician_id INTEGER NOT NULL REFERENCES Musicians(id),
   album_id INTEGER NOT NULL REFERENCES Music_albums(id),
   CONSTRAINT Musician_album_pk PRIMARY KEY (musician_id,album_id)
);

CREATE TABLE IF NOT EXISTS Music_tracks
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(31) NOT NULL,
   duration TIME NOT NULL,
   album VARCHAR NOT NULL,
   album_id INTEGER NOT NULL REFERENCES Music_albums(id)
);

CREATE TABLE IF NOT EXISTS Collections
(
   id SERIAL PRIMARY KEY,
   name VARCHAR(21) NOT NULL,
   date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Track_collection
(
   track_id INTEGER NOT NULL REFERENCES Music_tracks(id),
   collection_id INTEGER NOT NULL REFERENCES Collections(id),
   CONSTRAINT track_collection_pk PRIMARY KEY (track_id,collection_id)
   
);
ALTER TABLE Collections
ADD tracks VARCHAR(31) NOT NULL;

ALTER TABLE Music_tracks 
DROP COLUMN album;