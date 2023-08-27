SELECT
    a.artist_name AS artista,
    al.album_name AS album
FROM
    artists AS a
JOIN
    albums AS al ON a.artist_id = al.artist_id
WHERE
    a.artist_name = 'Elis Regina'
ORDER BY
    al.album_name ASC;
