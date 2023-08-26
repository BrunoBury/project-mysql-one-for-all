DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50) NOT NULL,
    plan_description TEXT,
    plan_price DECIMAL(10, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    users_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    subscription_date DATE,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) ENGINE = InnoDB;

CREATE TABLE artists (
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100)
) ENGINE = InnoDB;

CREATE TABLE albums (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100),
    release_year INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) ENGINE = InnoDB;

CREATE TABLE songs (
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100),
    duration_seconds INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) ENGINE = InnoDB;

CREATE TABLE user_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    song_id INT,
    play_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id),
    CONSTRAINT unique_play UNIQUE (user_id, song_id, play_date)
) ENGINE = InnoDB;

CREATE TABLE following (
    following_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    CONSTRAINT unique_following UNIQUE (user_id, artist_id)
) ENGINE = InnoDB;


INSERT INTO plans (plan_name, plan_description, plan_price)
VALUES
    ('gratuito', NULL, 0.00),
    ('familiar', NULL, 7.99),
    ('universitário', NULL, 5.99),
    ('pessoal', NULL, 6.99);

INSERT INTO users (users_name, age, plan_id, subscription_date)
VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO artists (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO albums (album_name, release_year, artist_id)
VALUES
    ('Renaissance', 2022, (SELECT artist_id FROM artists WHERE artist_name = 'Beyoncé')),
    ('Jazz', 1978, (SELECT artist_id FROM artists WHERE artist_name = 'Queen')),
    ('Hot Space', 1982, (SELECT artist_id FROM artists WHERE artist_name = 'Queen')),
    ('Falso Brilhante', 1998, (SELECT artist_id FROM artists WHERE artist_name = 'Elis Regina')),
    ('Vento de Maio', 2001, (SELECT artist_id FROM artists WHERE artist_name = 'Elis Regina')),
    ('QVVJFA?', 2003, (SELECT artist_id FROM artists WHERE artist_name = 'Baco Exu do Blues')),
    ('Somewhere Far Beyond', 2007, (SELECT artist_id FROM artists WHERE artist_name = 'Blind Guardian')),
    ('I Put A Spell On You', 2012, (SELECT artist_id FROM artists WHERE artist_name = 'Nina Simone'));

INSERT INTO songs (song_id, song_name, duration_seconds, album_id)
VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGOS GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Dont Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard s Song', 244, 7),
    (10, 'Feeling Good', 100, 8);


INSERT INTO user_history (user_id, song_id, play_date)
VALUES
    (1, 2, '2022-02-28 10:45:55'),
    (1, 8, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 7, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

INSERT INTO following (user_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (3, 6),
    (4, 1),
    (5, 3),
    (6, 2),
    (6, 4),
    (7, 5),
    (8, 6),
    (9, 1),
    (10, 3);
