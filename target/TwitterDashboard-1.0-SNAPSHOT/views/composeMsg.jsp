<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Twitter Direct message</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<style>
      body { padding-top: 60px; /* 60px to make the container go all the way
      to the bottom of the topbar */ }
    </style>
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <style>
    .container {
	font-family: 'Verddana', Arial, Sans-serif
}
    </style>

</head>
<body>

<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="">
            Get started
          </a>
<a class="brand" href="messages.jsp">
            Back to Dashbooard
          </a>
<a class="brand" href="loggedOut.jsp">
            Logout
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>


<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form name="composeForm" action="sendDM.jsp" method="post">
		<table>
			<tr>
				<td colspan=2 ><h3>Compose Direct Message<h3></h3></td>
			</tr>
			<tr>
				<td colspan=2></td>
			</tr>
			<tr>
				<td>To</td>
				<td><input type="text" width="100" name="name" value=""></td>
			</tr>
			<tr>
				<td>Message</td>
				<td><textarea class="input-xxlarge" name="msg"></textarea> </td>
			</tr>
			<tr>
				<td></td>
				<td><button id="btn1" class="btn btn-success" type="submit">Send</button></td>
			</tr>
		</table>
		</form>
            
        </div>
    </div>
</div>

<div class="container">
<footer>
        <p>&copy; Company 2014</p>
      </footer>
</div>

<script src="jquery-1.8.3.js">
    </script>
    
    <script src="assets/js/bootstrap.js">
    </script>
  
</body>
</html>