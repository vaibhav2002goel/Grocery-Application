
package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import com.mysql.cj.xdevapi.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateBuyerAndVerification")
public class UpdateBuyerAndVerification extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In the buyer update");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		String query1 = "select * from BUYER";
		String query2 = "delete from BUYER where BuyerUsername=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			
			
			String username = req.getParameter("old-username");
			
//			System.out.println(username);
			
			PreparedStatement st = con.prepareStatement("INSERT INTO BUYER values (?,?,?,?)");
			
			PreparedStatement st1 = con.prepareStatement(query1);
			ResultSet rs = st1.executeQuery();
			
			boolean flag = true;
			 
			
			
			if(flag) {
				
				PreparedStatement st2 = con.prepareStatement(query2);
				st2.setString(1, username);
//				ResultSet rs2 = st2.executeQuery();
				
				st2.executeUpdate();
				
				
				st.setString(1, req.getParameter("email"));
				st.setString(2, username);
				st.setString(3, req.getParameter("password"));
				st.setString(4, req.getParameter("address"));
				
				st.executeUpdate();
				
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", req.getParameter("password"));		
				session.setAttribute("email", req.getParameter("email"));
				session.setAttribute("address", req.getParameter("address"));
				
				RequestDispatcher rd = req.getRequestDispatcher("BuyerProfile.jsp");
				rd.forward(req, resp);
			}
			
			
			st.close();
			con.close();	
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}
}