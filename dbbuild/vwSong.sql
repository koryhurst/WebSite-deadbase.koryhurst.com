CREATE VIEW vwSong
    AS 
  
select ShowID, tsl.SetListID, ts.SongID, SongText, MainVocals
from tblsong as ts 
inner join tblsetlistsongdetail as td on ts.SongID = td.SongID 
inner join tblsetlist as tsl on tsl.SetlistID = td.SetlistID

  