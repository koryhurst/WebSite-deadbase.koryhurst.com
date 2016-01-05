<?php

/*
	V1.0
		Basic
		Received function GetApplicationSpecificDetails from User.php 
			to make this the main alterable file between sites

*/

function GetApplicationSpecificDetails($iUserID)
{
	//GetSearches($iUserID);
}


function WriteRightPane()
{
//to end content section
echo '<div id="sidebar">' ;

//echo '<ul>';
if ($GLOBALS['sInstallType'] == 'XAMMP')
{
	echo '<li><a href="../koryhurst/index.php">Kory Hurst Home</a></li>';		
}
elseif ($GLOBALS['sInstallType'] == 'GoDaddy')
{
	echo '<li><a href="http://www.koryhurst.com/index.php">Kory Hurst Home</a></li>';			
}

//echo '</ul>';
echo '<br>';  //due to style issue with UL
//echo '<ul>';
echo '<li><a href="index.php">Grateful Dead Home</a></li>';		
echo '<li><a href="showlist-allbydate.php">Show List By Date</a></li>';		
echo '<li><a href="showlist-taperank.php">Show List By Tape Rank</a></li>';		
echo '<li><a href="showlist-acoustic.php">Shows With Acoustic Sets</a></li>';		
echo '<li><a href="songlist.php?SortBy=TimesPlayed&SortOrder=desc">Songs by Frequency</a></li>';		
echo '<li><a href="songlist.php?SortBy=SongText&SortOrder=asc">Songs by Title</a></li>';		
//echo '<li><a href="guestlist.php">Guest List</a></li>';		
//echo '<li><a href="jamlist.php?SortBy=TimesPlayed&SortOrder=desc">Jams by Frequency</a></li>';		
//echo '<li><a href="jamlist.php?SortBy=NumberOfSongs&SortOrder=desc">Jams by Most Songs</a></li>';		
//echo '</ul>';
echo '</div>' ;
echo '<div id="adsense">' ;

echo '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>'; 
echo '<!-- GD-Responsive -->'; 
echo '<ins class="adsbygoogle"'; 
echo '     style="display:block"'; 
echo '     data-ad-client="ca-pub-0226424803408503"'; 
echo '     data-ad-slot="2830414196"'; 
echo '     data-ad-format="auto"></ins>'; 
echo '<script>'; 
echo '(adsbygoogle = window.adsbygoogle || []).push({});'; 
echo '</script>'; 


//if (isset($_SESSION['UserID'])) 
//{
//	echo '<a href="_Logout.php">Logout</a>' . $NewLine ;
//}
//else 
//{
//	WriteLoginBox() ;
//}
echo '</div>' ;
}

?>