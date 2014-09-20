<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.IDs"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.ResponseList"%>
<%@page import="twitter4j.User"%>
 <% 
		 String s[]=null;
		List<String> followers = (List)request.getSession().getAttribute("followers");
	
			String[] str = new String[followers.size()];			
			Iterator it = followers.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().contains(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=5)
							break;
						cnt++;
					}
				}
			//jQuery related end	

 %>