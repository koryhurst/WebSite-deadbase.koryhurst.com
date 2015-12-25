/*
This step gets rid of the prefixes for set type in the set text column, 
and populates the set type column based on those prefixes.
*/


use dbgrateful;

/*now move stuff into new setlist table*/

/*special update for one set list line that belongs to a show that has an encore with proper prefix, but set without one*/
update tblsetlist set SetText = concat('1: ', SetText) where setlistid = 2710;

/*JUST A CHECK any set list lines belonging to multiple rows shows that do not have proper prefixes - NO */

/*
select showID, setlistid, left(settext, 50) 
from tblsetlist
where left(settext, 2) <> "1:"
and left(settext, 4) <> "1.5:"
and left(settext, 2) <> "2:"
and left(settext, 2) <> "3:"
and left(settext, 2) <> "E:"
and left(settext, 3) <> "E1:"
and left(settext, 3) <> "E2:"
and left(settext, 9) <> "Acoustic:"
and left(settext, 9) <> "Electric:"
and left(settext, 11) <> "Electric-1:"
and left(settext, 11) <> "Electric-2:"
and left(settext, 11) <> "Acoustic-1:"
and left(settext, 11) <> "Acoustic-2:"
and left(settext, 6) <> "Dylan:"
and showID not in (
select showid from tblsetlist group by showid having count(*) = 1
);
*/

/*JUST A CHECK any set list lines that have proper prefixes but only one row - NO */

/*
select showID, setlistid, left(settext, 50) 
from tblsetlist
where left(settext, 2) = "1:"
and left(settext, 4) = "1.5:"
and left(settext, 2) = "2:"
and left(settext, 2) = "3:"
and left(settext, 2) = "E:"
and left(settext, 3) = "E1:"
and left(settext, 3) = "E2:"
and left(settext, 9) = "Acoustic:"
and left(settext, 9) = "Electric:"
and left(settext, 11) = "Electric-1:"
and left(settext, 11) = "Electric-2:"
and left(settext, 11) = "Acoustic-1:"
and left(settext, 11) = "Acoustic-2:"
and left(settext, 6) = "Dylan:"
and showID in (
select showid from tblsetlist group by showid having count(*) = 1
);
*/

/*add prefix to one line shows - just for consistency */
update tblsetlist set SetText = concat('1: ', SetText) 
where left(settext, 2) <> "1:"
and left(settext, 4) <> "1.5:"
and left(settext, 2) <> "2:"
and left(settext, 2) <> "3:"
and left(settext, 2) <> "E:"
and left(settext, 3) <> "E1:"
and left(settext, 3) <> "E2:"
and left(settext, 9) <> "Acoustic:"
and left(settext, 9) <> "Electric:"
and left(settext, 11) <> "Electric-1:"
and left(settext, 11) <> "Electric-2:"
and left(settext, 11) <> "Acoustic-1:"
and left(settext, 11) <> "Acoustic-2:"
and left(settext, 6) <> "Dylan:";




ALTER TABLE tblsetlist ADD SetType char(11);

/* This chunk sets the setlist type in tblsetlist */

update tblsetlist set settype = "1:"            		where left(settext, 2) = "1:";
update tblsetlist set settype = "1.5:"          		where	left(settext, 4) = "1.5:";
update tblsetlist set settype = "2:"            		where	left(settext, 2) = "2:";
update tblsetlist set settype = "3:"            		where	left(settext, 2) = "3:";
update tblsetlist set settype = "E:"            		where	left(settext, 2) = "E:";
update tblsetlist set settype = "E1:"           		where	left(settext, 3) = "E1:";
update tblsetlist set settype = "E2:"           		where	left(settext, 3) = "E2:";
update tblsetlist set settype = "Acoustic:"     		where	left(settext, 9) = "Acoustic:";
update tblsetlist set settype = "Electric:"     		where	left(settext, 9) = "Electric:";
update tblsetlist set settype =  "Electric-1:"  		where	left(settext, 11)=  "Electric-1:";
update tblsetlist set settype =  "Electric-2:"  		where	left(settext, 11)=  "Electric-2:";
update tblsetlist set settype =  "Acoustic-1:"  		where	left(settext, 11)=  "Acoustic-1:";
update tblsetlist set settype =  "Acoustic-2:"  		where	left(settext, 11)=  "Acoustic-2:";
update tblsetlist set settype = "Dylan:"        		where	left(settext, 6) = "Dylan:";

/* This chunk fixes the set text so it no longer includes the set type prefix*/

update tblsetlist set settext = substr(settext from 4) where left(settext, 2) = "1:";
update tblsetlist set settext = substr(settext from 6) where	left(settext, 4) = "1.5:";
update tblsetlist set settext = substr(settext from 4) where	left(settext, 2) = "2:";
update tblsetlist set settext = substr(settext from 4) where	left(settext, 2) = "3:";
update tblsetlist set settext = substr(settext from 4) where	left(settext, 2) = "E:";
update tblsetlist set settext = substr(settext from 5) where	left(settext, 3) = "E1:";
update tblsetlist set settext = substr(settext from 5) where	left(settext, 3) = "E2:";
update tblsetlist set settext = substr(settext from 11) where	left(settext, 9) = "Acoustic:";
update tblsetlist set settext = substr(settext from 11) where	left(settext, 9) = "Electric:";
update tblsetlist set settext = substr(settext from 13) where	left(settext, 11)=  "Electric-1:";
update tblsetlist set settext = substr(settext from 13) where	left(settext, 11)=  "Electric-2:";
update tblsetlist set settext = substr(settext from 13) where	left(settext, 11)=  "Acoustic-1:";
update tblsetlist set settext = substr(settext from 13) where	left(settext, 11)=  "Acoustic-2:";
update tblsetlist set settext = substr(settext from 8) where	left(settext, 6) = "Dylan:";


