
use dbgrateful;


drop view if exists vwshow;
create view vwshow AS 
select 
ts.ShowID,
ts.DeadbaseID,
ts.ShowDate,
ts.ShowName,
ts.ShowFirstLine,
ts.ShowNotes,
ts.MyNotes,
ts.TapeRank,
tv.Venue,
tv.City,
tst.StateName,
tc.CountryName,
ts.GotIT 
from (((tblshow ts join tblvenue tv on((ts.VenueID = tv.VenueID))) 
join tblstate tst on((tst.StateID = tv.StateID))) 
join tblcountry tc on((tc.countryid = tv.CountryID)));


drop view if exists vwsong;
create view vwsong AS 
select 
tsl.ShowID,
tsl.SetListID,
ts.SongID,
ts.SongText,
ts.MainVocals
from ((tblsong ts join tblsetlistsongdetail td on((ts.SongID = td.songID))) 
join tblsetlist tsl on((tsl.setlistID = td.setlistID)));

