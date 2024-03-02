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

@WebServlet("/sellerValidationAndInsertion")
public class SellerInsertionAndValidation extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		System.out.println("In the buyer");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		String query1 = "select * from SELLER";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			
			
			String username = req.getParameter("username");
			
//			System.out.println(username);
			
			PreparedStatement st = con.prepareStatement("INSERT INTO SELLER values (?,?,?,?)");
			
			PreparedStatement st1 = con.prepareStatement(query1);
			ResultSet rs = st1.executeQuery();
			
			boolean flag = true;
			 
			while(rs.next()) {
				if(username.equals(rs.getString("sellerUsername"))) {
					flag = false;
					break;
				}
			}
			
			if(flag) {
				st.setString(1, req.getParameter("email"));
				st.setString(2, req.getParameter("username"));
				st.setString(3, req.getParameter("password"));
				st.setString(4, req.getParameter("company"));
				
				st.executeUpdate();
				
				RequestDispatcher rd = req.getRequestDispatcher("sellerSignIn.jsp");
				rd.forward(req, resp);
			}
			else {
				
				req.setAttribute("page", "sellerSignUp.jsp");
				req.setAttribute("message", "The Username already exists. Enter a new username!!");
				req.setAttribute("pageName", "Sign up Page");
				
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
