<%@page import="com.akosha.servlet.ListToJavaScriptVar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="showError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.IDs"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.User"%>
<%@page import="twitter4j.JSONArray"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Twitter Direct message</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<link type="text/css" href="../css/jquery-ui.css" rel="stylesheet" />
<script>
$(function() {

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
var availableTags = <%= ListToJavaScriptVar.toJavascriptArray((List)request.getSession().getAttribute("followers")) %>;
function split( val ) {
return val.split( /,\s*/ );
}
function extractLast( term ) {
return split( term ).pop();
}

$( "#name" )
// don't navigate away from the field on tab when selecting an item
.bind( "keydown", function( event ) {
if ( event.keyCode === $.ui.keyCode.TAB &&
$( this ).data( "ui-autocomplete" ).menu.active ) {
event.preventDefault();
}
})
.autocomplete({
minLength: 0,
source: function( request, response ) {
// delegate back to autocomplete, but extract the last term
response( $.ui.autocomplete.filter(
availableTags, extractLast( request.term ) ) );
},
focus: function() {
// prevent value inserted on focus
return false;
},
select: function( event, ui ) {
var terms = split( this.value );
// remove the current input
terms.pop();
// add the selected item
terms.push( ui.item.value );
// add placeholder to get the comma-and-space at the end
terms.push( "" );
this.value = terms.join( "," );
return false;
}
});
});
</script>
<script>
$(document).ready(function(){
    $('#btn1').prop('disabled',true);
    $('#msg').keyup(function(){
    	if($("#name").val().length > 0)
    		$('#btn1').prop('disabled', $.trim(this.value) === "" ? true : false);  
    })
    
}); 
    </script>
</head>
<body>
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
		
			<h3>Compose Direct Message</h3>
<p>Now we can send DM to multiple recipients unlike twitter.com :)</p>
			
			<table>
			<tr>
				<td align="right">To</td><td></td>
				<td> 
<input id="name" class="input-xxlarge" name="name"  autocomplete="off" spellcheck="false" size="100">
			</td>
			</tr>
			<tr>
				<td align="right">Message</td><td></td>
				<td><textarea class="input-xxlarge" name="msg" id="msg"></textarea> </td>
			</tr>
			<tr>
				<td></td><td></td>
				<td><button id="btn1" class="btn btn-success" type="submit">Send</button></td>
				<% if((String)request.getParameter("notSentTo") != null)  {
				%><tr><font color="red">Not able to send this message to '<%= request.getParameter("notSentTo") %> ' this time!!</font></tr> <%
				
				} %>
				
			</tr>
		</table>
		</form>
            
        </div>
    </div>
</div>

<div class="navbar navbar-default navbar-fixed-bottom">
	 <div class="container">
<footer>
        <p>&copy; Akosha 2014</p>
      </footer>
</div>
	 </div>
    
</body>
</html>