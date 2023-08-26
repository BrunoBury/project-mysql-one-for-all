SELECT
    songs.song_name AS cancao,
    COUNT(user_history.history_id) AS reproducoes
FROM
    songs
JOIN
    user_history ON songs.song_id = user_history.song_id
GROUP BY
    songs.song_id
ORDER BY
    reproducoes DESC, cancao
LIMIT 2;
