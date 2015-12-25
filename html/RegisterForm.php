<?php

/*

Version 1.0

*/

session_start();

include("mySQLFunctions.php") ;
include("CLHelperFunctions.php") ;
include("GeneralFunctions.php") ;
include("Security.php") ;

WriteHeader("Registration");

echo '<form action="SaveUser.php" method="post">' ;
echo '<table>' ;
echo '<tr>' ;
echo '<td>First Name:</td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td><input type="text" name="FirstName" /></td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td>Last Name:</td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td><input type="text" name="LastName" /></td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td>User Name:</td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td><input type="text" name="UserName" /></td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td>Password:</td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td><input type="password" name="Password" />Please Note passwords are currently stored as plain text</td>' ;
echo '</tr>' ;
echo '<tr>' ;
echo '<td><input type="submit" name="Register" /></td>' ;
echo '</tr>' ;
echo '</table>' ;
echo '</form>' ;

WriteFooter();

?>