<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>The sample twitter login testing</title>
<script type="text/javascript" src="js/twitterLogin.js"></script>
</head>
<body>

	<tag:notloggedin>
		<a href="javascript:twitter_login()"><img alt="twitter login"
			src="images/sign-in-with-twitter-gray.png" /></a>

	</tag:notloggedin>

	<tag:loggedin>
		
	<jsp:forward page="/views/TwitterDashboard.jsp"></jsp:forward>
		
	</tag:loggedin>

</body>
</html>