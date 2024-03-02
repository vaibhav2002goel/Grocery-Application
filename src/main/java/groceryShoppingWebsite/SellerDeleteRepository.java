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

@WebServlet("/SellerDeleteRepository")
public class SellerDeleteRepository extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Delete product");
		
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
			
			String query1 = "delete from REPOSITORY where ProductName=? AND ProductCategory=?";
			String query2 = "delete from CART where ProductName=? AND ProductCategory=?";
			
			String name = req.getParameter("name");
			String category = req.getParameter("category");
			
			PreparedStatement st1 = con.prepareStatement(query1);
			PreparedStatement st2 = con.prepareStatement(query2);
			
			
			st1.setString(1, name);
			st1.setString(2, category);
			

			st2.setString(1, name);
			st2.setString(2, category);
			
			
			st1.executeUpdate();
			
			st2.executeUpdate();
			
			RequestDispatcher rd = req.getRequestDispatcher("SellerDeleteProduct.jsp");
			rd.forward(req, resp);
			
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}

}
