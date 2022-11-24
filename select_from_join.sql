-- выборка наменование альбома, наименование артиста
SELECT row_number() OVER() AS number_str, al.Title AS name_title, ar.Name AS name_artists
FROM artists ar
LEFT JOIN albums al
ON al.ArtistId = ar.ArtistId;

-- выборка наименования альбома связанного с треком, композитора/исполнителя трека, типа файла, жанра и цены
SELECT row_number() OVER() AS number_str, al.Title AS name_album, tr.Name AS track, tr.Composer AS composer, mt.Name AS type_media, gr.Name AS genre, tr.UnitPrice AS price
FROM tracks tr
LEFT JOIN albums al ON al.AlbumId = tr.AlbumId
LEFT JOIN genres gr ON gr.GenreID = tr.GenreId
LEFT JOIN media_types mt ON mt.MediaTypeId = tr.MediaTypeId;

-- просчет количества строк
SELECT COUNT(al.Title) AS count_rows
FROM tracks tr
LEFT JOIN albums al ON al.AlbumId = tr.AlbumId
LEFT JOIN genres gr ON gr.GenreID = tr.GenreId
LEFT JOIN media_types mt ON mt.MediaTypeId = tr.MediaTypeId;

-- выборка наименования альбома связанного с треком, композитора/исполнителя трека, типа файла, жанра, длительности в миллисекунды
SELECT row_number() OVER() AS number_str, al.Title AS name_album, tr.Name AS track, tr.Composer AS composer, mt.Name AS type_media, gr.Name AS genre, tr.Milliseconds AS millisec
FROM tracks tr
LEFT JOIN albums al ON al.AlbumId = tr.AlbumId
LEFT JOIN genres gr ON gr.GenreID = tr.GenreId
LEFT JOIN media_types mt ON mt.MediaTypeId = tr.MediaTypeId
WHERE type_media = 'Protected AAC audio file' AND millisec > 210000 AND millisec < 250000;

-- выборка покупателя, его города-страны, цены
SELECT row_number() OVER() AS number_str, cst.FirstName, cst.LastName, cst.City, cst.Country, inv.Total
FROM customers cst
INNER JOIN invoices inv ON inv.CustomerId = cst.CustomerId;

--вывести общую цену альбома с определенным исполнителями "Accept" с названием альбома "Balls to the Wall"
SELECT al.Title AS name_album, ar.Name AS artist, gr.Name AS genre, SUM (tr.UnitPrice)
FROM tracks tr
INNER JOIN albums al ON tr.AlbumId = al.AlbumId
INNER JOIN artists ar ON ar.ArtistId = ar.ArtistId
INNER JOIN genres gr ON gr.GenreId = tr.GenreId
INNER JOIN playlist_track pls ON tr.TrackId = pls.TrackId
INNER JOIN playlists pl ON pl.PlaylistId = pls.PlaylistId
WHERE artist = 'Accept' AND name_album = 'Balls to the Wall';



















