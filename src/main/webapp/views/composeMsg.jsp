<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Twitter Direct message</title>
</head>
<body>
<h1>This page not looks great right?? i am working on it, in next few minutes you can see a great page here..
<h1>Send Direct message to any of your followers!!</h1>
<h2>Please enter twitter id and message you want to send</h2>
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
				<td><input type="text" width="100" name="name" value=""></td>
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
		<br /><a href="messages.jsp" >Go Back to Dashboard</a>
		</form>
</body>
</html>