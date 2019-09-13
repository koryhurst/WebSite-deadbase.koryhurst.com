
/* 

TEMPORARILY ABANDONED.  Really the tblsetlistsongdetailextranotes 
or maybe tblSongNotes has to be a one to many  relationship.
Each SetListSongID has to have many notes including all 
guest.  Notes about without.  Notes about acoustic.  Basically all the information
in shownotes has to be parsed out to the bits that pertain to songs and the bits that pertain
to whole shows.  Some of the whole show bits should be song notes for every song.
This stuff was a good start, but it is not right.


*/

/* trying to get the guests out of show notes */
/*  not bad so far.  the rest might be manual.  making a web page to help. */

drop table if exists tblsetlistsongdetailextranotes;

create table tblsetlistsongdetailextranotes
(SetListSongID int,
Footnote char(3), 
SongNotes varchar(1023));


insert tblsetlistsongdetailextranotes
select SetListSongID, Footnote, ShowNotes
from tblsetlistsongdetail tsd, tblshow ts, tblsetlist tsl
where tsd.SetlistID = tsl.SetlistID
and tsl.ShowID = ts.ShowID
and instr(ts.ShowNotes, tsd.Footnote) > 0;

/* Chops all of the 2* stuff off the end of notes that have 1* (ie all of the 2* ones)) */
update tblsetlistsongdetailextranotes
set SongNotes = left(SongNotes, instr(SongNotes, '**') - 2)
where Footnote = '*'
and instr(SongNotes, '**') > 0 ;

/* Chops the leading 1* stuff off of the 2* ones */
update tblsetlistsongdetailextranotes
set SongNotes = right(SongNotes, char_length(SongNotes) - instr(SongNotes,'**') + 1)
where Footnote = '**'
and instr(SongNotes, '**') > 0 ;

/* Chops the leading 2* stuff off of the 3* ones */
update tblsetlistsongdetailextranotes
set SongNotes = right(SongNotes, char_length(SongNotes) - instr(SongNotes,'***') + 1)
where Footnote = '***'
and instr(SongNotes, '***') > 0 ;

/* Chops the trailing 3* stuff off of the 2* ones */
update tblsetlistsongdetailextranotes
set SongNotes = left(SongNotes, instr(SongNotes,'***') - 2)
where Footnote = '**'
and instr(SongNotes, '***') > 0 ;

/* a double quote is a pretty good indicator that you are past the person */
update tblsetlistsongdetailextranotes 
set SongNotes = left(SongNotes, instr(SongNotes, '"') - 1)
where SongNotes like '%with%';

/*then final, first and last need to be chopped off */
/*but there is one funky ShowNote 
that I am not sure what to do with (show 88)
really it needs a full fix where each song has a * for with hornsby
and another set of stars for the finals.  It actually exposes a problem 
with the also's you know there are some *** that say also with.  It is a mess.
*/
update tblsetlistsongdetailextranotes 
set SongNotes = left(SongNotes, instr(SongNotes, 'final') - 1)
where SongNotes like '%with%'
and SongNotes like '%final%'
and SongNotes <> '*final versionwith Bruce Hornsby on grand piano - Bob Dylan opened - soundcheck: ';

update tblsetlistsongdetailextranotes 
set SongNotes = left(SongNotes, instr(SongNotes, 'first') - 1)
where SongNotes like '%with%'
and SongNotes like '%first%';


update tblsetlistsongdetailextranotes 
set SongNotes = left(SongNotes, instr(SongNotes, 'last') - 1)
where SongNotes like '%with%'
and SongNotes like '%last%';

/* 
*final versionwith Bruce Hornsby on grand piano - Bob Dylan opened - soundcheck: 
*/

