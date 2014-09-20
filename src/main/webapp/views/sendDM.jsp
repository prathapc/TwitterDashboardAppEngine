<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.DirectMessage"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% Twitter twitter = (Twitter) request.getSession().getAttribute(
				"twitter");
		DirectMessage message = null;
		String to = request.getParameter("name");
		String text = request.getParameter("msg");
		String arr[] = to.split("@");
		for(String s : arr)
			to = s;
				if(to != "" && text != "")
					message = twitter.sendDirectMessage(to,text);
		if(message != null)
			response.sendRedirect("messages.jsp");
		else {
			out.println("<html><head></head><body><script>alert('This message can not be sent. Please try again. ');</script></body</html>");
			response.sendRedirect("composeMsg.jsp");
		}
			
		%>
		<br />
		<a href="messages.jsp"> Back to dashboard</a>
</body>
</html>