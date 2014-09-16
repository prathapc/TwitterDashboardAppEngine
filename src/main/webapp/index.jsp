<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>Akosha-Twitter DM dashboard</title>
<script type="text/javascript" src="js/twitterLogin.js"></script>
</head>
<body>
<h1>Welcome to akosha twitter dashboard!!</h1>
<h2>Please login with your twitter access all your Direct messages and to reply to your followers.. </h2>
<br />
	<tag:notloggedin>
		<center><a href="javascript:twitter_login()"><img alt="twitter login"
			src="images/sign-in-with-twitter-gray.png" /></a></center>

	</tag:notloggedin>

	<tag:loggedin>
		
	<jsp:forward page="/views/TwitterDashboard.jsp"></jsp:forward>
		
	</tag:loggedin>

</body>
</html>