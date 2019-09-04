
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




