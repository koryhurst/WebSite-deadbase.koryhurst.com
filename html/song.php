<?php
/*

	Version 1.0
		Basic

*/
include("_Vars.php") ;

$iSongID	= $_GET["SongID"] ;
$sSubHead = 'Song Details';
$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';
WriteHeader ('Grateful Dead Setlist Database by Kory Hurst', 'Grateful Dead', $sSubHead, $sKeyWords) ;

echo '<div id="content" class="narrowcolumn">' . $NewLine ;
echo '<div class="post">' . $NewLine; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $NewLine;

//echo 'Man this query needs tuning.';

$sSQLSong = 'select SongText, MainVocals from tblSong where SongID = ' . $iSongID; 

$sSQLTimesPlayed = 'select tsh.ShowID, ShowDate, City ';
$sSQLTimesPlayed = $sSQLTimesPlayed . 'from tblSetListSongDetail tsd ';
$sSQLTimesPlayed = $sSQLTimesPlayed . 'inner join tblSetList tse on tsd.SetListID = tse.SetListID ';
$sSQLTimesPlayed = $sSQLTimesPlayed . 'inner join tblShow tsh on tse.ShowID = tsh.ShowID ';
$sSQLTimesPlayed = $sSQLTimesPlayed . 'inner join tblVenue tv on tv.VenueID = tsh.VenueID ';
$sSQLTimesPlayed = $sSQLTimesPlayed . 'where SongID = '. $iSongID . ' ';
$sSQLTimesPlayed = $sSQLTimesPlayed . 'order by ShowDate asc ' ;

//echo $sSQLSong ;
//echo $sSQLTimesPlayed ;

$aSong = GetRS($sSQLSong);

$aTimesPlayed = GetRS($sSQLTimesPlayed);
$aSongFirst = $aTimesPlayed[0];
$aSongLast = $aTimesPlayed[count($aTimesPlayed)-1];

//Print2dArray($aSong);
//content goes here

//This is a bit fragile, as it assumes only one row returned.
//Should be fine as query is based on identity column, 
//but a little error prevention might be wise.
echo '<h2>' . $aSong[0]['SongText'] ;
if ($aSong[0]['MainVocals'] <> '')
{
	' - ' . $aSong['MainVocals'] . '</h2>';
}
echo '<h3>' ;
echo '<table>';
echo '<tr>';
echo '<td>Times Played</td>';
echo '<td>' . count($aTimesPlayed) . '</td>';
echo '</tr>';

//Need links to show here, details too maybe (location)
echo '<tr>';
echo '<td>First</td>';
echo '<td>' . $aSongFirst['ShowDate'] . '</td>';
echo '</tr>';

//Need links to show here
echo '<tr>';
echo '<td>Last</td>';
echo '<td>' . $aSongLast['ShowDate'] . '</td>';
echo '</tr>';

echo '</table>';

echo '</h3>' ;

echo '<table>';
echo '<tr>';
echo '<td valign="top">';
echo '<ul>';

foreach ($aTimesPlayed as $aTimePlayed)
{
	
	//$iSongCount = $iSongCount + 1;
	//echo $iSongCount ;
	//if ($iSongCount == floor(count($aSongs)/2))
	//{
	//	echo '</ul>';
	//	echo '</td>';

	//	echo '<td valign="top">';
	//	echo '<ul>';
//		echo '<li><a href="Show.php?ShowID=' . $aShow['ShowID'] . '">' . $aShow['ShowName'] . '</a></li>';		
//	}
	echo '<li><a href="show.php?ShowID=' . $aTimePlayed['ShowID'] ; 
	echo '">' . $aTimePlayed['ShowDate'] . ' (' . $aTimePlayed['City'] . ')</a></li>';		
}

echo '</td>';
echo '</tr>';
echo '</table>';


echo '</div>' . $NewLine; //for entry 
echo '</div>' . $NewLine; // for post
echo '</div>' . $NewLine; // for content


WriteRightPane ();
WriteFooter ();
?>