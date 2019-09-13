DELIMITER // 
CREATE PROCEDURE spParseJam(IN SongNr int) 
BEGIN 

declare @DecToAdd decimal(4,2);
declare @JamInto char(1);

IF SongNr = 1 THEN SET @JamInto = "";
else SET @JamInto = ">";
END IF;

set @DecToAdd = SongNr * 0.05;

insert tblsong
select SetListID, SongNr + @DecToAdd, substring(SongText, 1, instr(SongText, ">")), JamID, @JammedInto, ">"
from tblSong
where instr(SongText, ">") > 0;

update tblsong 
set songtext = right(songtext, length(songtext) - instr(songtext, ">") - 1)
from tblsong
where instr(SongText, ">") > 0;

update tblsong set JammedOutof = "" where instr(SetText, ">") = 0 and JamID is not null;
update tblsong set songnr = songnr + @DecToAdd + 0.05 where instr(SetText, ">") = 0 and JamID is not null;

END // 
DELIMITER ; 

