package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buyerLogin")
public class BuyerLogin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In the buyer Login");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		String query1 = "select * from BUYER";
		String query2 = "select * from BUYER where BuyerUsername=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			
			String username = req.getParameter("username");
			String pass = req.getParameter("password");
			
//			System.out.println(username);
			
			PreparedStatement st = con.prepareStatement(query1);
			ResultSet rs = st.executeQuery();
			
			boolean flag = false;
			
			while(rs.next()) {
				if( username.equals(rs.getString("BuyerUsername")) && pass.equals(rs.getString("BuyerPassword")) ) {
					flag = true;
					break;
				}
			}
			
			if(flag) {
				
				PreparedStatement st1 = con.prepareStatement(query2);					
				st1.setString(1, username);
				ResultSet rs1 = st1.executeQuery();
				
				rs1.next();
				
				String email = rs1.getString("BuyerEmail");
				String address = rs1.getString("BuyerAddress");
				
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", pass);		
				session.setAttribute("email", email);
				session.setAttribute("address", address);
				
				RequestDispatcher rd = req.getRequestDispatcher("BuyerHomePage.jsp");
				rd.forward(req, resp);
			}
			else {
				
				req.setAttribute("page", "buyerSignIn.jsp");
				req.setAttribute("message", "The Username or password is not correct ");
				req.setAttribute("pageName", "Sign In Page");
				
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
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
