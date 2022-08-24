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

SELECT musical_genres.name, COUNT(musicians.name)
FROM musical_genres JOIN musicians
ON musical_genres.name = musicians.genre
GROUP BY musical_genres.name
ORDER BY COUNT(musicians.name) DESC;

SELECT Music_albums.name, COUNT(music_tracks.name)
FROM Music_albums JOIN music_tracks
ON Music_albums.id = music_tracks.album_id
WHERE Music_albums.date BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY Music_albums.name;


SELECT Music_albums.name,AVG(music_tracks.duration)
FROM Music_albums JOIN music_tracks
ON Music_albums.id = music_tracks.album_id
GROUP BY Music_albums.name;


SELECT name FROM musicians
WHERE name NOT IN (SELECT musicians.name
FROM musicians JOIN Music_albums
ON musicians.name = Music_albums.musician
WHERE Music_albums.date > '1970/01/01' AND Music_albums.date < '1979/12/31');


SELECT collections.name
FROM collections JOIN music_tracks
ON collections.tracks = music_tracks.name
JOIN music_albums 
ON music_tracks.album_id = music_albums.id
JOIN musicians
ON music_albums.musician = musicians."name"
WHERE musicians.name = 'Eminem';


SELECT music_albums.name, COUNT(musicians.genre)
FROM music_albums JOIN musicians
ON music_albums.musician = musicians.name
GROUP BY music_albums.name
HAVING COUNT(musicians.genre) > 1;

SELECT music_tracks.name
FROM music_tracks JOIN collections
ON music_tracks.name = collections.tracks
WHERE music_tracks.name != collections.tracks;

SELECT musicians.name, music_tracks.duration
FROM musicians JOIN music_albums
ON musicians.name = music_albums.musician
JOIN music_tracks
ON music_albums.id = music_tracks.album_id
WHERE music_tracks.duration = (SELECT min(music_tracks.duration) FROM music_tracks);

SELECT DISTINCT music_albums.name, MIN(COUNT(music_tracks.name)) OVER () track_count
FROM music_albums JOIN music_tracks
ON music_albums.id = music_tracks.album_id
GROUP BY music_albums.name;