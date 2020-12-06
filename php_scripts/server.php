<?php 
	// Allows for connection to info2180-group-project database
	// newConnection setups up PDO connection with database
	function newConnection(){
		$host = "localhost";
		$user = "admin";
		$password = "password";
		$db = "BugMe";
		return new PDO("mysql:host=$host;dbname=$db", $user, $password);
	}
?>
