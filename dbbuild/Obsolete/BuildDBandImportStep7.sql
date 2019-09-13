/* This step fixes the line numbers of the separated out jam songs.
effectively removing the decimal points 
*/

ALTER TABLE tblsetlistsongdetail ADD SetListSongID INT NOT NULL AUTO_INCREMENT KEY;

drop table if exists tblNewRank;
create table tblNewRank
(
SetListSongID int,
SongNr smallint
);

/* THIS HAS TO BE EXECUTED IN THE MYSQL COMMAND LINE, NOT IN 
MYSQL WORKBENCH.  TOO BIG A QUERY */
insert tblNewRank
 Select * 
from 
(select SetListSongID,  
	(select 1 + count(*) 
    from tblsetlistsongdetail b 
    where b.SetlistID = a.SetlistID 
    and b.SongNr < a.songnr) RANK 
    from tblsetlistsongdetail a) as x;
	
update tblsetlistsongdetail s, tblnewrank r
set s.SongNr =r.SongNr
where s.SetListSongID = r.SetListSongID;
