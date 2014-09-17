<%@page import="twitter4j.auth.AccessToken"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
 <%!private long userId;
	private String screenName;
	private String name;
	private String avatarUrl;
	private String selfDescription;%>

	<%Twitter twitter = (Twitter) request.getSession().getAttribute(
			"twitter");
	AccessToken accessToken = (AccessToken)request.getSession().getAttribute("accessToken");
	userId = accessToken.getUserId();
	User user = twitter.showUser(userId);
	twitter.destroyStatus(user.getId());
	
	request.getSession().setAttribute("twitter", null);
		request.getSession().setAttribute("accessToken", null);
				
		//request.getSession().invalidate();
		session.invalidate();
		response.sendRedirect("../index.jsp");
		%>
	<a href="../index.jsp" >Home</a>
</body>
</html>