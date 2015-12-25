<?php
/*
	
	Version 1.0
		Basic

*/

include("_Vars.php") ;

$sSubHead = 'Shows With Acoustic Sets';
//_GeneralFunction.php function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';
WriteHeader ('Grateful Dead Setlist Database by Kory Hurst', 'Grateful Dead', $sSubHead, $sKeyWords) ;

//content goes here
//sample content
// i need custom classes for the rest of the site here, actually can probable correct the 
// default class in this style, as the intext ul with >> is junk.
$sSQL = 'select ShowID, ShowDate, ShowName, Venue, TapeRank, GotIt ';
//$sSQL = $sSQL . 'from tblShow as ts inner join tblVenue as tv on ts.VenueId = tv.VenueID ';
$sSQL = $sSQL . 'from vwshow ';
$sSQL = $sSQL . 'where ShowId in ' ;
$sSQL = $sSQL . '(select ShowID from tblsetlist where settype like "%Acoustic%")';
$sSQL = $sSQL . 'order by ShowDate' ;
//echo $sSQL;
$aShows = GetRS($sSQL);

//Print2DArray($aShows);

echo '<div id="content" class="narrowcolumn">' . $GLOBALS['NewLine']  ;
echo '<div class="post">' . $GLOBALS['NewLine'] ; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $GLOBALS['NewLine'] ;

echo '<table>';
echo '<tr>';
echo '<td valign="top">';


echo '<ul>';	

foreach ($aShows as $aShow)
	{
		echo '<li><a href="show.php?ShowID=' . $aShow['ShowID'] . '">' ;
		echo $aShow['ShowName'] . ' (' . $aShow['Venue'] . ')' ;
		if ($aShow['TapeRank'] > 0)
		{
			echo ' (Rank = ' . $aShow['TapeRank'] . ')' ; 
		}
		if  ($aShow['GotIT'] == 1)
		{
			echo ' * ';
		}
		echo '</a></li>';		
	}
echo '</ul>';	
echo '</td>';
echo '</tr>';
echo '</table>';


echo '</div>' . $GLOBALS['NewLine']; //for entry 
echo '</div>' . $GLOBALS['NewLine']; // for post
echo '</div>' . $GLOBALS['NewLine']; // for content


WriteRightPane ();
WriteFooter ();
?>