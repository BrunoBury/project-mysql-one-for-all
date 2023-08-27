SELECT
    COUNT(*) AS musicas_no_historico
FROM
    user_history AS uh
JOIN
    users AS u ON uh.user_id = u.user_id
WHERE
    u.users_name = 'Barbara Liskov';
