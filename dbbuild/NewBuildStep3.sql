/*
This extracts 2 things from tblsetlist into tbl Show.
it gets the first line for each show and move that to the show table 
instead of the setlist table, then deletes them.

Then, using keywords it grabs the notes line from any show that has it
and puts that in the shownotes field in tblshow.

This is pretty kludgy, but I couldn't find a better solution quickly, so keeping it.


/*first get the first lines*/


ALTER TABLE tblshow ADD ShowNotes varchar(1024);
ALTER TABLE tblshow ADD ShowFirstLine varchar(1024);
 
UPDATE tblshow, tblsetlist 
set tblshow.ShowFirstLine = tblsetlist.SetText
where tblsetlist.LineNR = 1
and tblshow.ShowID = tblsetlist.ShowID ;

delete from tblsetlist where linenr = 1;

  
UPDATE tblshow, tblsetlist 
set tblshow.ShowNotes = tblsetlist.SetText
where tblshow.ShowID = tblsetlist.ShowID 
and tblsetlist.setlistid in 
(
select setlistid
from tblsetlist 
where settext not like '1:%'
and settext not like '2:%'
and settext not like '3:%'
and settext not like 'E:%'
and settext not like 'E1:%'
and settext not like 'E2:%'
and settext not like '1.5:%'
and settext not like 'Acoustic:%'
and settext not like 'Electric:%'
and settext not like 'Electric-1:%'
and settext not like 'Electric-2:%'
);

delete from tblsetlist 
where settext not like '1:%'
and settext not like '2:%'
and settext not like '3:%'
and settext not like 'E:%'
and settext not like 'E1:%'
and settext not like 'E2:%'
and settext not like '1.5:%'
and settext not like 'Acoustic:%'
and settext not like 'Electric:%'
and settext not like 'Electric-1:%'
and settext not like 'Electric-2:%'
;
