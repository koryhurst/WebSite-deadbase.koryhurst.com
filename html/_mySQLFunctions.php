<?php

/*

Version 1.0 

Notes:
This Include is built on the use of a single database on a single host


Version Details:
	V1.0
		Initial Version
	V1.1
		Added commented out echo for the dbName
*/

function GetRS($sSQL)
{
	//if the number of fields is greater than 1
	//the GetRS function returns a multidimensional array
	//it can be thought of as [rows][column] and column can be actual column name.
	//if the number of fields is 1
	//then the GetRS function returns a one dimensional array
	//echo "<BR>" . $sSQL . "<BR>";	
	//echo $GLOBALS['sDB'] . "<BR>";
	//echo $GLOBALS['sHost'] . "<BR>";	
	//echo $GLOBALS['sUser'] . "<BR>";	
	//echo $GLOBALS['sPass'] . "<BR>";	
	$oMySQLLink = mysql_connect($GLOBALS['sHost'],$GLOBALS['sUser'],$GLOBALS['sPass']);
	if (!$oMySQLLink) 
	{
	  die('Could not connect: ' . mysql_error());
	}
	else 
	{
		mysql_select_db($GLOBALS['sDB']);
		$oMySQLResource = mysql_query($sSQL);
		if (is_bool($oMySQLResource)) 
		{
			echo "Likely error in SQL:  " . $sSQL . "<br>";
		}
		else
		{
			//concious decision to deal only with arrays in code outside of this include file
			$aAllRows = array();
	
			while ($aRetrievedRow = mysql_fetch_array($oMySQLResource, MYSQL_BOTH)) 
				
//			while ($aRetrievedRow = mysql_fetch_array($oMySQLResource, MYSQL_ASSOC)) 
//			while ($aRetrievedRow = mysql_fetch_array($oMySQLResource, MYSQL_NUM)) 
			{	if (mysql_num_fields($oMySQLResource) == 1)
				{
					array_push($aAllRows, $aRetrievedRow[0]) ;			
				}
				else
				{
					array_push($aAllRows, $aRetrievedRow) ;								
				}
			}	
		}
		//print_r($aAllRows);
		return $aAllRows;
		mysql_free_result($oMySQLResource);
		mysql_close($oMySQLLink);
	}
}

Function CleanSQLString($sStringToClean)
{
	//this may not be necessary for CL Helper,
	//this was done inline for the post title and body.
	//the last link opened was sufficient that you didn't have to respecify it
	//likely true as there is only one database to connect to, and once logged in
	//that was the last link used.
	echo $sStringToClean .'<BR>';
	$oMySQLLink = mysql_connect($GLOBALS['sHost'],$GLOBALS['sUser'],$GLOBALS['sPass']);
	if (!$oMySQLLink) 
	{
	  die('Could not connect: ' . mysql_error());
	}
	else 
	{
		echo mysql_real_escape_string($sStringToClean, $oMySQLLink) .'<BR>';
		return mysql_real_escape_string($sStringToClean, $oMySQLLink) ;
	}
}

function ExecuteSQL($sSQL)
{
	
	//for some reason this doesn't return anything if the query is malformed.
	//for example test an insert where the number of columns listed
	//doesn't match the values supplied.  This returns null.
	
	$oMySQLLink = mysql_connect($GLOBALS['sHost'],$GLOBALS['sUser'],$GLOBALS['sPass']);
	if (!$oMySQLLink) 
	{
	  die('Could not connect: ' . mysql_error());
	}
	else 
	{
		//echo $sSQL;
		mysql_select_db($GLOBALS['sDB']);
		return mysql_query($sSQL);
		//echo mysql_error();
	}
}


function EnsureConnection()
{	
	$oMySQLLink = mysql_connect($GLOBALS['sHost'],$GLOBALS['sUser'],$GLOBALS['sPass']);
	if (!$oMySQLLink) 
	{
	  die('Could not connect: ' . mysql_error());
		return False ;
	}
	else 
	{
		return True ;
	}
}	

?>
