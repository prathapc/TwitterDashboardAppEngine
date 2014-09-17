<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="twitter4j.Twitter, twitter4j.ResponseList, twitter4j.DirectMessage"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="twitter4j.TwitterException"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Allyour Direct messages</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<style>
      body { padding-top: 60px; /* 60px to make the container go all the way
      to the bottom of the topbar */ }
    </style>
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <style>
    </style>
<script type="text/javascript" src="js/twitterLogin.js"></script>

<style>
#container {
	margin: 0 auto;
	width: 600px;
}

.stbody {
	min-height: 70px;
}

.stbody {
	min-height: 70px;
	margin-bottom: 10px;
	border-bottom: dashed 1px #cc0000;
}

.stimg {
	float: left;
	height: 50px;
	width: 50px;
	border: solid 1px #dedede;
	padding: 5px;
}

.sttext {
	margin-left: 70px;
	min-height: 50px;
	word-wrap: break-word;
	overflow: hidden;
	padding: 5px;
	display: block;
	font-family: 'Georgia', Times New Roman, Times, serif
}

.sttime {
	font-size: 11px;
	color: #999;
	font-family: Arial, Helvetica, sans-serif;
	margin-top: 5px;
}
</style>
</head>

<body>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="">
            Get started
          </a>
<a class="brand" href="composeMsg.jsp">
            Send new message
          </a>

          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>


	<%
		Twitter twitter = (Twitter) request.getSession().getAttribute(
				"twitter");
	
		ResponseList<DirectMessage> receivedMessages = twitter
				.getDirectMessages();
		ResponseList<DirectMessage> sentMessages = twitter
				.getSentDirectMessages();
		// Set<Map<Date,String>> conversations = new HashSet<HashMap<Date,String>()>();
		TreeMap<Date, String> messageWithDate = null; //messageTime,messageText
		Map<String, TreeMap<Date, String>> conversations = new TreeMap<String, TreeMap<Date, String>>(); //(name,(messageTime,messageText))

		Map<String,String> users = new TreeMap<String,String>(); //screen name,imageURL
		Map<String, TreeMap<Date, String>> userLastMessageDetail = new TreeMap<String, TreeMap<Date, String>>(); //(name,(lastmessage, lastmessageTime))

		for (DirectMessage recMessage : receivedMessages) {
			
			users.put(recMessage.getSenderScreenName(),recMessage.getSender().getProfileImageURL());
			
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
			users.put(sentMessage.getRecipientScreenName(),sentMessage.getRecipient().getProfileImageURL());
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
		request.getSession().setAttribute("conversations", conversations);
		
	 TreeMap<Date,String> lastMsgdetail;
	 
	for(Entry<String,String> entry : users.entrySet()) { 
	lastMsgdetail = conversations.get(entry.getKey());
	Entry<Date,String> lastEntry =lastMsgdetail.lastEntry();
	System.out.println("image:"+entry.getValue());
	%>
	<div id='container'>
		<a href="conversation.jsp?name=<%= entry.getKey()%>&image=<%= entry.getValue() %>">
			<div class="stbody">
				<div class="stimg">
					<img src="<%= entry.getValue() %>"
						style='width: 50px; height: 50px' />
				</div>
				<div class="sttext">
					<%= entry.getKey() %>
					<div class="sttime"><%= lastEntry.getValue() %></div>
				</div>
			</div>
		</a>

	</div>
	<% } %>



<div id='container'>

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
