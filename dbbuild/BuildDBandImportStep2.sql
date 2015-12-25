/* this file populates the tables from source data, alters the tables as necessary, 
then takes the non setlist lines from tblsetlist and moves them into tblshow
ON THE LOCAL XAMPP INSTALL THESE COMMANDS WILL NOT RUN IN THE COMMAND LINE
THEY MUST BE EXECUTED IN MYSQL WORKBENCH */

use dbgrateful;

load data local infile 'C:/\xampp/\htdocs/\mirror/\gdbase/\dbbuild/\venue.csv' into table tblvenue
 fields terminated by ','
 enclosed by ''
 lines terminated by '\n';
 
load data local infile 'C:/\xampp/\htdocs/\mirror/\gdbase/\dbbuild/\state.csv' into table tblstate
 fields terminated by ','
 enclosed by ''
 lines terminated by '\n';
 
 
load data local infile 'C:/\xampp/\htdocs/\mirror/\gdbase/\dbbuild/\country.csv' into table tblcountry
 fields terminated by ','
 enclosed by ''
 lines terminated by '\n';
 
load data local infile 'C:/\xampp/\htdocs/\mirror/\gdbase/\dbbuild/\show.csv' into table tblshow
 fields terminated by ','
 enclosed by ''
 lines terminated by '\n';

ALTER TABLE tblshow ADD ShowNotes varchar(1024);
ALTER TABLE tblshow ADD ShowFirstLine varchar(1024);

load data local infile 'C:/\xampp/\htdocs/\mirror/\gdbase/\dbbuild/\setlist.csv' into table tblsetlist
 fields terminated by ','
 enclosed by '"' 
 lines terminated by '\r\n';

ALTER TABLE tblsetlist ADD SetListID INT NOT NULL AUTO_INCREMENT KEY;


UPDATE tblshow, tblsetlist 
set tblshow.ShowFirstLine = tblsetlist.SetText
where tblsetlist.LineNR = 1
and tblshow.ShowID = tblsetlist.ShowID ;

delete from tblsetlist where linenr = 1;




