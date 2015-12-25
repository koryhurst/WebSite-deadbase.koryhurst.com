<?php

/*

Version Notes	

Version 1.0 
	Basic set up
Version 1.1
	Do not check for new ads automatically on login
Version 1.2
	Removed echo on Line 44 for sSQL
	
		
*/

include("_Vars.php") ;
	
//This is to recycle this page for use in registration
//basically to retrieve the UserID, which was created during 
//the registration insert

if (isset($_SESSION['UserName']))
{
	print_r($_SESSION);
	$UserName = $_SESSION["UserName"] ;
	$Password = $_SESSION["Password"] ;
}
else
{
	$UserName = $_POST["UserName"] ;
	$Password = hash('sha256', $_POST["Password"]) ;
}

//probably worth getting the password too (once it is hashed)
//for use on password resets
$sSQLUser = "select UserID, FirstName, LastName from tbluser " ;
$sSQLUser = $sSQLUser . "where UserName = '" . $UserName . "' and Password = '" . $Password ."'" ;
$aUser = GetRS($sSQLUser);

//echo $sSQL ;

if (count($aUser) == 0) 
{
	echo $sSQL ;
	echo "<br><br>User Not Validated";	
	//maybe this can still go back to the main page with a session variable for 
	//login error - to be used in WriteLoginBox function
	//header('Location: ' . 'LoginError.php');
}
else
{
	$_SESSION['UserID'] = $aUser[0]['UserID'];
	$_SESSION['FirstName'] = $aUser[0]['FirstName'];
	$_SESSION['LastName'] = $aUser[0]['LastName'];
	GetApplicationSpecificDetails($_SESSION['UserID']);
	//$sUserID = $search[0];
	//echo $sUserID;
	//echo $_SESSION['UserID'];
	//print_r($_SESSION);
	header('Location: ' . $GLOBALS['sLoginLandingPage']);
}

?>