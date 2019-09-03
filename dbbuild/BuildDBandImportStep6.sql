/* normalizes the songs table   */
/* extracts the footnote tags of songs   */



/*select * from tblsong where right(songtext, 4) = "****";*/
/*select * from tblsong where right(songtext, 3) = "***";*/

/* Move the footnote characters into their own field */
ALTER TABLE tblsong ADD Footnote char(3);

update tblsong set Footnote = '***' where right(songtext, 3) = '***';
/* select * from tblsong where right(songtext, 3) = '***'; */
update tblsong set songtext = left(songtext, length(songtext) - 3) where right(songtext, 3) = '***';
/* select * from tblsong where footnote = '***';*/


update tblsong set Footnote = '**' where right(songtext, 2) = '**';
/* select * from tblsong where right(songtext, 2) = '**';*/
update tblsong set songtext = left(songtext, length(songtext) - 2) where right(songtext, 2) = '**';
/* select * from tblsong where footnote = '**';*/


update tblsong set Footnote = '*' where right(songtext, 1) = '*';
/* select * from tblsong where right(songtext, 1) = '*';*/
update tblsong set songtext = left(songtext, length(songtext) - 1) where right(songtext, 1) = '*';
/* select * from tblsong where footnote = '*';*/

update tblsong set Footnote = '@' where right(songtext, 1) = '@';
/* select * from tblsong where right(songtext, 1) = '@';*/
update tblsong set songtext = left(songtext, length(songtext) - 1) where right(songtext, 1) = '@';
/* select * from tblsong where footnote = '@';*/

/* checking for non alphanumeric characters ?  I think */

/*in order lcase ucase number period*/
/*
select * from tblsong 
where (ascii(right(songtext, 1)) not between 97 and 122) 
and (ascii(right(songtext, 1)) not between 65 and 90)
and (ascii(right(songtext, 1)) not between 48 and 57)
and ascii(right(songtext, 1)) <> 46;
*/
/* fix bad apostrophes */
/* 
select * from tblsong where songtext = 'nobody?s fault';
*/ 
update tblsong set songtext = "nobody's fault" where songtext = 'nobody?s fault';

/* 
select * from tblsong where songtext = 'he?s gone';
*/
update tblsong set songtext = "he's gone" where songtext = 'he?s gone';


/*select * from tblsong where songtext = 'my babe';*/
/*select * from tblsong where songtext = 'my baby left me';*/
/*
select * from tblsetlist where setlistid in (171,3022);
*/

update tblshow 
set mynotes = "Jerry Garcia played a verse of this with the Grateful Dead on 18 April 1986, before switching to That's All Right Mama. There is no record of him playing it with any of his solo bands."
where showid = 1869;

/* I dont know what happened to tblsetlistsongdetail or why it exists.*/
/* either way, this is about normalizing a real tblsong. */

drop table if exists tblsetlistsongdetail;
alter table tblsong rename tblsetlistsongdetail;


drop table if exists tblsong;

create table tblsong
(
SongText varchar(1024),
MainVocals varchar(128)
);


insert tblsong
select distinct songtext, null
from tblsetlistsongdetail
order by songtext;

alter table tblsong add SongID INT NOT NULL AUTO_INCREMENT KEY;

alter table tblsetlistsongdetail add SongID INT ;

/* LONG UPDATE WARNING */
/* connecting the 2 tables */
UPDATE tblsong, tblsetlistsongdetail 
set tblsetlistsongdetail.SongID = tblsong.SongID 
where tblsong.songtext = tblsetlistsongdetail.songtext;

alter table tblsetlistsongdetail drop SongText;

alter table tblcountry modify countryid smallint;
alter table tblcountry modify countryname varchar(20);

alter table tbljam modify setlistID smallint;
alter table tbljam modify songnr smallint;
alter table tbljam modify jamtext varchar(255);
alter table tbljam modify jamID smallint;

alter table tblsetlist modify setlistID smallint;
alter table tblsetlist modify showID smallint;
alter table tblsetlist modify linenr smallint;
alter table tblsetlist modify settype varchar(11);
alter table tblsetlist modify settext varchar(511);

alter table tblsetlistsongdetail modify setlistID smallint;

/* 
this was the error that I made previously.
I converted songnr to smallint before dealing with the 
decimals, used to sort them out.

For now, I am just not doing it.

*/

/*alter table tblsetlistsongdetail modify songnr smallint;*/

alter table tblsetlistsongdetail modify jamID smallint;
alter table tblsetlistsongdetail modify songID smallint;

alter table tblshow modify ShowID         smallint       ;
alter table tblshow modify ShowDate       date          ;
alter table tblshow modify ShowName       varchar(31)   ;
alter table tblshow modify DeadBaseID     smallint       ;
alter table tblshow modify VenueID        smallint       ;
alter table tblshow modify TapeRank       smallint       ;
alter table tblshow modify GotIT          smallint       ;
alter table tblshow modify Quality        smallint       ;
alter table tblshow modify MyNotes        varchar(255)  ;
alter table tblshow modify ShowNotes      varchar(1023) ;
alter table tblshow modify ShowFirstLine  varchar(127) ;

alter table tblsong modify SongText   varchar(31);
alter table tblsong modify MainVocals  varchar(63);
alter table tblsong modify SongID     smallint;      

alter table tblstate modify  StateID            smallint;
alter table tblstate modify  StateName          varchar(31) ;
alter table tblstate modify  StateAbbreviation  char(2)     ;

alter table tblvenue modify VenueID    smallint      ;
alter table tblvenue modify Venue      varchar(63) ;
alter table tblvenue modify City       varchar(31) ;
alter table tblvenue modify StateID    smallint     ;
alter table tblvenue modify CountryID  smallint      ;
