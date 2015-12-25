<?php
/*
	
	Version 1.0
		Basic

*/

include("_Vars.php") ;

$sSubHead = 'Shows by Date';
//_GeneralFunction.php function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';

//_GeneralFunction.php function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';
WriteHeader ('Grateful Dead Setlist Database by Kory Hurst', 'Grateful Dead', $sSubHead, $sKeyWords) ;

//content goes here
//sample content
// i need custom classes for the rest of the site here, actually can probable correct the 
// default class in this style, as the intext ul with >> is junk.
$sSQL = 'select ShowID, ShowDate, TapeRank, GotIT ';
//$sSQL = $sSQL . 'from tblShow as ts inner join tblVenue as tv on ts.VenueId = tv.VenueID ';
$sSQL = $sSQL . 'from vwshow ';
$sSQL = $sSQL . 'order by ShowDate asc';
//echo $sSQL;
$aShows = GetRS($sSQL);

//Print2DArray($aShows);

echo '<div id="content" class="narrowcolumn">' . $GLOBALS['NewLine']  ;
echo '<div class="post">' . $GLOBALS['NewLine'] ; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $GLOBALS['NewLine'] ;

echo '<table>';
echo '<tr>';
echo '<td valign="top">';


echo '<h5>1960s</h5>';
echo '<ul>';

$iCurrDecade = '6'; 
$iShowCount = 0;


foreach ($aShows as $aShow)
{
	$iShowCount = $iShowCount + 1;
	if (substr($aShow['ShowDate'],2,1) <> $iCurrDecade)
	{
		$iCurrDecade = substr($aShow['ShowDate'],2,1); 
		$iShowCount = 0;
		echo '</ul>';
		echo '</td>';

		echo '<td valign="top">';
		echo '<h5>19' . $iCurrDecade . '0s</h5>';
		echo '<ul>';
	}
	echo '<li><a href="show.php?ShowID=' . $aShow['ShowID'] . '">' . $aShow['ShowDate'] ;
	if  ($aShow['TapeRank'] > 0)
	{
		echo ' (' . $aShow['TapeRank'] . ')';
	}
	if  ($aShow['GotIT'] == 1)
	{
		echo ' * ';
	}
	echo '</a></li>';
}

echo '</td>';
echo '</tr>';
echo '</table>';


echo '</div>' . $GLOBALS['NewLine']; //for entry 
echo '</div>' . $GLOBALS['NewLine']; // for post
echo '</div>' . $GLOBALS['NewLine']; // for content


WriteRightPane ();
WriteFooter ();
?>