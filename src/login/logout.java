package login;
import java.io.IOException; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class login
 */
//Information gathered from https://www.guru99.com/jsp-example.html
@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// would set username and password to null, thus signifying the user is logged out, however with no database, is more of a placeholder.
		String username = "null";
		String password = "null";
		{// redirect the user to the unloggedin menu
			RequestDispatcher req = request.getRequestDispatcher("menu.jsp");
			req.forward(request, response);
		}
	}
 
}