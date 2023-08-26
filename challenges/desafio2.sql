SELECT
    (SELECT COUNT(*) FROM songs) AS cancoes,
    (SELECT COUNT(DISTINCT artist_id) FROM artists) AS artistas,
    (SELECT COUNT(*) FROM albums) AS albuns;
