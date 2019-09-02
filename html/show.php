<?php
/*

	Version 1.0
		Basic

*/
include("_Vars.php") ;

$iShowID	= $_GET["ShowID"] ;

WriteHeader ('Personal Site of Kory Hurst', 'Kory Hurst', 'Home', 'science, web development, experiments' ) ;

echo '<div id="content" class="narrowcolumn">' . $NewLine ;
echo '<div class="post">' . $NewLine; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $NewLine;

//separate queries are required becomes some shows do not have any setlist records

$sSQLShow = 'select ShowID, DeadbaseID, ShowDate, ShowName, ShowFirstLine, ShowNotes, MyNotes, TapeRank, ' ; 
$sSQLShow = $sSQLShow . 'Venue, City, StateName, CountryName ';
$sSQLShow = $sSQLShow . 'from vwshow ';
//$sSQLShow = $sSQLShow . 'from tblShow as ts inner join tblVenue as tv on ts.VenueId = tv.VenueID ';
//$sSQLShow = $sSQLShow . 'inner join tblState as tst on tst.StateID = tv.StateID ';
//$sSQLShow = $sSQLShow . 'inner join tblCountry as tc on tc.CountryID = tv.CountryID ';
$sSQLShow = $sSQLShow . 'where ShowID = ' . $iShowID . ' ';

$sSQLSetList = 'select SetListID, ts.ShowID, LineNr, SetText, SetType ';
$sSQLSetList = $sSQLSetList . 'from tblshow as ts ';
$sSQLSetList = $sSQLSetList . 'inner join tblsetlist as tsl on tsl.ShowID = ts.ShowID ';
$sSQLSetList = $sSQLSetList . 'where ts.ShowID = ' . $iShowID . ' ';
$sSQLSetList = $sSQLSetList . 'order by LineNr ';

//echo $sSQLSetList ;

$aShowArray = GetRS($sSQLShow);
$aShow = $aShowArray[0];

$aSetListArray = GetRS($sSQLSetList);
$aSetList = $aSetListArray[0];

//Print2dArray(aShow);
//content goes here
echo '<h2>' . $aShow['ShowDate'] . ' - ' . $aShow['Venue'] ;


if ($aShow['TapeRank'] > 0)
	{
		echo ' (' . $aShow['TapeRank'] . ')';
	}
echo '</h2>' ;
echo '<h3>' . $aShow['City'] . ', ' . $aShow['StateName'] . ', ' . $aShow['CountryName'] . '</h3>' ;
echo '<h4>' . $aShow['ShowName'] . '</h4>' ;		


//echo '<h4>' . $aShow['ShowFirstLine'] . '</h4>' ;
if (count($aSetList) > 0)
{
	foreach ($aSetListArray as $aSetListLine )
		{
//			echo '<h4>' . $aSetListLine['SetType'] . ' - ' . $aSetListLine['LineNr'] . ' - ' .  $aSetListLine['SetText'] . '</h4>' ;
			echo '<h4>' . $aSetListLine['SetType'] . '</h4>' ;
      echo '<h4>' . $aSetListLine['SetText'] . '</h4>' ;
      


//			$aTest = preg_split('[,]', "1: H. C. Sunshine/, Me & My Uncle/, Ramble On/, L. L. Rain>Deal/, Mexicali/, ");
//			$aTest = preg_split('[ ]', $aSetListLine['SetText']);
//			$aTest = preg_split('[,|>]', $aSetListLine['SetText']);
//			echo '<h4>';
//			print_r($aTest);
		//Print2DArray($aTest);
//			echo '</h4>';
			$sSQLSongs = 'select ts.SongID, SongNr, SongText, JammedOutOf, FootNote ';
			$sSQLSongs = $sSQLSongs . 'from tblsetlistsongdetail tsd inner join tblsong ts on ts.SongID = tsd.SongID ';
			$sSQLSongs = $sSQLSongs . 'where SetListID = ' . $aSetListLine['SetListID'] . ' order by SongNr ';
			//echo $sSQLSongs ;
			//$aSongArray = GetRS($sSQLSongs);
			$aSongs = GetRS($sSQLSongs);
			//$aSongs = $aSongArray[0];

			echo '<h5>';
			foreach ($aSongs as $aSong )
				{
//				echo $aSong['SongNr'] . ' - ' . $aSong['SongText'] . $aSong['FootNote'] . $aSong['JammedOutOf'] . '<br>';		
				echo '<a href="song.php?SongID=' . $aSong['SongID'] . '">' . $aSong['SongText'] . '</a>' . $aSong['FootNote'] . $aSong['JammedOutOf'] . '<br>';		
				}
			echo '</h5>';
//		
		}
}

echo '<h4>' . $aShow['ShowNotes'] . '</h4>' ;
echo '<h4>' . $aShow['MyNotes'] . '</h4>' ;

echo '</div>' . $NewLine; //for entry 
echo '</div>' . $NewLine; // for post
echo '</div>' . $NewLine; // for content


WriteRightPane ();
WriteFooter ();
?>