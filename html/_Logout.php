<?php

/*

Version 1.0
	Basic
Version 1.1
	Changed landing location to global variable
	Added include for Vars to accomodate that
Version 1.2
	session_start() commented out.  don't know why it was there to begin with.
	
*/

include("_Vars.php") ;

//session_start();
session_destroy();
header('Location: ' . $GLOBALS['sLoginLandingPage']);

?>