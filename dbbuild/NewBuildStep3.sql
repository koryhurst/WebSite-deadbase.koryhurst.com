
I AM PRETTY SURE THIS IS OBLSOLETE NOW. 
NOW i AM DOING MANUAL INSERTS IN STEP ONE, SO WHO CARES ABOUT
THE ESCAPE CHARACTERS.  THE COMMA ESCAPE ONES FOR SURE
THE DOUBLE QUOTE ONES, i CAN PROABABLY WRAP THE INSERT STATEMENTS
IN SINGLE QUOTES, THEN LEAVE THE DOUBLE QUOTES ALONE.

/*  In Show Notes : */
/* get rid of the escape character "/" for the double quotes*/
update tblshow set ShowNotes = replace(ShowNotes, "/""", """");

/* get rid of the escape character "/" for the commas */
update tblshow set ShowNotes = replace(ShowNotes, "/,", ",");



/*
THIS IS WHERE I AM NOW.  I HAVE TO PARSE THE SET TEXT TO MOVE THIS OUT, THEN THE STUFF IN OLD 
STEP 4 WILL CAPTURE THEM ALL 
*/

select * from tblsetlist 
where instr(settext,  "1.5:")  > 0 
or instr(settext,  " 2:") > 0 
or instr(settext,  "2.5:") > 0 
or instr(settext,  "E:") > 0 
or instr(settext,  "E1:") > 0 
or instr(settext,  "E2:") > 0 ;