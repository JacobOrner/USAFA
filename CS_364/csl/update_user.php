<!-- update_user.php - Steve Hadfield - 3/24/2011 -->
<!-- sets up an update form with selected user's info -->

<?php  // session management

  // retrieve session information
  session_start();

  // if no username set, then redirect to login
  if(!isset($_SESSION['myusername'])){
    header("location:login.php");
    exit;
  }

  // check that the userId was sent
  if(!isset($_POST['user'])){
    header("location:admin.php?updateUserError=1");
    exit;
  }
?>

<!-- begin the HTML part -->

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>Cadet Service Learning Program</title>
    <link type="text/css" rel="stylesheet" href="csl.css">

    <!-- Set up style for form error feedback areas -->

    <style type="text/css">
      .formError { color: red; font-weight: bold }
    </style>

    <!-- JavaScript for login form data validation -->

    <script type="text/javascript">

      function checkUpdateUserForm()  // used to verify new info for user
      {
        // clear any old feedback

        document.getElementById('updateUserFormFeedback').innerHTML = "";

        // get form values

        var newUsernameValue = document.forms["update_user_form"]["newUsername"].value;
        var newPasswordValue = document.forms["update_user_form"]["newPassword"].value;
        var newPasswordRepeatValue = document.forms["update_user_form"]["newPasswordRepeat"].value;

        if (newUsernameValue == "")
        {
          document.getElementById('updateUserFormFeedback').innerHTML = 
                     "ERROR: Must specify a username."
          return false;
        }

        if (newPasswordValue == "")
        {
          document.getElementById('updateUserFormFeedback').innerHTML = 
                     "ERROR: Must specify a password."
          return false;
        }

        if (newPasswordValue != newPasswordRepeatValue)
        {
          document.getElementById('updateUserFormFeedback').innerHTML = 
                     "ERROR: Passwords must match."
          return false;
        }

	return true;

      }
    </script>		
  </head>

<!--  ********************************* HTML Body begins here ***************************** -->

  <body>
    <table border="0" width="100%">
      <tbody>
        <tr>
          <td colspan="4"><div id="csl_site_title" ><br/> 
            <center>Cadet Service Learning (CSL) Program</center><br /></div>
          </td>
        </tr>
        <tr>
          <td width="25%"><center><div id="csl_navigation">
            <a href="index.html">Introduction</a></div></center></td>
          <td width="25%"><center><div id="csl_navigation">
            <a href="partners.php">Service Partners</a></div></center></td>
          <td width="25%"><center><div id="csl_navigation">
            <a href="volunteer.html">Information Form</a></div></center></td>
          <td width="25%"><center><div id="csl_navigation">
            <a href="admin.php">Administration</a></div></center></td>
        </tr>
        <tr>
          <td colspan="4">
            <div id="csl_page_title"><br /><p><center>CSL Admin User Form</center></p></div>
            <center><em><font color="blue">Welcome, 
              <?php echo $_SESSION['myusername'].'.<br/>'; ?></font></em></center>
            <center>

<!-- ************************* Retrieve info to pre-populate the update form ************************** -->

             <?php // hit the database to retrieve the current data values

                // open connection to the database on LOCALHOST with 
                // userid of 'root', password of 'secret', and database 'csl'

                @ $db = new mysqli('LOCALHOST', 'root', 'secret', 'csl');

                // Check if there were error and if so, report and exit

                if (mysqli_connect_errno()) 
                { 
                  echo 'ERROR: Could not connect to database.  Error is '.mysqli_connect_error();
                  exit;
                }

                // run the SQL query to retrieve the service partner info

                $results = $db->query('SELECT * FROM USERS WHERE userId = '.$_POST['user']);

                $r= $results->fetch_assoc();

                $userId = $r['userId'];
                $userName = $r['userName'];

                // deallocate memory for the results and close the database connection

                $results->free();
                $db->close();

              ?>

<!-- ******************************** User Info Update Form ********************************* -->

              <hr>
              <form name="update_user_form" method="post" id="update_user_form" 
                    action="update_user_action.php" onsubmit="return checkUpdateUserForm()">
                <table border="0" cellpadding="3" cellspacing="1">
                  <tr>
                    <td colspan="2">
                      <center>
                        <div id="updateUserFormFeedback" class="formError"></div>
                      </center>
                    </td>
                  </tr>
                  <tr>
                    <td>Username</td>
                    <td><input name="existingUserId" type="hidden" id="existingUserId" 
                               value="<?php echo $userId; ?>">  <!-- hidden field to hold userId -->
                        <input name="newUsername" type="text" id="newUsername" value="<?php echo $userName; ?>"></td>
                  </tr>
                  <tr>
                    <td>Password</td>
                    <td><input name="newPassword" type="password" id="newPassword"></td>
                  </tr>
                  <tr>
                    <td>Repeat Password</td>
                    <td><input name="newPasswordRepeat" type="password" id="newPasswordRepeat"></td>
                  </tr>
                  <tr>
                    <td colspan="2"><br/>
                      <center><input type="submit" name="Submit" value="Update User"></center>
                    </td>
                  </tr>
                </table>
              </form>

              <hr>
              <form name="logout_form" method="post" id="logout_form" action="logout.php">
                <input type="Submit" name="Submit" value="Logout">
              </form>
            </center>
          </td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
