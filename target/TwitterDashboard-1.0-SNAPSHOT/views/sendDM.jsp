<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="showError.jsp" %>
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

<% Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
		DirectMessage message = null;
		String to = request.getParameter("name");
		System.out.println("To:"+to);
		String text = request.getParameter("msg");
		System.out.println("To:"+to+"::Message:"+text);
		String recList[] = to.split(",");
		System.out.println("splited by double space:"+recList.toString());
		String[] arr = new String[recList.length];
		int i=0;
		for(String s : recList) {
			String[] namePairs = s.split("@");
			System.out.println("splited by @:"+namePairs.toString());
			for(String s1 : namePairs)
				arr[i] = s1.trim();
			System.out.println("added:"+arr[i]);
			i++;
		}
		String notSentTo = null;
		for(String recipient : arr) {
			System.out.println("going to send to:"+recipient);
			try {
				if(recipient != null && recipient != " " && recipient != "" && text != "")
					message = twitter.sendDirectMessage(recipient,text);	
			}catch(TwitterException te) {
				System.out.println("OOPS!!"+recipient);
if(notSentTo == null)
	notSentTo = "";
else
notSentTo += ", ";
				notSentTo += recipient;
			}
			/* if(message == null)
				notSentTo += recipient+" "; */
		}
				if(notSentTo == null)
			response.sendRedirect("messages.jsp");
		else {
			response.sendRedirect("composeMsg.jsp?notSentTo="+notSentTo);
		}
			
		%>
		<br />
		<a href="messages.jsp"> Back to dashboard</a>
</body>
</html>