/* 
update tblsetlistsongdetailextranotes set SongNotes = "*with Steve Miller with Bruce Hornsby on accordion" where songnotes = "*with Steve Miller with Bruce Hornsby on accordion - Steve Miller opened - locomotive airhorn during " 
update tblsetlistsongdetailextranotes set SongNotes = "*with Mickey Hart" where songnotes = "*with Mickey HartMickey Hart's " 
update tblsetlistsongdetailextranotes set SongNotes = "*with Airto Moreira on drums without Bruce Hornsby" where songnotes = "*with Airto Moreira on drums without Bruce Hornsby - the Chinese Symphony Orchestra opened - Dragon Dance during " 
update tblsetlistsongdetailextranotes set SongNotes = "*with Steve Miller" where songnotes = "*with Steve Miller Steve Miller opened - locomotive airhorn during " 
update tblsetlistsongdetailextranotes set SongNotes = "**also with James Cotton on harmonica" where songnotes = "**also with James Cotton on harmonicaSteve Miller opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "*with Clarence Clemons" where songnotes = "*with Clarence Clemonspay-per-view TV broadcast - national FM broadcast - TV & FM broadcast cut during " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*acoustic, with members of NRPS" 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with Greg ErricoCambodian refugee benefit - FM broadcast KSAN-San Francisco - also: Jefferson Starship; Joan Baez; Beach Boys; Santana solo - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with members of The Neville Brothers Encore without Phil, Weir on tamborine - Mardi Gras - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Steve Millerlocomotive airhorn during " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with John Belushi on vocals and cartwheels" 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with members of The Neville Brothers30 beat " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Carlos Santana Chinese acrobats opened - dragon parade during " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Allman Brothers Band and Merl SaundersWet Willie, then Allman Brothers Band opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Jorma Kaukonenthe set breaks may be wrong - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Bruce Hornsby on accordion Bruce Hornsby & The Range opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with The Band SEVA benefit - nationwide FM broadcast - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Etta James & Tower Of Power hornssound check: Midnight Hour*, Hard To Handle*, Lovelight*, Tell Mama* - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Allman Brothers and The Band" 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with John CipollinaBill Graham flies out of a truck dressed as a butterfly - also: Richard Olson; Flying Karamozov Brothers - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "***with Matt KellyFM broadcast KQAK-San Francisco - Bill Graham rides in on a giant mushroom - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Steve Miller and Norton Buffalo Steve Miller opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with David Hidalgo on guitar David Lindley & El Rayo-X, then Los Lobos opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with unidentified vocalistonly " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "***with John CipollinaFM broadcast KSAN-San Francisco - TV broadcast KQED-San Francisco - Bill Graham flies in on a joint - Blues Brothers, then NRPS opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with John Cipollina Third set with Rick Danko & Maria Muldaur - also: The Band; Mike Henderson - FM broadcast KFOG-San Francisco - national radio broadcast - Bill Graham appears out of a globe - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Paul Butterfield and Elvin BishopMickey And The Hartbeats - with Jack Casady - date of list uncertain - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with unidentified guest" 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Bob Weir on vocalsonly " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Bob Dylan Jerry & Brent left the stage for the end of " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Ronnie HawkinsYellow Dog story after " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with same guests, without lyrics" 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Duane and Gregg Allman and Peter Green 11:30 show - acoustic encore is uncertain - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "***Joey Covington vocalswith Jefferson Airplane - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Martin Fierro and Joe Ellis on horns Doug Sahm opened - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Tom Constanten also: NRPS - Orchestra $4.50 - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Stephen Stills list incomplete between " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Martin Fierro and Joe Ellis on hornsequipment break after " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Donna Godchaux FM broadcast KSAN-San Francisco - billing: GD; NRPS; Yogi Phlegm - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Hamza El-Dinsound check the day before: Ollin Arageed*, Instrumental* - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "***with Airto MoreiraNew Grass Revival then Bonnie Raitt opened - FM broadcast KPFA-Berkeley - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with The Flying Karamozov Brothersdouble start for " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Willie Green of the Neville Brothers part of " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with Flora Purimwith Airto Moreira - Vietnam Vets benefit - lineup: Country Joe; GD; Jefferson Starship - only " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "***with Kodo drummer" 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Gung Hay Fat Choy Iko Ikothe Chinese Symphony Orchestra opened - Dragon Dance during " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Baba Olatunjiwithout Bruce Hornsby - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with Lee OskarHamza El-Din performed a couple of solo songs before " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**also with Graham Wiggins on didgeridooOrnette Coleman opened, Jerry played on the " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Baba Olatunji and Sikiru Adepojuwithout Bruce Hornsby - false start for " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with Lee Oskar, Greg Errico, Kesey, etc." 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Hamza El-Dinnationwide FM broadcast - archival video tape made - soundcheck: " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Merl SaundersRex Foundation benefit - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with Hamza El-DinRex Foundation benefit - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "**with Baba Olatunji, Sikiru Adepoju & KitaroPeter Apfelbaum and the Hieroglyphics Ensemble, then Tom Tom Club opened - FM broadcast KFOG-San Francisco - " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "***with John CipollinaBill Graham flies in on a joint - also: NRPS - only " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with Ken Nordine Ken Nordine recited " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*with extra drummers, no Space only " 
update tblsetlistsongdetailextranotes set SongNotes = "" where songnotes = "*Bruce on keyboards and Vince on grand pianowith Bruce Hornsby on grand piano - 

*/