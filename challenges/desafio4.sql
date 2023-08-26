SELECT
    users_name AS pessoa_usuaria,
    CASE
        WHEN MAX(play_date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    users
LEFT JOIN
    user_history ON users.user_id = user_history.user_id
GROUP BY
    users_name
ORDER BY
    users_name;
