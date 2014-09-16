<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="twitter4j.Twitter, twitter4j.ResponseList, twitter4j.DirectMessage"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="twitter4j.TwitterException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Twitter dashboard</title>

</head>
<body>
	<h2>Direct messages sent and received by you</h2>
	<%
		Twitter twitter = (Twitter) request.getSession().getAttribute(
				"twitter");
		ResponseList<DirectMessage> receivedMessages = twitter
				.getDirectMessages();
		ResponseList<DirectMessage> sentMessages = twitter
				.getSentDirectMessages();
		// Set<Map<Date,String>> conversations = new HashSet<HashMap<Date,String>()>();
		TreeMap<Date, String> messageWithDate = null;
		Map<String, TreeMap<Date, String>> conversations = new TreeMap<String, TreeMap<Date, String>>();

		for (DirectMessage recMessage : receivedMessages) {
			//System.out.println(recMessage.getText()+"::"+recMessage.getSenderScreenName()+"::"+recMessage.getCreatedAt());
			if (!(conversations.containsKey(recMessage
					.getSenderScreenName()))) {
				messageWithDate = new TreeMap<Date, String>();
				messageWithDate.put(recMessage.getCreatedAt(), "RECEIVED:"
						+ recMessage.getText());
				conversations.put(recMessage.getSenderScreenName(),
						messageWithDate);
			} else {
				messageWithDate = conversations.get(recMessage
						.getSenderScreenName());
				messageWithDate.put(recMessage.getCreatedAt(), "RECEIVED:"
						+ recMessage.getText());
			}

		}

		for (DirectMessage sentMessage : sentMessages) {
			//System.out.println(sentMessage.getText()+"::"+sentMessage.getRecipientScreenName()+"::"+sentMessage.getCreatedAt());
			if (!(conversations.containsKey(sentMessage
					.getRecipientScreenName()))) {
				messageWithDate = new TreeMap<Date, String>();
				messageWithDate.put(sentMessage.getCreatedAt(), "SENT:"
						+ sentMessage.getText());
				conversations.put(sentMessage.getRecipientScreenName(),
						messageWithDate);
			} else {
				messageWithDate = conversations.get(sentMessage
						.getRecipientScreenName());
				messageWithDate.put(sentMessage.getCreatedAt(), "SENT:"
						+ sentMessage.getText());
			}

		}
		for (Entry<String, TreeMap<Date, String>> entry : conversations
				.entrySet()) {
	%><b> <%
 	out.println("Messages with:" + entry.getKey());
 %>
	</b>
	<%
		
	%><br />
	<%
		for (Entry<Date, String> messageThread : entry.getValue()
					.entrySet()) {
				out.println(messageThread.getValue() + "::"
						+ messageThread.getKey());
	%><br />
	<%
		}
			out.println("-----------------------");
	%><br />
	<%
		}
	%>

	<form name="composeForm" action="sendDM.jsp" method="post">
		<table>
			<tr>
				<td colspan=2 align="center"><b>Compose Direct Message:</b></td>
			</tr>
			<tr>
				<td colspan=2></td>
			</tr>
			<tr>
				<td>To</td>
				<td><input type="text" name="name" value=""></td>
			</tr>
			<tr>
				<td>Message</td>
				<td><textarea rows="6" name="msg"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="Submit" value="Send"></td>
			</tr>
		</table>
<br />
		<a href="/loggedOut.jsp" > Logout</a>
		</form>
</body>
</html>