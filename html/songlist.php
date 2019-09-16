<?php
/*

	Version 1.0
		Basic

*/
include("_Vars.php") ;

$sSortOrder	= $_GET["SortOrder"] ;
$sSortBy	= $_GET["SortBy"] ;

if ($sSortBy	== 'TimesPlayed') 
	{
		$sSubHead = 'Songs by Frequency';
	}
elseif ($sSortBy	== 'SongText')
	{
		$sSubHead = 'Songs by Title';
	}

$sKeyWords = 'Grateful Dead, Setlist, database, setlists, songs, the dead, jerry garcia';
WriteHeader ('Grateful Dead Setlist Database by Kory Hurst', 'Grateful Dead', $sSubHead, $sKeyWords) ;

echo '<div id="content" class="narrowcolumn">' . $NewLine ;
echo '<div class="post">' . $NewLine; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $NewLine;


//OLD Query
//$sSQLSongs = 'select ts.SongID, SongText, MainVocals, count(*) as TimesPlayed ' ;
//$sSQLSongs = $sSQLSongs . 'from tblsong as ts inner join tblsetlistsongdetail td ';
//$sSQLSongs = $sSQLSongs . 'on ts.SongID = td.SongID ';
//$sSQLSongs = $sSQLSongs . 'group by SongID, SongText, MainVocals ';
//$sSQLSongs = $sSQLSongs . 'order by ' . $sSortBy . ' ' . $sSortOrder ;

$sSQLSongs = 'select SongText, count(*) as TimesPlayed ' ;
$sSQLSongs = $sSQLSongs . 'from tblsong ';
$sSQLSongs = $sSQLSongs . 'group by SongText ';
$sSQLSongs = $sSQLSongs . 'order by ' . $sSortBy . ' ' . $sSortOrder ;

//echo $sSQLSongs ;

$aSongs = GetRS($sSQLSongs);

//Print2dArray(aSongs);
//content goes here

//echo floor(count($aSongs)/2);

echo '<table>';
echo '<tr>';
echo '<td valign="top">';
echo '<ul>';

$iSongCount = 0;

foreach ($aSongs as $aSong)
{
	
	$iSongCount = $iSongCount + 1;
	//echo $iSongCount ;
	if (($iSongCount == floor(count($aSongs)/3)) or ($iSongCount == 2 * floor(count($aSongs)/3)))  
	{
		echo '</ul>';
		echo '</td>';

		echo '<td valign="top">';
		echo '<ul>';
//		echo '<li><a href="Show.php?ShowID=' . $aShow['ShowID'] . '">' . $aShow['ShowName'] . '</a></li>';		
	}
	echo '<li><a href="song.php?SongID=' . $aSong['SongID'] ; 
	echo '">' . $aSong['SongText'] . ' (' . $aSong['TimesPlayed'] . ')</a></li>';		
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