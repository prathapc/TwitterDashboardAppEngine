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
		try {
			if(to != "" && text != "")
				message = twitter.sendDirectMessage(to,text);
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(message != null)
			out.print("Your message sent successfully!! Now you can see recent message in the Dashboard!!");
		else
			out.print("OOPS!! Please try again later");
		%>
		<br />
		<a href="/views/composeMsg.jsp"> Back</a>
</body>
</html>