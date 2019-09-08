/*
Moves the first lines into tblshow
then moves show notes into tblshow
*/


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
and settext not like 'Dylan:%'
and settext not like 'Acoustic:%'
and settext not like 'Acoustic-1:%'
and settext not like 'Acoustic-2:%'
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
and settext not like 'Dylan:%'
and settext not like 'Acoustic:%'
and settext not like 'Acoustic-1:%'
and settext not like 'Acoustic-2:%'
and settext not like 'Electric:%'
and settext not like 'Electric-1:%'
and settext not like 'Electric-2:%';

ALTER TABLE tblsetlist ADD SetType char(11);

update tblsetlist set SetType = "1:" where left(settext,2)="1:";
update tblsetlist set SetType = "2:" where left(settext,2)="2:";
update tblsetlist set SetType = "3:" where left(settext,2)="3:";
update tblsetlist set SetType = "E:" where left(settext,2)="E:";
update tblsetlist set SetType = "E1:" where left(settext,3)="E1:";
update tblsetlist set SetType = "E2:" where left(settext,3)="E2:";
update tblsetlist set SetType = "1.5:" where left(settext,4)="1.5:";
update tblsetlist set SetType = "Dylan:" where left(settext,6)="Dylan:";
update tblsetlist set SetType = "Acoustic:" where left(settext,9)="Acoustic:";
update tblsetlist set SetType = "Acoustic-1:" where left(settext,11)="Acoustic-1:";
update tblsetlist set SetType = "Acoustic-2:" where left(settext,11)="Acoustic-2:";
update tblsetlist set SetType = "Electric:" where left(settext,9)="Electric:";
update tblsetlist set SetType = "Electric-1:" where left(settext,11)="Electric-1:";
update tblsetlist set SetType = "Electric-2:" where left(settext,11)="Electric-2:";

update tblsetlist set SetText = right(settext, length(settext) - 2) where left(settext, 3) = '1:';
update tblsetlist set SetText = right(settext, length(settext) - 2) where left(settext, 3) = '2:';
update tblsetlist set SetText = right(settext, length(settext) - 2) where left(settext, 3) = '3:';
update tblsetlist set SetText = right(settext, length(settext) - 2) where left(settext, 3) = 'E:';
update tblsetlist set SetText = right(settext, length(settext) - 3) where left(settext, 3) = 'E1:';
update tblsetlist set SetText = right(settext, length(settext) - 3) where left(settext, 3) = 'E2:';
update tblsetlist set SetText = right(settext, length(settext) - 4) where left(settext, 4) = '1.5:';
update tblsetlist set SetText = right(settext, length(settext) - 6) where left(settext, 6) = 'Dylan:';
update tblsetlist set SetText = right(settext, length(settext) - 9) where left(settext, 9) = 'Acoustic:';
update tblsetlist set SetText = right(settext, length(settext) - 11) where left(settext, 11) = 'Acoustic-1:';
update tblsetlist set SetText = right(settext, length(settext) - 11) where left(settext, 11) = 'Acoustic-2:';
update tblsetlist set SetText = right(settext, length(settext) - 9) where left(settext, 9) = 'Electric:';
update tblsetlist set SetText = right(settext, length(settext) - 11) where left(settext, 11) = 'Electric-1:';
update tblsetlist set SetText = right(settext, length(settext) - 11) where left(settext, 11) = 'Electric-2:';
