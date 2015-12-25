/* This file creates the tables */
drop table if exists tblvenue ;
create table tblvenue
(
VenueID int,
Venue varchar(100),
City varchar(100),
StateID int,
CountryID int
);

drop table if exists tblstate;
create table tblstate
(
StateID int,
StateName varchar(50),
StateAbbreviation char(2)
);

drop table if exists tblcountry;
create table tblcountry
(
CountryID int,
CountryName varchar(25)
);

 
drop table if exists tblshow;
create table tblshow
(
ShowID int,
ShowDate date,
ShowName varchar(30),
DeadBaseID int,
VenueID int,
TapeRank int,
GotIT int,
Quality int,
MyNotes varchar(255)
);

 
drop table if exists tblsetlist;
create table tblsetlist
(
ShowID int,
LineNr int,
SetText varchar(1024)
);

/*This table may be not required */

drop table if exists tblsetlist2;
create table tblsetlist2
(
ShowID int,
LineNr int,
SetText varchar(1024),
SetlistID int
);
 
 drop table if exists tbljam;
create table tbljam
(
SetListID int,
SongNr int,
JamText varchar(1024)
);
drop table if exists tblsong;
create table tblsong
(
SetlistID int,
SongNr decimal(6,2),
SongText varchar(1024)
);

