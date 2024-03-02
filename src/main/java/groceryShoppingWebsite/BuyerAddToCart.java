package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddToCart")
public class BuyerAddToCart extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("cart");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		String query1 = "INSERT INTO CART VALUES (?,?,?,?,?)";
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			
			String name = req.getParameter("name");
			String category = req.getParameter("category");
			double price = Double.parseDouble(req.getParameter("price"));
			int quantity = 1;
			
			String username = req.getParameter("username");
			System.out.println("ABC "+username);
			
			PreparedStatement st = con.prepareStatement(query1);
			
			st.setString(1, name);
			st.setString(2, category);
			st.setDouble(3, price);
			st.setInt(4, quantity);
			st.setString(5,username);
			
			st.executeUpdate();
			
			RequestDispatcher rd = req.getRequestDispatcher("BuyerHomePage.jsp");
			rd.forward(req, resp);
			
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}
}
