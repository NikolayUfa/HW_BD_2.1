--Название и продолжительность самого длительного трека:
SELECT title, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;
-- Название треков, продолжительность которых не менее 3,5 минут:
SELECT title
FROM Tracks
WHERE duration >= '03:30';
-- Названия сборников, вышедших в период с 2018 по 2020 год включительно:
SELECT title
FROM Compilation
WHERE year >= 2018 AND year <= 2020;
--Исполнители, чьё имя состоит из одного слова:
SELECT name
FROM Artist
WHERE name NOT LIKE '% %';
--Название треков, которые содержат слово «мой» или «my»:
SELECT title
FROM Tracks
WHERE title LIKE '%мой%' OR title LIKE '%my%';
-- Количество исполнителей в каждом жанре:
SELECT Genre.name, COUNT(ArtistGenre.artist_id) AS count
FROM Genre
LEFT JOIN ArtistGenre ON Genre.id = ArtistGenre.genre_id
GROUP BY Genre.name;
--Количество треков, вошедших в альбомы 2019–2020 годов:
SELECT COUNT(Track.id) AS count
FROM Tracks
JOIN Album ON Track.album_id = Album.id
WHERE Album.release_year BETWEEN 2019 AND 2020;
--Средняя продолжительность треков по каждому альбому:
SELECT Album.title, AVG(SEC_TO_TIME(TIME_TO_SEC(Track.duration))) AS average_duration
FROM Album
JOIN Tracks ON Album.id = Track.album_id
GROUP BY Album.title;
--Все исполнители, которые не выпустили альбомы в 2020 году:
SELECT Artist.name
FROM Artist
LEFT JOIN ArtistAlbum ON Artist.id = ArtistAlbum.artist_id
LEFT JOIN Album ON ArtistAlbum.album_id = Album.id
WHERE Album.id IS NULL OR Album.release_year != 2020;
--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами):
--Предположим, что выбранный исполнитель имеет id = 1.

SELECT Compilation.title
FROM Compilation
JOIN CompilationTrack ON Compilation.id = CompilationTrack.compilation_id
JOIN Tracks ON CompilationTrack.track_id = Track.id
JOIN Album ON Track.album_id = Album.id
JOIN ArtistAlbum ON Album.id = ArtistAlbum.album_id
WHERE ArtistAlbum.artist_id = 1;