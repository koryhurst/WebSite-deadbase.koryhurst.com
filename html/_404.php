<?php

/*
Version Notes	

Version 1.0 
	Basic set up

*/

include("Vars.php") ;

WriteHeader ('Personal Site of Kory Hurst', 'Kory Hurst', '404', 'science, web development, experiments' ) ;

echo '<div id="content" class="narrowcolumn">' ;
echo '<div class="post">' ; //because we are matching up to Word Press we use post, but it is just a section
echo '<div id="entry">' ;

//content goes here
echo '<br>' . $NewLine ;
echo '<br>' ;
echo '<strong>' . $NewLine ;
echo 'You step in the stream,<br>' . $NewLine ; 
echo 'but the water has moved on.<br>' . $NewLine ; 
echo 'This page is not here.<br>' . $NewLine ; 
echo '</strong>' . $NewLine ;

echo '</div>' ; //for entry 
echo '</div>' ; // for post
echo '</div>' ; // for content


WriteRightPane ();
WriteFooter ();
?>