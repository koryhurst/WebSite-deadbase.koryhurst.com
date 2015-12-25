<?php
/*

	Version 1.0
		Basic

*/
include("Vars.php") ;

WriteHeader ('Personal Site of Kory Hurst', 'Kory Hurst', 'Home', 'science, web development, experiments' ) ;

echo '<div id="content" class="narrowcolumn">' . $NewLine ;
echo '<div class="post">' . $NewLine; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' . $NewLine;

//content goes here
echo '<h2>Header?</h2>' ;



echo '</div>' . $NewLine; //for entry 
echo '</div>' . $NewLine; // for post
echo '</div>' . $NewLine; // for content


WriteRightPane ();
WriteFooter ();
?>