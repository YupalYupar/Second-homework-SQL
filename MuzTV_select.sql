SELECT name, date FROM music_albums
WHERE date BETWEEN  '1979-01-01' AND '1979-12-31';

SELECT name, duration  FROM music_tracks
WHERE duration = (SELECT MAX(duration) FROM music_tracks);

SELECT name, duration FROM music_tracks
WHERE duration >= '00:03:30';

SELECT DISTINCT name, date FROM collections
WHERE date BETWEEN '1998-01-01' AND '2000-12-31';

SELECT name FROM musicians
WHERE (LENGTH(name) - LENGTH(REPLACE(name, ' ', ''))+1)<2;

SELECT name FROM music_tracks
WHERE name LIKE '%My%' OR name LIKE '%my%';


