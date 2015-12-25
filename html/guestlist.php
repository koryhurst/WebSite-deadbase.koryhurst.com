<?php
/*
	
	Version 1.0
		Basic

*/

include("_Vars.php") ;

$sSubHead = 'Guest List';
//_GeneralFunction.php function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';

//_GeneralFunction.php function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';
WriteHeader ('Grateful Dead Setlist Database by Kory Hurst', 'Grateful Dead', $sSubHead, $sKeyWords) ;

//content goes here
//sample content
// i need custom classes for the rest of the site here, actually can probable correct the 
// default class in this style, as the intext ul with >> is junk.
$sSQL = 'select SongNotes as Guest, count(*) as Appearances  ' ;
$sSQL = $sSQL . 'from tblsetlistsongdetailextranotes ' ;
$sSQL = $sSQL . 'where SongNotes like "%with%" ' ;
$sSQL = $sSQL . 'group by SongNotes ' ;
$sSQL = $sSQL . 'order by count(*) desc ' ;
//echo $sSQL;
$aGuests = GetRS($sSQL);

//Print2DArray($aGuests);

echo '<div id="content" class="narrowcolumn">' . $GLOBALS['NewLine']  ;
echo '<div class="post">' . $GLOBALS['NewLine'] ; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $GLOBALS['NewLine'] ;

echo '<table>';
echo '<tr>';
echo '<td valign="top">';
echo '<ul>';

foreach ($aGuests as $aGuest)
{
	echo '<li><a href="guestdetails.php?Guest=' . $aGuest['Guest'] . '">' . $aGuest['Guest'] ;
	echo ' Appearances = ' . $aGuest['Appearances'] ;
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