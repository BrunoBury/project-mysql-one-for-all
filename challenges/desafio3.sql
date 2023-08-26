SELECT 
    users.users_name AS 'pessoa_usuaria',
    COUNT(user_history.song_id) AS 'musicas_ouvidas',
    ROUND(SUM(songs.duration_seconds) / 60, 2) AS 'total_minutos'
FROM
    SpotifyClone.users AS users
    INNER JOIN
    SpotifyClone.user_history AS user_history
    ON users.user_id = user_history.user_id 
    INNER JOIN
    SpotifyClone.songs AS songs
    ON songs.song_id = user_history.song_id
GROUP BY users.users_name
ORDER BY users.users_name;
