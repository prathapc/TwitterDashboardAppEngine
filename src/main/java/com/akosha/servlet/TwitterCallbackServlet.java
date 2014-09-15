package com.akosha.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import twitter4j.DirectMessage;
import twitter4j.ResponseList;
import twitter4j.Twitter;
import twitter4j.TwitterException;

/**
 * Servlet implementation class TwitterCallbackServlet
 */
@WebServlet("/TwitterCallbackServlet")
public class TwitterCallbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TwitterCallbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In callback methode");
		Twitter twitter = (Twitter) request.getSession().getAttribute(
				"twitter");
		/*List<Message> messages = null;
		try {
			ResponseList<DirectMessage> receivedMessages = twitter.getDirectMessages();
			ResponseList<DirectMessage> sentMessages = twitter.getSentDirectMessages();
			messages = new ArrayList<>();
			Message message;
			System.out.println("############Received messages##########");
			for(DirectMessage recMessage : receivedMessages) {
				message = new Message();
				
				message.setMessageText(recMessage.getText());
				message.setCreatedAt(recMessage.getCreatedAt());
				message.setSenderName(recMessage.getSenderScreenName());
				message.setReceiverName(recMessage.getRecipientScreenName());
				
				messages.add(message);
				
			}
		}catch(TwitterException e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("messages", messages);
		*/
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
