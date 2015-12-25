<?php

/*

Version 1.0

*/

//this can probably be updated to use the function in mySQLFunctions.php
session_start();
	
$link = mysql_connect('localhost', "root");
mysql_select_db("dbCLHelper");

//print_r($_POST);

$NewUserName = $_POST["UserName"] ;
$NewFirstName = $_POST['FirstName'] ;
$NewLastName= $_POST['LastName'] ;
$NewPassword = $_POST["Password"] ;

//Next chunk is to be added to deal with changes to 
//user information

//if (isset($_SESSION['UserID']))
//{
//	print_r($_SESSION);
//	$UserID = $_SESSION['UserID'] ;
//	$UserName = $_SESSION['UserName'] ;
//	$FirstName = $_SESSION['FirstName'] ;
//	$LastName= $_SESSION['LastName'] ;
//	
//
//}
//else

//Need a Check here to keep username distinct

//if(bOKToAddUser)
//{

$SQLInsert = "INSERT INTO tbluser (UserName, FirstName, LastName, Password) " ;
$SQLInsert = $SQLInsert . "VALUES (" ;
$SQLInsert = $SQLInsert . "'" . $NewUserName . "' , " ;
$SQLInsert = $SQLInsert . "'" . $NewFirstName . "', " ;
$SQLInsert = $SQLInsert . "'" . $NewLastName . "', " ;
$SQLInsert = $SQLInsert . "'" . $NewPassword . "' " ;
$SQLInsert = $SQLInsert . ")";
//echo $SQLInsert . "<br>";
$DidItInsert = mysql_query($SQLInsert);

if ($DidItInsert)
{
	$_SESSION['UserName'] = $NewUserName;
	$_SESSION['FirstName'] = $NewFirstName;
	$_SESSION['LastName'] = $NewLastName;	
	$_SESSION['Password'] = $NewPassword;	
	//send it to login to get userID
	header('Location: ' . 'Login.php');
}
else
{
	//header('Location: ' . 'RegisterForm.php'); //pass array of errors 
}


?>