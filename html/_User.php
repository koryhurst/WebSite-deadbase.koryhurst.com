<?php

/*

Version 1.0

Notes:
	
Function List:
	
	
Version Details:
	V1.0
		Initial Version
	V1.1
		Moved function GetApplicationSpecificDetails to SiteSpecificFunctions So that this file can be standard across sites 
		Commented out storage format of password note.
		Added . $Newline everywhere
		Removed 2 unnecessary escape characters
	V1.2
		Replaced $NewLine with $GLOBALS['NewLine']
		
*/



function WriteLoginBox() 
{
	//no classes yet for this yet
	//probably could use its own css
	echo '<form action="_Login.php" method="post">' . $GLOBALS['NewLine'] ;
	echo '<table>' . $GLOBALS['NewLine'] ;
	echo '<tr>' . $GLOBALS['NewLine'] ;
	echo '<td>User Name:</td>' . $GLOBALS['NewLine'] ;
	echo '</tr>' . $GLOBALS['NewLine'] ;
	echo '<tr>' . $GLOBALS['NewLine'] ;
	echo '<td><input type="text" name="UserName"></td>' . $GLOBALS['NewLine'] ;
	echo '</tr>' . $GLOBALS['NewLine'] ;
	echo '<tr>' . $GLOBALS['NewLine'] ;
	echo '<td>Password:</td>' . $GLOBALS['NewLine'] ;
	echo '</tr>' . $GLOBALS['NewLine'] ;
	echo '<tr>' . $GLOBALS['NewLine'] ;
	echo '<td><input type="password" name="Password">' . $GLOBALS['NewLine'] ;
	echo 'Please Note passwords are currently stored as sha256' . $GLOBALS['NewLine'] ;
	echo '</td>' . $GLOBALS['NewLine'] ;
	echo '</tr>' . $GLOBALS['NewLine'] ;
	echo '<tr>' . $GLOBALS['NewLine'] ;
	echo '<td><input type="submit" name="Login"></td>' . $GLOBALS['NewLine'] ;
	echo '</tr>' . $GLOBALS['NewLine'] ;
	echo '<tr>' . $GLOBALS['NewLine'] ;
	echo '<td>Or <a href="RegisterForm.php">Register</a></td>' . $GLOBALS['NewLine'] ;
	echo '</tr>' . $GLOBALS['NewLine'] ;
	echo '</table>' . $GLOBALS['NewLine'] ;
	echo '</form>' . $GLOBALS['NewLine'] ;
}


?>