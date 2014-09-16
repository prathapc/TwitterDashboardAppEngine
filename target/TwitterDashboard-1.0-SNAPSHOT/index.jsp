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

<% if(request.getParameter("logout") != null) {
				request.getSession().setAttribute("twitter",null);
				request.getSession().setAttribute("accessToken",null);
				
				out.print("Successfully logged out");
			}
			%>
	</tag:notloggedin>

	<tag:loggedin>
		
	<jsp:forward page="/views/TwitterDashboard.jsp"></jsp:forward>
		
	</tag:loggedin>

</body>
</html>