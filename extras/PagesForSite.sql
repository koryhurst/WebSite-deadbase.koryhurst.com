guests and their songs.

List of shows with acoustic renditions (list of all acoustic songs?)
Acoustic songs have an @ as the song note.
ShowID=286

List of all shows that contain only once played songs
aka rare songs.

Common songs (include first and last) 
select songtext, count(*) from tblsong group by songtext order by count(*) desc;
select songtext, count(*) from tblsong group by songtext having count(*) > 1 order by count(*) desc;
select songtext, count(*) from tblsong group by songtext having count(*) > 10 order by count(*) desc;

songs by set

set openers
show closers
acoustics


common jams (note: does not include sub jams)
select count(*) from tbljam;
select count(distinct jamtext) from tbljam;
select jamtext, count(*) from tbljam group by jamtext having count(*) > 20 order by count(*) desc;


query to find shows with songs in specific (or general) order
select * from tblsetlist where setlistid in (
select a.setlistid from 
(select * from tblsetlistsongdetail where songnr = 1 and songid = 290) as a,
(select * from tblsetlistsongdetail where songnr = 3 and songid = 110) as b
where a.setlistid = b.setlistid);