/* Just a check.  BTW.  There are still 50 left */
/*
select count(*) from tblsetlist where instr(settext,  "1.5:") > 0 ;
select count(*) from tblsetlist where instr(settext,  " 2:") > 0 ;
select count(*) from tblsetlist where instr(settext,  "2.5:") > 0 ;
select count(*) from tblsetlist where instr(settext,  "E:") > 0 ;
select count(*) from tblsetlist where instr(settext,  "E1:") > 0 ;
select count(*) from tblsetlist where instr(settext,  "E2:") > 0 ;
*/



/*THIS NEXT PART REQUIRES MAJOR FIXING.  PROBABLY.  IT MIGHT WORK, BUT THERE HAS TO BE A BETTER WAY.
IT PROBABLY SHOULD HAVE BEEN DONE BEFORE THE ABOVE BIT.  JUST SPLIT THE LINES WHERE REQUIRED, THEN DEAL WITH THEM
LIKE THE REST  */



/* this next chunk splits lines that have a set list starting part way through it */
/* the X 10 bit is to figure out the order of the sets after */
insert tblsetlist
select ShowID, LineNR * 10, substring(SetText, instr(SetText, "1.5:"), length(SetText) - instr(SetText, "1.5:") + 1), null, null
from tblsetlist where instr(settext, "1.5:") > 0 ;
update tblsetlist set settype = "1.5:"          		where	left(settext, 4) = "1.5:";
update tblsetlist set settext = substr(settext from 6) where	left(settext, 4) = "1.5:";
update tblsetlist set settext = left(settext, instr(SetText, "1.5:") - 2) where instr(settext, "1.5:") > 0 ;

insert tblsetlist
select ShowID, LineNR * 10, substring(SetText, instr(SetText, "2:"), length(SetText) - instr(SetText, "2:") + 1), null, null 
from tblsetlist where instr(settext, " 2:") > 0 ;
update tblsetlist set settype = "2:"            		where	left(settext, 2) = "2:";
update tblsetlist set settext = substr(settext from 4) where	left(settext, 2) = "2:";
update tblsetlist set settext = left(settext, instr(SetText, "2:") - 2) where instr(settext, " 2:") > 0 ;

insert tblsetlist
select ShowID, LineNR * 10, substring(SetText, instr(SetText, "2.5:"), length(SetText) - instr(SetText, "2.5:") + 1), null, null 
from tblsetlist where instr(settext, "2.5:") > 0 ;
update tblsetlist set settype = "2.5:"            		where	left(settext, 4) = "2.5:";
update tblsetlist set settext = substr(settext from 6) where	left(settext, 4) = "2.5:";
update tblsetlist set settext = left(settext, instr(SetText, "2.5:") - 2) where instr(settext, "2.5:") > 0 ;

insert tblsetlist
select ShowID, LineNR * 10, substring(SetText, instr(SetText, "E:"), length(SetText) - instr(SetText, "E:") + 1), null, null 
from tblsetlist where instr(settext, "E:") > 0 ;
update tblsetlist set settype = "E:"            		where	left(settext, 2) = "E:";
update tblsetlist set settext = substr(settext from 4) where	left(settext, 2) = "E:";
update tblsetlist set settext = left(settext, instr(SetText, "E:") - 2) where instr(settext, "E:") > 0 ;

insert tblsetlist
select ShowID, LineNR * 10, substring(SetText, instr(SetText, "E1:"), length(SetText) - instr(SetText, "E1:") + 1), null, null 
from tblsetlist where instr(settext, "E1:") > 0 ;
update tblsetlist set settype = "E1:"           		where	left(settext, 3) = "E1:";
update tblsetlist set settext = substr(settext from 5) where	left(settext, 3) = "E1:";
update tblsetlist set settext = left(settext, instr(SetText, "E1:") - 2) where instr(settext, "E1:") > 0; 

insert tblsetlist
select ShowID, LineNR * 10, substring(SetText, instr(SetText, "E2:"), length(SetText) - instr(SetText, "E2:") + 1), null, null 
from tblsetlist where instr(settext, "E2:") > 0 ;
update tblsetlist set settype = "E2:"           		where	left(settext, 3) = "E2:";
update tblsetlist set settext = substr(settext from 5) where	left(settext, 3) = "E2:";
update tblsetlist set settext = left(settext, instr(SetText, "E2:") - 2) where instr(settext, "E2:") > 0 ;


/* add the post decimal point numbers */

/*select distinct settype, linenr from tblsetlist;*/

UPDATE tblsetlist set linenr = linenr + 5 where linenr > 10;
UPDATE tblsetlist set linenr = linenr + 70 where linenr > 100;

/*decimalize the line numbers, and put them back in order */
alter table tblsetlist modify linenr decimal(6,2);

UPDATE tblsetlist set linenr = linenr / 10 where linenr > 10;
UPDATE tblsetlist set linenr = linenr / 10 where linenr > 10;
/*
select distinct settype, linenr from tblsetlist order by LineNr;
*/

/* redo the ID's to deal with the newly created records lines */
ALTER TABLE tblsetlist drop SetListID ;
ALTER TABLE tblsetlist ADD SetListID INT NOT NULL AUTO_INCREMENT KEY;


/* END SETLIST SPLITTING */

