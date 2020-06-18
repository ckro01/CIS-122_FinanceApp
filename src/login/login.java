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
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uName = request.getParameter("username");
		String pwd = request.getParameter("password");
		//Assign fixed password, if fledged with MySQL, would check against database.
		if(uName.equalsIgnoreCase("Admin") || pwd.equals("abc123") )
		{
			RequestDispatcher req = request.getRequestDispatcher("menuLogged.jsp"); //redirect to logged in page
			req.include(request, response);
		}
		else
		{
			RequestDispatcher req = request.getRequestDispatcher("login_1.jsp"); //redirect to give password
			req.forward(request, response);
		}
	}
 
}