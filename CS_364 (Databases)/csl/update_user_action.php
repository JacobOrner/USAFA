<?php
  // update_user_action.php - 3/24/2011 - Steve Hadfield 
  // performs the update of user info based on info form update_user.php 

  // check that a userId value was sent

  if ( !isset($_POST['existingUserId']) )
  {
    header("location:admin.php?updateUserError=1"); 
    exit;
  }

  // open connection to the database on LOCALHOST with 
  // userid of 'root', password 'secret', and database 'csl'

  @ $db = new mysqli('LOCALHOST', 'root', 'secret', 'csl');

  // Check if there were error and if so, report and exit

  if (mysqli_connect_errno()) 
  { 
    echo 'ERROR: Could not connect to database, error is '.mysqli_connect_error();
    exit;
  }

  // sanitize the input from the form to eliminate possible SQL Injection

  $newUsername = stripslashes($_POST['newUsername']);
  $newUsername = $db->real_escape_string($newUsername);

  $newPassword = stripslashes($_POST['newPassword']);
  $newPassword = $db->real_escape_string($newPassword);

  // encrypt the password with MD5

  $newPassword = md5($newPassword);

  // update the selected user with a prepared statement

  $query = "UPDATE USERS SET userName=?, userPassword=? WHERE userId = ?";

  $stmt = $db->prepare($query);

  $stmt->bind_param("ssi", $newUsername, $newPassword, $_POST['existingUserId']);

  $stmt->execute();

  // check for errors

  if ($stmt->errno <> 0)
  {
    $stmt->close();
    $db->close();
    header("location:admin.php?updateUserError=2");
    exit;
  }

  // deallocate memory for the results and close the database connection

  $stmt->close();

  $db->close();

  // return to admin.php with successful notification

  header("location:admin.php?updateUserSuccess=1");

?>
