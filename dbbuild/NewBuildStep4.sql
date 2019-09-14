ALTER TABLE tblsong ADD FootNote varchar(3);

update tblsong
set songtext = rtrim(songtext);

update tblsong
set songtags = '**'
Where right(songtext,2) = '**';

update tblsong
set songtext = left(songtext, length(songtext) - 2)
Where right(songtext,2) = '**';

update tblsong
set songtags = '*'
Where right(songtext,1) = '*';

update tblsong
set songtext = left(songtext, length(songtext) - 1)
Where right(songtext,1) = '*';

update tblsong
set songtags = '*'
Where right(songtext,1) = '@';

update tblsong
set songtext = left(songtext, length(songtext) - 1)
Where right(songtext,1) = '@';

select distinct right(songtext, 1) from tblsong;
select * from tblsong where right(songtext,1) = ' ';
