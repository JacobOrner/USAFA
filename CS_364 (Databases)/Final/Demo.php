<html>

<!-- Demo.php - 3/13/2017 - Samuel Sambasivam -->
<!-- Shows how to access POST and SYSTEM parameters in PHP -->

 <head>
   <title>NCLS Registration.php</title>
   <style> 
     body {font-family: Arial; color: black; } 
     h1 {background-color: blue; color: white; }
   </style>
 </head>

 <body>
   <center>
     <h1>NCLS Registration Results</h1>
     <br />
     <br />

<!-- Note the use of <?php ?> to embed PHP commands 
     and $_POST['<parameter_name>'] to get POST parameters -->

     <table border="1" cellpadding="3">
       <tr><th>Parameter</th><th>Value</th></tr>
       <tr><td>First Name</td><td><?php echo $_POST['firstName']; ?></td></tr>
       <tr><td>Last Name</td><td><?php echo $_POST['lastName']; ?></td></tr>
       <tr><td>Email Address</td><td><?php echo $_POST['emailAddress']; ?></td></tr>
       <tr><td>Class Year</td><td><?php echo $_POST['classYear']; ?></td></tr>
       <tr><td>Squadron</td><td><?php echo $_POST['squadron']; ?></td></tr>
     </table>
     <br />

<!-- Below demonstrates how to get system information from PHP -->

     Web page <b><?php echo $_SERVER['DOCUMENT_ROOT'].$_SERVER['REQUEST_URI'] ?></b><br />
     accessed on <b><?php echo date("Y-m-d H:i") ?></b> 
        from IP address <b><?php echo $_SERVER['REMOTE_ADDR'] ?></b> via
        <b><?php echo $_SERVER['REQUEST_METHOD'] ?></b><br/>
     <br />

<!-- Give a link back to the main page -->

     <a href="Index.html">Click Here</a> to return to the NCLS web site.

   </center> 
 </body>
</html> 