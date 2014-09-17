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
<%@page import="twitter4j.User"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Conversation messages</title>
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

<style>
#container1 {
	margin: 0 auto;
	width: 600px;
}
#compose {
	margin: 0 auto;
	width: 600px;
	float: right;
}
.stbody {
	min-height: 35px;
}

.stbody {
	min-height: 35px;
	margin-bottom: 5px;
	border-bottom: dashed 1px #00cc00;
}

.stimgleft {
	float: left;
	height: 50px;
	width: 50px;
	border: solid 1px #dedede;
	padding: 5px;
}
.stimgright {
	float: right;
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
	font-family: 'Verddana', Arial, Sans-serif
}

.sttime {
	font-size: 9px;
	color: #999;
	font-family: Arial, Helvetica, sans-serif;
	margin-top: 5px;
}

.textmessage {
	border: 2px solid #000;
	font-size: 16px;
	font-weight: bold;
	width: 450px;
	height: 40px;
	float: left;
	box-sizing: border-box;
	vertical-align: middle;
}

.submitmessage {
	border: 2px solid #000;
	font-size: 20px;
	font-weight: bold;
	width: 120%;
	height: 40px;
	float: right;
	margin-left: 5px;
}
</style>

</head>

<body>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="messages.jsp">
            Back to Dashbooard
          </a>
<a class="brand" href="composeMsg.jsp">
            Send new message
          </a>
<a class="brand" href="loggedOut.jsp">
            Logout
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>

	<%
Map<String, TreeMap<Date, String>> conversations = (Map<String, TreeMap<Date,String>>)request.getSession().getAttribute("conversations");
	System.out.println("con size"+conversations.size());
	Twitter twitter = (Twitter) request.getSession().getAttribute(
		"twitter");
TreeMap<Date,String> messageAndDate = conversations.get(request.getParameter("name"));
User user = twitter.showUser(twitter.getId());
String imgUrl;
for(Entry entry : messageAndDate.entrySet()) {
	System.out.println(entry.getKey()+"::"+entry.getValue());
if(entry.getValue().toString().startsWith("SENT:"))
	imgUrl = user.getProfileImageURL().toString();
else
	imgUrl = request.getParameter("image");
%>
	<div id='container1'>
		<div class="stbody">
			<%if(imgUrl.equals(request.getParameter("image"))) {
			%>
			<div class="stimgright">
				<img src="<%= imgUrl %>" style='width: 50px; height: 50px' />
			</div>
			<% } else {
		%><div class="stimgleft">
				<img src="<%= imgUrl %>" style='width: 50px; height: 50px' />
			</div>
			<%} %>
			<div class="sttext">
				<%= entry.getValue() %>
				<div class="sttime"><%= entry.getKey() %></div>
			</div>
		</div>
	</div>
	<%} %>
	<form name="composeForm" action="sendDM.jsp" method="post">
	<div id='container1'>
			<div class="compose">
			<input type="hidden" name="name" value="<%= request.getParameter("name") %>"></input>
					<textarea class="input-xxlarge" name="msg"></textarea> 
						<button id="btn1" class="btn btn-success" type="submit">Send</button>
			</div>
	</div>
	</form>

<div class="container">

<footer>
        <p>&copy; Akosha 2014</p>
      </footer>
</div>

<script src="jquery-1.8.3.js">
    </script>
    
    <script src="assets/js/bootstrap.js">
    </script>
  
</body>
</html>
