<!-- login.php - Steve Hadfield - 3/24/2011 -->
<!-- provides the login form for administrative users -->

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
      function checkLoginForm()
      {
        var userName = document.forms["login_form"]["myusername"].value;

        if (userName == "") 
        {
          document.getElementById('formFeedback').innerHTML = "ERROR: User Name must be specified.";
          return false;
        }
        else
          return true;
      }
    </script>		
  </head>

<!-- ************************ Begin the HTML Body ************************** -->

  <body>
    <table border="0" width="100%">
      <tbody>
        <tr>
          <td colspan="4"><div id="csl_site_title" ><br/> <center>Cadet Service Learning (CSL) Program</center><br /></div></td>
        </tr>
        <tr>
          <td width="25%"><center><div id="csl_navigation"><a href="index.html">Introduction</a></div></center></td>
          <td width="25%"><center><div id="csl_navigation"><a href="partners.php">Service Partners</a></div></center></td>
          <td width="25%"><center><div id="csl_navigation"><a href="volunteer.html">Information Form</a></div></center></td>
          <td width="25%"><center><div id="csl_navigation"><a href="admin.php">Administration</a></div></center></td>
        </tr>

<!-- ***************************** Begin the actual login form ***************************** -->

        <tr>
          <td colspan="4">
            <div id="csl_page_title"><br /><p><center>CSL Admin Login</center><p></div>
            <center>
              <form name="login_form" method="post" id="login_form" action="checklogin.php" onsubmit="return checkLoginForm()">
                <table border="0" cellpadding="3" cellspacing="1">
                  <tr>
                    <td colspan="2">
                      <div id="formFeedback" class="formError">
                        <?php 
                          if (isset($_GET['err'])) {echo 'ERROR: Username - password not valid.'; }
                        ?>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>Username</td>
                    <td><input name="myusername" type="text" id="myusername"></td>
                  </tr>
                  <tr>
                    <td>Password</td>
                    <td><input name="mypassword" type="password" id="mypassword"></td>
                  </tr>
                  <tr>
                    <td colspan="2"><br/><center><input type="submit" name="Submit" value="Login"></center></td>
                  </tr>
                </table>
              </form>
            </center>
          </td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
