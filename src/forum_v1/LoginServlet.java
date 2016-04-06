package forum_v1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		resp.setContentType("text/html");
		// resp.getWriter().println("<h2>GAE - Integrating Google user account</h2>");

		if (user != null) {

			// resp.getWriter().println("Welcome, " + user.getNickname());
			/*
			 * resp.getWriter().println( "<a href='" +
			 * userService.createLogoutURL(req.getRequestURI()) +
			 * "'> LogOut </a>");
			 */
			RequestDispatcher jsp = req.getRequestDispatcher("class_home.html");
			jsp.forward(req, resp);
		} else {
			resp.getWriter().println(
					"Please <a href='"
							+ userService.createLoginURL(req.getRequestURI())
							+ "'> LogIn </a>");

		}

	}
}
