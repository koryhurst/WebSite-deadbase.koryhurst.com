<?php

/*
Version 1.0 
	Basic
Version 1.1
	Changed name of include to SiteSpecificFunctions.php in order not to change this file every time
	Added Variable Names for more text and meta data in header
	Added Variable for LoginLandingPage in order to keep User.php same between sites.
Version 1.2
	Added if structure so that no modification is required between different hosts.
Version 2.0
	changed includes to be one level up for _User.php, 
		_mySQLFunctions.php and _GeneralFunctions
		so that they can be the same as the main domain one for now
Version 2.1
	changed includes back down a level for those listed above
	This was mostly due to Git, XAMPP and Symbolic links in xampp directory
	to the ones in my git development one.

*/

session_start();

include("_User.php") ;
include("_mySQLFunctions.php") ;
include("_GeneralFunctions.php") ;
include("_Passwords.php") ; 
include("_SiteSpecificFunctions.php") ;

//I use this variable so that I can always use single quotes to encapsulate strings.
//That way I never have to escape double quotes.  They are everywhere.
//I probably should add other escapable strings, but have yet to need them.
//This whole thing is just for readability of the source for debug purposes
$NewLine = "\n" ;

$sLoginLandingPage = 'index.php';

$sDB = 'dbgrateful' ;
//echo "I am getting ready to set the host now";
	
//echo $_SERVER["SERVER_SOFTWARE"];
if ($_SERVER["SERVER_SOFTWARE"] == "Apache/2.2.22 (Ubuntu)")
{
//For Home Server install -- this is now obsolete
  $sHost = 'localhost' ;
  $sUser = 'root' ;
  $sPass = 'gservermysqlroot';
}
elseif ($_SERVER["SERVER_SOFTWARE"] == "Apache/2.4.17 (Win32) OpenSSL/1.0.2d PHP/5.6.14")
//The line below was for xampp lite on the pen drive
//elseif ($_SERVER["SERVER_SOFTWARE"] == "Apache/2.2.14 (Win32) DAV/2 mod_ssl/2.2.14 OpenSSL/0.9.8l mod_autoindex_color PHP/5.3.1")
{
//For XAMPP install
	$sInstallType = 'XAMMP' ;
	$sHost = 'localhost' ;
	$sUser = 'root' ;
	$sPass = '';	
}
else
{
	//For GoDaddy install
	$sInstallType = 'GoDaddy' ;
	$sHost = '107.180.50.176';
	$sUser = DATABASEUSER ; //FROM passwords.php 
	$sPass = DATABASEPASSWORD;	
}

//Header and Footer Globals
$sHomePageURL = 'http://deadbase.koryhurst.com' ;//for use in clicking the header
$sAuthor = 'Kory Hurst' ;
$dRevisedDate = '2015-12-21' ;
$sSiteDescription = 'Grateful Dead Setlist Database' ; 
$sStyleSheetPath = '_Basic.css' ;
$sFooterText = 'All rights reserved' ;


//Site Specific Globals Go Here    
//$iDefaultMaxValue = 1000000 ; //should be high enough for everything including cars

?>