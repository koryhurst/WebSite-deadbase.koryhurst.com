drop table if exists tblsong;

/* RUN ALL OF THESE FROM THE MYSQL COMMAND LINE */

create table tblsong
(
SongID int,
JamID int,
SongNr int,
SongText varchar(1024),
JammedOutOf char(1)
);
