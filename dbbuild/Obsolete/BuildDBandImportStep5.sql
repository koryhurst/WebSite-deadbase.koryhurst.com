/* This one basically parses the setlist table into songs and jams, then parses the jams into songs as well */

drop table if exists tblsong;
create table tblsong
(
SetlistID	int,
SongNr decimal(6,2),
SongText varchar(1024)
);

/*
select * from tblsetlist where instr(SetText, '"') > 0 ;
*/

/* This is the list of sets that are all one Jam */

/*
--select * from tblsetlist where instr(SetText, "/,") = 0 limit 50, 50;
*/

/* 
I think earlier, I backed up tblsetlist to tblsetlist2 
just while I was splitting the setlists
similarly, drop the setlist2 table 
recreate it as a backup for the setlist table,
that will be modified getting the songs.

*/
 
drop table if exists tblsetlist2;
create table tblsetlist2
(
SetlistID int,
ShowID	int,
LineNr int,
SetType char(11),
SetText varchar(1024)
);

insert tblsetlist2
select Setlistid, showid, linenr, settype, setText
from tblsetlist;


/* get rid of the escape character "/" for the commas */
update tblsetlist set SetText = replace(settext, "/,", ",");

/* move the sets that have no commas (single Jams) into tblsong*/

insert tblsong
select SetListID, 1, SetText
from tblsetlist
where instr(SetText, ",") = 0;

/* delete those single jam sets */
delete from tblsetlist where instr(SetText, ",") = 0;

/* this is the number of single songs / Jams in a set */

/*
SELECT max(LENGTH(settext) - LENGTH(REPLACE(settext, ',', ''))) from tblsetlist;
*/

/* 19 !!!!????  Which show? Answer = ShowID 1  */
/* note the having clause */

/*
SELECT * from tblsetlist having max(LENGTH(settext) - LENGTH(REPLACE(settext, ',', ''))) = 19  ;
*/

/* 
These are just tests for the following segment
essentially testing how to take the first song or jam from each set
and add it to tblSong.  Then trim that first song out of the setlist
 */

 /*
select SetListID, 1, instr(SetText, ","), substring(SetText, 1, instr(SetText, ",") - 1), left(SetText, 50)
from tblsetlist 
limit 10, 10;

select SetListID, 1, substring(SetText, 1, instr(SetText, ",") - 1), substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ",")), settext
from tblsetlist 
limit 10, 10;
*/

/* 
and here we do that 20 times (19 commas, 20 songs)
for the set that has the maximum number of commas.
*/

insert tblsong select SetListID, 1, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 1, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));

/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 2, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 2, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 3, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 3, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 4, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 4, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 5, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 5, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 6, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 6, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 7, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 7, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 8, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 8, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 9, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 9, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 10, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 10, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 11, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 11, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 12, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 12, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 13, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 13, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 14, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 14, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/


insert tblsong select SetListID, 15, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 15, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 16, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 16, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 17, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 17, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 18, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 18, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 19, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 19, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

insert tblsong select SetListID, 20, SetText from tblsetlist where instr(SetText, ",") = 0;
delete from tblsetlist where instr(SetText, ",") = 0;
insert tblsong select SetListID, 20, substring(SetText, 1, instr(SetText, ",") - 1) from tblsetlist;
update tblsetlist set settext = substring(SetText, instr(SetText, ",") + 1, length(SetText) - instr(SetText, ","));
/*select count(*) from tblsetlist;*/

/*Songs*/
/*select count(songtext) from tblsong where instr(songtext, '>') = 0;
/*select count(distinct songtext) from tblsong where instr(songtext, '>') = 0;

/*Jamz*/
/*select count(songtext) from tblsong where instr(songtext, '>') > 0;
/*select count(distinct songtext) from tblsong where instr(songtext, '>') > 0;

/*select distinct songtext from tblsong where instr(songtext, '>') = 0 order by songtext;

/*Get rid of leading blanks */
update tblsong set Songtext = right(songtext, length(songtext) - 1) where left(Songtext, 1) = ' ';



drop table if exists tbljam;
create table tbljam
(
SetListID	int,
SongNr int,
JamText varchar(1024)
);

insert tbljam select SetlistID, SongNr, SongText from tblsong where instr(songtext, '>') > 0;

/*select max(LENGTH(songtext) - LENGTH(REPLACE(songtext, '>', ''))) from tblsong where instr(songtext, '>') > 0 ;

/*select * from tblsong having max(LENGTH(songtext) - LENGTH(REPLACE(songtext, '>', ''))) = 16  ;

/*select * from tblsong where LENGTH(songtext) - LENGTH(REPLACE(songtext, '>', '')) = 16  ;*/

ALTER TABLE tbljam ADD JamID INT NOT NULL AUTO_INCREMENT KEY;
ALTER TABLE tblsong ADD JamID INT ;

/*Tag the original Jam in tblsong with the JamID*/

UPDATE tblsong, tbljam
set tblsong.JamID = tbljam.JamID
where tblsong.setlistid = tbljam.setlistid 
and tblsong.songnr = tbljam.songnr;

ALTER TABLE tblsong ADD JammedInto char(1);
ALTER TABLE tblsong ADD JammedOutOf char(1);

/* this is similar to the setlist into songs thing above */
insert tblsong
select SetListID, SongNr + 0.05, substring(SongText, 1, instr(SongText, ">") - 1), JamID, "", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.10 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/


insert tblsong
select SetListID, SongNr + 0.10, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.15 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.15, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.20 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.20, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.25 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.25, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.30 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/



insert tblsong
select SetListID, SongNr + 0.30, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.35 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.35, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.40 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.40, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.45 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.45, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.50 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.50, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.55 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.55, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.60 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/


insert tblsong
select SetListID, SongNr + 0.60, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.65 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.65, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.70 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/


insert tblsong
select SetListID, SongNr + 0.70, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.75 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.75, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.80 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/



insert tblsong
select SetListID, SongNr + 0.80, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.85 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

insert tblsong
select SetListID, SongNr + 0.85, substring(SongText, 1, instr(SongText, ">") - 1), JamID, ">", ">" from tblsong where instr(SongText, ">") > 0;
update tblsong set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1) where instr(SongText, ">") > 0 and truncate(songnr, 0) = songnr;
update tblsong set JammedInto = ">" where instr(SongText, ">") = 0 and JamID is not null and jammedinto <> "";
update tblsong set songnr = songnr + 0.85 where instr(SongText, ">") = 0 and JamID is not null and truncate(songnr, 0) = songnr;
/*select count(*) from tblsong where instr(SongText, ">") > 0;*/

/*last song of each jam has not been labelled as jammed into*/ 
/*weird.  Appears not case sensitive.*/
update tblsong set jammedinto = ">" where jamid is not null and jammedinto is null and jammedoutof is null;


drop table if exists tblsetlist;
alter table tblsetlist2 rename tblsetlist;