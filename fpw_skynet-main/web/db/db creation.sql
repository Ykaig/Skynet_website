/**
 * Author:  Giacomo
 * Created: 21 nov 2022
 */

/*
CREATE DATABASE skynet;
USE skynet;
*/

CREATE TABLE Account (
	username VARCHAR(50) PRIMARY KEY, 
	password VARCHAR(50) NOT NULL, 
	name VARCHAR(50) NOT NULL, 
	surname VARCHAR(50) NOT NULL, 
	email VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
        photo VARCHAR(100) NOT NULL
);

CREATE TABLE Movie (
    idMovie SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(500) NOT NULL,
    photo VARCHAR(100) NOT NULL,
    releaseDate DATE NOT NULL,
    runningTime SMALLINT NOT NULL,
    price REAL NOT NULL,
    score REAL NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    
    FOREIGN KEY(user_id) REFERENCES Account(username) ON UPDATE CASCADE ON DELETE CASCADE
);




INSERT INTO Account VALUES ('lecis', '65966', 'Giacomo', 'Lecis', 'g.lecis8@studenti.unica.it', 'France', 'img/profile_pics/pic01.jpg');
INSERT INTO Account VALUES ('musio', '65926', 'Gabriele', 'Musio', 'g.musio5@studenti.unica.it', 'Usa', 'img/profile_pics/pic02.jpg');
INSERT INTO Account VALUES ('massenti', '65985', 'Simone', 'Massenti', 's.massenti1@studenti.unica.it', 'Spain', 'img/profile_pics/pic03.jpg');


INSERT INTO Movie VALUES(default, 'Uncharted', 'Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor "Sully" Sullivan to recover a fortune amassed by Ferdinand Magellan, and lost 500 years ago by the House of Moncada.',
'img/posters/movie_01.jpg', '2022-02-11', 116, 4.99, 4.8, 'lecis');
INSERT INTO Movie VALUES(default, 'Black Panther: Wakanda Forever', 'The people of Wakanda fight to protect their home from intervening world powers as they mourn the death of King T-Challa.',
'img/posters/movie_02.jpg', '2022-11-09', 161, 5.50, 3.9, 'lecis');
INSERT INTO Movie VALUES(default, 'Top Gun: Maverick', 'After thirty years, Maverick is still pushing the envelope as a top naval aviator, but must confront ghosts of his past when he leads TOP GUN s elite graduates on a mission that demands the ultimate sacrifice from those chosen to fly it.',
'img/posters/movie_03.jpg', '2022-05-25', 130, 8.50, 5.00, 'musio');
INSERT INTO Movie VALUES(default, 'Avatar: The Way of Water', 'Jake Sully and Ney-tiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora. When an ancient threat resurfaces, Jake must fight a difficult war against the humans.',
'img/posters/movie_04.jpg', '2022-12-14', 190, 9.99, 4.6, 'musio');
INSERT INTO Movie VALUES(default, 'Oppenheimer', 'Physicist J Robert Oppenheimer works with a team of scientists during the Manhattan Project, leading to the development of the atomic bomb.',
'img/posters/movie_05.jpg', '2023-07-21', 150, 11.50, 3.7, 'massenti');

