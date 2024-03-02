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

@WebServlet("/BuyerUpdateCartQuantity")
public class BuyerUpdateCartQuantity extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			String name = req.getParameter("name");
			String category = req.getParameter("category");
			int quantity = Integer.parseInt( req.getParameter("productQuantity") );
			String username = req.getParameter("username");
			
			String query1 = "update CART set ProductQuantity=? where ProductName=? AND ProductCategory=? AND BuyerUsername=?";
			
			PreparedStatement st = con.prepareStatement(query1);
			st.setInt(1, quantity);
			st.setString(2, name);
			st.setString(3, category);
			st.setString(4, username);
			
			st.executeUpdate();
			
			
			RequestDispatcher rd = req.getRequestDispatcher("BuyerCart.jsp");
			rd.forward(req, resp);
			
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}

}
