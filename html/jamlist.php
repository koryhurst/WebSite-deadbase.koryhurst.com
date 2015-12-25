<?php
/*

	Version 1.0
		Basic

*/
include("_Vars.php") ;

$sSortOrder	= $_GET["SortOrder"] ;
$sSortBy	= $_GET["SortBy"] ;

WriteHeader ('Personal Site of Kory Hurst', 'Kory Hurst', 'Home', 'science, web development, experiments' ) ;

echo '<div id="content" class="narrowcolumn">' . $NewLine ;
echo '<div class="post">' . $NewLine; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $NewLine;



$sSQLJams = 'select JamID, JamText, count(*) as TimesPlayed ' ;
$sSQLJams = $sSQLJams . 'from tblJam ';
$sSQLJams = $sSQLJams . 'group by JamID ';
$sSQLJams = $sSQLJams . 'order by ' . $sSortBy . ' ' . $sSortOrder ;

//echo $sSQLJams ;

$aSongs = GetRS($sSQLJams);

//Print2dArray(aSongs);
//content goes here

//echo floor(count($aSongs)/2);

echo '<table>';
echo '<tr>';
echo '<td valign="top">';
echo '<ul>';

foreach ($aSongs as $aSong)
{
	
	$iSongCount = $iSongCount + 1;
	//echo $iSongCount ;
	if ($iSongCount == floor(count($aSongs)/2))
	{
		echo '</ul>';
		echo '</td>';

		echo '<td valign="top">';
		echo '<ul>';
//		echo '<li><a href="Show.php?ShowID=' . $aShow['ShowID'] . '">' . $aShow['ShowName'] . '</a></li>';		
	}
	echo '<li><a href="song.php?SongID=' . $aSong['JamID'] ; 
	echo '">' . $aSong['JamText'] . ' (' . $aSong['TimesPlayed'] . ')</a></li>';		
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