CREATE VIEW vwshow 
    AS 
  
select ts.ShowID, DeadbaseID, ShowDate, ShowName, ShowFirstLine, ShowNotes, 
MyNotes, TapeRank,  Venue, City, StateName, CountryName
from tblshow as ts inner join tblvenue as tv on ts.VenueId = tv.VenueID 
inner join tblstate as tst on tst.StateID = tv.StateID
inner join tblcountry as tc on tc.CountryID = tv.CountryID
  