package com.akosha.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.RequestToken;

/**
 * Servlet implementation class TwitterSigninServlet
 */
public class TwitterSigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TwitterSigninServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();
out.println ("<html><body><script>alert('inside sigin servlet');</script></body></html>");
		try {
			System.out.println("Inside servlet");
			Twitter twitter = new TwitterFactory().getInstance();
			RequestToken requestToken;
			request.getSession().setAttribute("twitter", twitter);
			
			//setting consumer key and consumer secret
			twitter.setOAuthConsumer("4SkAK5YQAuajrJjyNdhp2uhku", "fs17RLRIJEP99Trv3PehzxsN0Yg1TyMu5Jg8xVoy0ptju14MZo");			
			requestToken = twitter.getOAuthRequestToken("https://fresh-fusion-704.appspot.com/redirect.jsp");			
			String authURL = requestToken.getAuthenticationURL();
			System.out.println("authURL: "+authURL);
			request.getSession().setAttribute("requestToken", requestToken);
out.println ("<html><body><script>alert('goint to sendredirect from signin!');</script></body></html>");
			response.sendRedirect(authURL);
			
			//request.getRequestDispatcher("TwitterDashboard.jsp").forward(request, response);
		} catch (TwitterException  twitterException) {
			twitterException.printStackTrace();
		}
	}
}
