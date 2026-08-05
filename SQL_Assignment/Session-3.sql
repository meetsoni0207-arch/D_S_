-- Session 3
-- Task 1.
USE music_streaming_app;

CREATE TABLE fav_playlists (
id INT PRIMARY KEY,
Song_name VARCHAR(40),
Artist Varchar(40),
Duration INT
);

INSERT INTO fav_playlists
VALUES
(1,"Song A","Arjit singh", 1.30 );

-- Task 2.

INSERT INTO fav_playlists VALUES
(2,"Song B","Badshah", 1.56),
(3,"Song C","Diljit", 2.30),
(4,"Song D","Aditya", 1.00);

-- Task 3.

UPDATE fav_playlists
SET
Artist = "Arijit Singh"
WHERE Artist = "Arijit";

-- Task 4.

DELETE FROM fav_playlists
WHERE Duration < 2;


-- Task 5. 

UPDATE fav_playlists
SET Song_name = concat(Song_name,"(remix)")
WHERE Artist ="Arijit" AND Duration > 2;

