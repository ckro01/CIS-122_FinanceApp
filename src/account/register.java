package account;
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class register
 */
//Information gathered from https://www.guru99.com/jsp-example.html
@WebServlet("/LoginCheck")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String first_name = request.getParameter("first");
		String last_name = request.getParameter("last");
		String uName = request.getParameter("username");
		String pwd = request.getParameter("pass");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String isEmployed = request.getParameter("employed");
		//Statement below would be used to check against a database should one be created.
		if(!(first_name.equalsIgnoreCase("test") && last_name.equalsIgnoreCase("user") && uName.equalsIgnoreCase("Admin") 
				&& pwd.equalsIgnoreCase("abc123") && address.equalsIgnoreCase("123 Easy St") && phone.equals("612-867-5309") && isEmployed.equals("Yes")))
		{
			RequestDispatcher req = request.getRequestDispatcher("register_1.jsp");
			req.include(request, response);
		}
		else //Logs user in.
		{
			RequestDispatcher req = request.getRequestDispatcher("menuLogged.jsp");
			req.forward(request, response);
		}
	}
 
}