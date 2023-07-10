CREATE TABLE Genres (
  genre_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

CREATE TABLE Artists (
  artist_id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE Albums (
  album_id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  year INTEGER CHECK (year >= 1900)
);

CREATE TABLE Tracks (
  track_id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  duration INTEGER CHECK (duration > 0),
  album_id INTEGER REFERENCES Albums(album_id),
  CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE Collections (
  collection_id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  year INTEGER CHECK (year >= 1900),
  CONSTRAINT unique_title UNIQUE (title)
);

CREATE TABLE CollectionTracks (
  collection_id INTEGER REFERENCES Collections(collection_id),
  track_id INTEGER REFERENCES Tracks(track_id),
  PRIMARY KEY (collection_id, track_id)
);
CREATE TABLE ArtistGenre (
  artist_id INTEGER REFERENCES Collections(artist_id),
  genre_id  INTEGER REFERENCES Tracks(genre_id,|)
  PRIMARY KEY (artist_id, genre_id)
);
CREATE TABLE AlbumArtists (
  album_id INTEGER REFERENCES Collections(album_id),
  artist_id INTEGER REFERENCES Tracks(artist_id),
  PRIMARY KEY (album_id,artist_id)
);