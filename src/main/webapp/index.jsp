<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>Akosha-Twitter DM dashboard</title>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<style>
      body { padding-top: 60px; /* 60px to make the container go all the way
      to the bottom of the topbar */ }
    </style>
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <style>
    </style>
<script type="text/javascript" src="js/twitterLogin.js"></script>
</head>
<body>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="">
            Get started
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="hero-unit">
        <div>
          <h1>
            Welcome to Twitter Dashboard!!
          </h1>
          <p>
            To get started, you need to login with your twitter account. Twitter dashboard is an app which faiclitates accessing your twitter Direct messages at a glance in a webpage and you can send messages as well.
          </p>
        </div>
<br />
        <tag:notloggedin> 
		<center><a href="javascript:twitter_login()"><img alt="twitter login"
			src="images/sign-in-with-twitter-gray.png" /></a></center>

	</tag:notloggedin>

	<tag:loggedin>
		
	<jsp:forward page="/views/messages.jsp"></jsp:forward>
		
	</tag:loggedin>
      </div>
      <div>
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