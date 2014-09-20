<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.IDs"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.User"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Twitter Direct message</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
<script src="../js/jquery.autocomplete.js"></script>	
<script>
	jQuery(function(){
		$("#name").autocomplete("list.jsp");
	});
   </script>
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/autocomplete.css" />
</head>
<body>
<%
if(request.getSession().getAttribute("followers") == null) {
Twitter twitter = (Twitter) request.getSession().getAttribute(
			"twitter");
	long lCursor = -1;
	IDs followingIDs = null;
	IDs followersIDs = null;
	int count=0;
	List<String> followers = new ArrayList<String>();
	try {
		String userID = twitter.getScreenName();
		long[] followerID = twitter.getFollowersIDs(userID, -1).getIDs();  //get ids of users who are following him
		ResponseList<User> userName = twitter.lookupUsers(followerID);
		for (User u : userName) {
			followers.add(u.getName()+" @"+u.getScreenName());
			System.out.println(u.getName()+" @"+u.getScreenName());
		}
	} catch (TwitterException e) {
		e.printStackTrace();
	}
	request.getSession().setAttribute("followers",followers);
}
	 %>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          
<a class="brand" href="messages.jsp">
            Back to Dashbooard
          </a>

<a class="brand" href="loggedOut.jsp">
            Logout
          </a>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>


<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form name="composeForm" action="sendDM.jsp" method="post">
<br /><br /><br />
		<table cellspacing="10">
			<tr>
				<td colspan=2 ><h3>Compose Direct Message<h3></h3></td>
			</tr>
<tr></tr><tr></tr>
			<tr>
				<td colspan=2></td>
			</tr>
			<tr>
				<td align="right">To</td>
				<td> <input type="text" id="name" name="name" autocomplete="off" spellcheck="false"></td>
			</tr>
			<tr>
				<td align="right">Message</td>
				<td><textarea class="input-xxlarge" name="msg"></textarea> </td>
			</tr>
			<tr>
				<td></td>
				<td><button id="btn1" class="btn btn-success" type="submit">Send</button></td>
			</tr>
		</table>
		</form>
            
        </div>
    </div>
</div>

<div class="container">
<footer>
        <p>&copy; Akosha 2014</p>
      </footer>
</div>

    
</body>
</html>