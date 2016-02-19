<?php
/*

Notes:
	Function to add (print array - with many sub arrays)

Function List:
	WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
	WriteFooter()
	IsValidURL($PossibleURL)
	Print2DArray($a2DArray)
	ReturnAllMatches($matches)
		
Version Details:
	V1.0
		Initial Version
	V1.1
		Splattered with . $NewLine 	
	V1.2
		Removed ending check for IsValidURL	
		Updated Function List
	V1.3
		Replaced $NewLine with $GLOBALS['NewLine']
		Replaced $sFooterText with $GLOBALS['sFooterText']
	V1.4
		Added Style Sheet Variable $Style to WriteHeader

*/

function WriteHeader($sPageTitle, $sHeader, $sSubHead, $sKeyWords) 
{
	//see http://htmlhelp.com/tools/validator/doctype.html
	//echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' . $GLOBALS['NewLine']  ;
	//Switch to HTML5
	echo '<!DOCTYPE html>' . $GLOBALS['NewLine']  ;
	echo '<html xmlns="http://www.w3.org/1999/xhtml">' . $GLOBALS['NewLine'] ; 
	echo '<head>' . $GLOBALS['NewLine'] ;
	echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />' . $GLOBALS['NewLine'] ;
	echo '<meta name="author" content="' . $GLOBALS['sAuthor'] . '" />' . $GLOBALS['NewLine']  ; 
	echo '<meta name="revised" content="' . $GLOBALS['dRevisedDate'] . '" />' . $GLOBALS['NewLine'] ;
	echo '<meta name="description" content="' . $GLOBALS['sSiteDescription'] . '" />' . $GLOBALS['NewLine'] ;
	echo '<meta name="keywords" content="' . $sKeyWords . '" />' . $GLOBALS['NewLine'] ;
	echo '<title>' . $sPageTitle . '</title>' . $GLOBALS['NewLine'] ;
	echo '<link rel="stylesheet" type="text/css" href="' . $GLOBALS['sStyleSheetPath'] . '">' . $GLOBALS['NewLine'] ;
	echo '<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">' . $GLOBALS['NewLine'] ;
	echo '<link rel="icon" href="favicon.ico" type="image/x-icon">' ;
	echo '</head>' ;
	
	echo '<body>' . $GLOBALS['NewLine'] ;
	echo '<div id="page">' . $GLOBALS['NewLine'] ;
	echo '<div id="header" style="cursor:pointer;"> ' . $GLOBALS['NewLine'] ;
	echo '<h1><a href="' . $GLOBALS['sHomePageURL'] . '">' . $sHeader . "</a></h1>" . $GLOBALS['NewLine'] ;
	echo '<div class="description">' ;
	echo $sSubHead ;
	echo'</div> ' . $GLOBALS['NewLine'] ; //end description div
	echo '</div> ' . $GLOBALS['NewLine']  ; // end header div

	$sGoogleAdBanner = '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- deadbase.koryhurst.com-Banner -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-0226424803408503"
     data-ad-slot="6538283391"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>';

echo $sGoogleAdBanner ;

	}
/*
function WriteHeaderOld($Title)
{
	echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">" ;
	echo "<html>" . "\n";
	echo "<head>" . "\n";
	echo "<meta content=\"text/html; charset=utf-8\" http-equiv=Content-Type>" . "\n";
	echo "<meta HTTP-EQUIV=\"Pragma\" CONTENT=\"no-cache\">" . "\n" ;
	echo "<title>" . $Title . "</title>" . "\n";
	echo "</head>" . "\n";
	echo "<body>" . "\n";
}
*/

function WriteFooter()
{

echo '<div id="footer"> ' . $GLOBALS['NewLine'] ;
echo '<p class="center">  ' ;
echo $GLOBALS['sFooterText'] ;
echo '</p> ' . $GLOBALS['NewLine'] ;
echo '</div> ' . $GLOBALS['NewLine'] ;  // end footer div
echo '</div> ' . $GLOBALS['NewLine'] ; // end page div created in header
echo '</body> ' . $GLOBALS['NewLine'] ;
echo '</html>' . $GLOBALS['NewLine'] ;

}
/*
function WriteFooterOld()
{
echo "</body>" . "\n";
echo "</html>" . "\n";
}
*/
function IsValidURL($PossibleURL)
{
	$TestValidity = True ;
	if (substr($PossibleURL, 0, 1)=='/') $TestValidity = False ; // Disregard local links?
	//if (substr($PossibleURL, strlen($PossibleURL)-4, 4)<>'html') $TestValidity = False ;
	// Double check valid URL ending
	//need to test the whole range of valid ending to be a true general function
	//Actually cant test them all, as some URLS have GET parameters on the end.
	return $TestValidity ;
}

//This should be generalized to print multi dimensional arrays.
function Print2DArray($a2DArray)
{
	
	foreach($a2DArray as $aSubArray)
	{
		echo '<br>';
		//change this to custom printing with padding.
		//make it ultra readable
		print_r($aSubArray);
	}	
}

//This is for printing returns from reg exp. extracts
//the print_r function seems to work better at some of them
//sometimes the return doesn't even seem to be an array
function ReturnAllMatches($matches)
{
	echo "<table class=\"QueryResults\">" . $GLOBALS['NewLine'] ; 

	foreach($matches as $match) 
  {
		echo "<tr>" . $GLOBALS['NewLine'] ;
		echo "<td>0-" . $match[0] . "</td>" . "\n" . $GLOBALS['NewLine'] ;
		echo "<td>1-" . $match[1] . "</td>" . "\n" . $GLOBALS['NewLine'] ;
		echo "<td>2-" . $match[2] . "</td>" . "\n" . $GLOBALS['NewLine'] ;
		echo "</tr>" . $GLOBALS['NewLine'] ;
	}
	echo "</table>" . $GLOBALS['NewLine'] ;	
}


?>