<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.User"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.auth.RequestToken"%>
<%@page import="twitter4j.auth.AccessToken"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.DirectMessage"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function closeWindow(){
alert('in redirect jsp');
   <%!private long userId;
	private String screenName;
	private String name;
	private String avatarUrl;
	private String selfDescription;%>
	
	<%Twitter twitter = (Twitter) request.getSession().getAttribute(
					"twitter");
			RequestToken requestToken = (RequestToken) request.getSession()
					.getAttribute("requestToken");
			System.out.println("requestToken:"+requestToken);
			String verifier = request.getParameter("oauth_verifier");
			AccessToken accessToken = null;
			try {
				accessToken = twitter.getOAuthAccessToken(requestToken,
						verifier);
				request.getSession().removeAttribute("requestToken");

			} catch (TwitterException twitterException) {
				twitterException.printStackTrace();
			}
			request.getSession().setAttribute("accessToken", accessToken);
			twitter.setOAuthAccessToken(accessToken);
			
			userId = accessToken.getUserId();
			User user = twitter.showUser(userId);
			avatarUrl = user.getProfileImageURL().toString();
			System.out.println(user.getScreenName());
			
			ResponseList<DirectMessage> receivedMessages = twitter.getDirectMessages();
            ResponseList<DirectMessage> sentMessages = twitter.getSentDirectMessages();
            /* System.out.println("############Received messages##########");
            for(DirectMessage recMessage : receivedMessages) {
            	System.out.println(recMessage.getText()+"::"+recMessage.getSenderScreenName());
            }
            System.out.println("############Sent messages##########");
            for(DirectMessage sentMessage : sentMessages) {
            	System.out.println(sentMessage.getText()+"::"+sentMessage.getRecipientScreenName());
            } */
            
            request.getSession().setAttribute("twitter", twitter);
            %>
		self.close();
		<%request.getRequestDispatcher("/callback").include(request,response);%>
	}
</script>
</head>

<body onload="javascript:closeWindow()">
  
</body>

</html>