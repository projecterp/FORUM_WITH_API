package forum_v1;

import querymanager.Query_All;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class tagServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		resp.setContentType("text/html");
		String user_id;
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		user_id = user.getNickname();
		String comment = req.getParameter("comment");
		String time = req.getParameter("time");
		String sem = req.getParameter("sem");
		Query_All query = new Query_All();
		

	    if (req.getParameter("btn").equals("view") || req.getParameter("btn").equals("Find")) {
			RequestDispatcher jsp = req.getRequestDispatcher("/index2.jsp");
			jsp.forward(req, resp);
		}
		else if (req.getParameter("btn").equals("rate")) {
			if (!req.getParameter("rating").equals("0")) {
				query.addRating(time, sem, req.getParameter("rating"));
			}
			RequestDispatcher jsp = req
					.getRequestDispatcher("/index2.jsp");
			jsp.forward(req, resp);
		} 
		else if (req.getParameter("btn").equals("PostComment")) {
			query.addComment(user_id, comment, time, sem);
			RequestDispatcher jsp = req
					.getRequestDispatcher("/index2.jsp");
			jsp.forward(req, resp);
		}
		else {
			com.google.appengine.api.datastore.DatastoreService ds = DatastoreServiceFactory
					.getDatastoreService();
			Query q = new Query("Post").addSort("time",
					SortDirection.DESCENDING);
			q.setFilter(new Query.FilterPredicate("tag",
					Query.FilterOperator.EQUAL, req.getParameter("btn")));
			PreparedQuery pq = ds.prepare(q);
			PrintWriter out = resp.getWriter();
			for (Entity result : pq.asIterable()) {
				out.println("<html>\n" + "<body>\n" + "<p>"
						+ result.getProperty("str") + "</p>" + "</body>"
						+ "</html>");
			}
		}
		// RequestDispatcher jsp =
		// req.getRequestDispatcher("/WEB-INF/index3.jsp");
		// jsp.forward(req,resp);
	}

}
