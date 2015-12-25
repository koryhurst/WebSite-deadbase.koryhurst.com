<?php
/*
	
	Version 1.0
		Basic
	Version 1.1
		Added style parameter to WriteHeader call
*/

include("_Vars.php") ;

//_GeneralFunction.php function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';
WriteHeader ('Grateful Dead Setlist Database by Kory Hurst', 'Grateful Dead', 'Database', $sKeyWords) ;

//content goes here
//sample content
// i need custom classes for the rest of the site here, actually can probable correct the 
// default class in this style, as the intext ul with >> is junk.
//$sSQL = 'select ShowID, ShowDate, ShowName, Venue ';
//$sSQL = $sSQL . 'from tblshow as ts inner join tblVenue as tv on ts.VenueId = tv.VenueID ';
//$sSQL = $sSQL . 'order by ShowDate ';

//$aShows = GetRS($sSQL);

//Print2DArray($aShows);
echo '<div id="content" class="narrowcolumn">' . $GLOBALS['NewLine']  ;
echo '<div class="post">' . $GLOBALS['NewLine'] ; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $GLOBALS['NewLine'] ;

echo 'Welcome to my Grateful Dead setlist database.  I set this up for two reasons.  First deadbase that used to be housed at Dharma Rose has been closed.';
echo '  Second being the data hungry guy I am, I wanted to run my own queries against the setlists.  The dataset comes from a number of sources including the original deadbase.';
echo '<br>';
echo '<br>';
echo 'It was farmed from those sites using a few different techniques, but if I remember correctly it was mostly farmed using Excel.';
echo '  In fact it resided in a Excel spreadsheet for a long time, until I wanted to run a bit more complicated queries on it.  I then migrated it to MySQL.';
echo '<br>';
echo '<br>';
echo 'This is a work in progress, and it likely will be in perpetuity.  As it is now, it is fairly rudimentary, but enjoy it as you will.';
echo '  Links to existing functions and back to here, are over to the right. ';


echo '</div>' . $GLOBALS['NewLine']; //for entry 
echo '</div>' . $GLOBALS['NewLine']; // for post
echo '</div>' . $GLOBALS['NewLine']; // for content


WriteRightPane ();

WriteFooter ();
?>