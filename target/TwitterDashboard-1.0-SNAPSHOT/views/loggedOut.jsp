<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="twitter4j.Twitter"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%Twitter twitter = (Twitter) request.getSession().getAttribute(
			"twitter");
	twitter.setOAuthAccessToken(null);
	request.getSession().setAttribute("twitter", null);
				request.getSession().setAttribute("accessToken", null);
				
		request.getSession().invalidate();
		
		response.sendRedirect("../index.jsp");
		%>
	<h2>Successfully logged out!!</h2>
	<a href="../index.jsp" >Home</a>
</body>
</html>