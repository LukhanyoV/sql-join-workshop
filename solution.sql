-- Find out how many customers there are in the database.
SELECT
    COUNT(*)
FROM
    "Customer";

-- Find out how many employees there are in the database.
SELECT
    COUNT(*)
FROM
    "Employee";

-- Find all the artists
SELECT
    "Name"
FROM
    "Artist";

-- Find all the media types
SELECT
    "Name"
FROM
    "MediaType";

-- Find all the playlist names
SELECT
    "Name"
FROM
    "Playlist";

-- Find all the playlist name and their track name
SELECT
    "Playlist"."Name" AS "PlaylistName",
    "Track"."Name" AS "TrackName"
FROM
    "Playlist"
    JOIN "PlaylistTrack" ON "PlaylistTrack"."PlaylistId" = "Playlist"."PlaylistId"
    JOIN "Track" ON "Track"."TrackId" = "PlaylistTrack"."TrackId"
WHERE
    "Playlist"."Name" = 'Music';

-- Find all the tracks that have media type 'MPEG'
SELECT
    "Track"."Name"
FROM
    "Track"
    JOIN "MediaType" ON "Track"."MediaTypeId" = "MediaType"."MediaTypeId"
WHERE
    "MediaType"."Name" LIKE 'MPEG%';

-- Find all the tracks that have media type 'AAC'
SELECT
    "Track"."Name"
FROM
    "Track"
    JOIN "MediaType" ON "Track"."MediaTypeId" = "MediaType"."MediaTypeId"
WHERE
    "MediaType"."Name" LIKE 'AAC%';

-- Find all the artist that have the max number of tracks
SELECT * FROM (SELECT
    "Artist"."Name",
    COUNT("Track"."Name") AS "NumberOfTracks"
FROM
    "Artist"
    JOIN "Album" ON "Artist"."ArtistId" = "Album"."ArtistId"
    JOIN "Track" ON "Track"."AlbumId" = "Album"."AlbumId"
GROUP BY
    "Artist"."Name") AS "BigTable"
WHERE
    "NumberOfTracks" = (
        SELECT
            MAX("NumberOfTracks")
        FROM
            (
                SELECT
                    "Artist"."Name",
                    COUNT("Track"."Name") AS "NumberOfTracks"
                FROM
                    "Artist"
                    JOIN "Album" ON "Artist"."ArtistId" = "Album"."ArtistId"
                    JOIN "Track" ON "Track"."AlbumId" = "Album"."AlbumId"
                GROUP BY
                    "Artist"."Name"
            ) AS "Table"
    );

-- Find all the artist that have least tracks.
SELECT * FROM (SELECT
    "Artist"."Name",
    COUNT("Track"."Name") AS "NumberOfTracks"
FROM
    "Artist"
    JOIN "Album" ON "Artist"."ArtistId" = "Album"."ArtistId"
    JOIN "Track" ON "Track"."AlbumId" = "Album"."AlbumId"
GROUP BY
    "Artist"."Name") AS "BigTable"
WHERE
    "NumberOfTracks" = (
        SELECT
            MIN("NumberOfTracks")
        FROM
            (
                SELECT
                    "Artist"."Name",
                    COUNT("Track"."Name") AS "NumberOfTracks"
                FROM
                    "Artist"
                    JOIN "Album" ON "Artist"."ArtistId" = "Album"."ArtistId"
                    JOIN "Track" ON "Track"."AlbumId" = "Album"."AlbumId"
                GROUP BY
                    "Artist"."Name"
            ) AS "Table"
    );