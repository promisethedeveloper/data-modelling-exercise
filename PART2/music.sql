-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

DROP TABLE IF EXISTS producers CASCADE;
DROP TABLE IF EXISTS artists CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS songs CASCADE;
DROP TABLE IF EXISTS producers_songs CASCADE;
DROP TABLE IF EXISTS artists_songs CASCADE;


CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL

);

CREATE TABLE producers_songs
(
  id SERIAL PRIMARY KEY,
  producer_id INTEGER NOT NULL REFERENCES producers ON DELETE CASCADE,
  song_id INTEGER REFERENCES songs ON DELETE SET NULL,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL
);

CREATE TABLE artists_songs
(
  id SERIAL PRIMARY KEY,
  artist_id INTEGER NOT NULL REFERENCES artists ON DELETE CASCADE,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL
);

INSERT INTO producers (name)
VALUES 
  ('Don Jazzy'),
  ('MasterKraft'),
  ('Shizzi'),
  ('Pheelz'),
  ('Sarz');
  
  
INSERT INTO artists (name)
VALUES 
  ('Wizkid'),
  ('Burna Boy'),
  ('Davido'),
  ('Olamide'),
  ('Flavour');
  
  
INSERT INTO albums (title)
VALUES
  ('Made in Lagos'),
  ('Twice as tall'),
  ('A better time'),
  ('UY SCUTI'),
  ('Thankful');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('True love', 238, '2020-05-02', 1),
  ('Way too big', 245, '2020-02-14', 2),
  ('Holy ground', 250, '2020-07-11', 3),
  ('Pon Pon', 285, '2020-09-02', 4),
  ('Keneya', 277, '2017-10-12', 5);
  

INSERT INTO artists_songs
  (artist_id, song_id, album_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);

INSERT INTO producers_songs
  (producer_id, song_id, album_id)
VALUES
  (5, 1, 2),
  (4, 2, 3),
  (3, 3, 4),
  (2, 4, 5),
  (1, 5, 1);
  





-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');