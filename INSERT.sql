-- Заполнение таблицы исполнителей:
INSERT INTO Artist (name, year_formed)
VALUES ('Исполнитель 1', 2000),
       ('Исполнитель 2', 2005),
       ('Исполнитель 3', 2010),
       ('Исполнитель 4', 2015);
-- Заполнение таблицы жанров:
INSERT INTO Genre (name)
VALUES ('Жанр 1'),
       ('Жанр 2'),
       ('Жанр 3');
-- Заполнение таблицы альбомов:
INSERT INTO Album (title, year, artist_id)
VALUES ('Альбом 1', 2010, 1),
       ('Альбом 2', 2015, 2),
       ('Альбом 3', 2020, 3);
--Заполнение таблицы треков:
INSERT INTO Track (title, duration, album_id)
VALUES ('Трек 1', '05:00', 1),
       ('Трек 2', '04:30', 1),
       ('Трек 3', '03:45', 2),
       ('Трек 4', '04:20', 2),
       ('Трек 5', '06:15', 3),
       ('Трек 6', '03:55', 3);
--Заполнение таблицы Collections:
INSERT INTO Compilation (title, year)
VALUES ('Сборник 1', 2015),
       ('Сборник 2', 2020),
       ('Сборник 3', 2018);
--Заполнение таблицы ArtistGenres:
INSERT INTO ArtistGenre (artist_id, genre_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (3, 3),
       (4, 1);
-- Заполнение таблицы ArtistAlbum:
INSERT INTO ArtistAlbum (artist_id, album_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 3);
Заполнение таблицы связи CompilationTrack:
INSERT INTO CompilationTrack (compilation_id, track_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 4),
       (2, 5),
       (2, 6),
       (3, 1),
       (3, 3),
       (3, 5);