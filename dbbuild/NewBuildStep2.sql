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

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText
 where settext like '%billing%'
and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText
 where settext like '%tuning%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText
 where settext like '%opened%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText
 where settext like '%warlocks%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%list%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText
 where settext like '%benefit%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%broadcast%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%before%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%afternoon%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%birthday%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%during%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%acid%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%lsd%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%concert%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%with%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%first%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%appears%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%also%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%final %'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where left(settext, 4) = 'last'
 and tblshow.ShowID = tblsetlist.ShowID ;
 
UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where left(settext, 5) = 'sound'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where left(settext, 4) = 'only'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%donna%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%garcia%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%Jerry%'
 and tblshow.ShowID = tblsetlist.ShowID ;

UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%verse%'
 and tblshow.ShowID = tblsetlist.ShowID ;

 UPDATE tblshow, tblsetlist set tblshow.ShowNotes = tblsetlist.SetText 
 where settext like '%final/last%'
 and tblshow.ShowID = tblsetlist.ShowID ;


/* the %with% has been removed from this section due to the 
love the one you're with problem.  it is handled further below.  */

delete from tblsetlist 
where settext like '%billing%'
or settext like '%tuning%'
or settext like '%opened%'
or settext like '%warlocks%'
or settext like '%list%'
or settext like '%benefit%'
or settext like '%broadcast%'
or settext like '%before%'
or settext like '%afternoon%'
or settext like '%birthday%'
or settext like '%during%'
or settext like '%acid%'
or settext like '%lsd%'
or settext like '%concert%'
or settext like '%first%'
or settext like '%appears%'
or settext like '%also%'
or settext like '%final %'
or left(settext, 4) = 'last'
or left(settext, 5) = 'sound'
or left(settext, 4) = 'only'
or settext like '%donna%'
or settext like '%garcia%'
or settext like '%Jerry%'
or settext like '%verse%'
or settext like '%final/last%';

/* the 2247 at the end of this list is also related to the 
love the one you're with problem.  this updates it to the correct notes.
and deletes the correct setlist record.  Even thought the correct setlist
record would be deleted in the special delete %with% sequence that follows. */

UPDATE tblshow, tblsetlist 
set tblshow.ShowNotes = tblsetlist.SetText
where tblsetlist.SetListid in (
8,364,465,530,863,885,896,963,1087,1322,1368,1463,1494,
1644,1676,1820,1914,1955,2130,2150,2175,2188,2281,2295,
2345,2399,2473,2995,3061,3077,3110,3188,3196,3263,3311,
3346,3348,3488,3501,3503,3520,3534,3552,3584,3598,3620,
3699,3735,3795,3808,4302,4305,4351,4509,4520,4793,4842,
5442,5588,5879,5974,6095,6113,6480,7020,7392,7400,7403,
7416,7424,7426,7478, 2247
)
and tblshow.ShowID = tblsetlist.ShowID ;

delete from tblsetlist 
where SetListID in (
8,364,465,530,863,885,896,963,1087,1322,1368,1463,1494,
1644,1676,1820,1914,1955,2130,2150,2175,2188,2281,2295,
2345,2399,2473,2995,3061,3077,3110,3188,3196,3263,3311,
3346,3348,3488,3501,3503,3520,3534,3552,3584,3598,3620,
3699,3735,3795,3808,4302,4305,4351,4509,4520,4793,4842,
5442,5588,5879,5974,6095,6113,6480,7020,7392,7400,7403,
7416,7424,7426,7478, 2247
);


/* this is the exception to deal with show 605 setlist id 2246 
Delete all the withs except for the "love the one you're with" set*/
delete from tblsetlist 
where settext like '%with%'
and setlistid <> 2246;

/*  In Show Notes : */
/* get rid of the escape character "/" for the double quotes*/
update tblshow set ShowNotes = replace(ShowNotes, "/""", """");

/* get rid of the escape character "/" for the commas */
update tblshow set ShowNotes = replace(ShowNotes, "/,", ",");






