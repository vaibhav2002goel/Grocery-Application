package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProduct")
public class SellerUpdateRepository extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		String query1 = "select * from REPOSITORY";
		String query2 = " DELETE FROM REPOSITORY WHERE ProductName=? AND ProductCategory=?"; 
		String query3 = "INSERT INTO REPOSITORY values (?,?,?,?,?,?,?)";
		String query4 = "update CART set ProductPrice=? where ProductName=? AND ProductCategory=?";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {			
			String image = req.getParameter("image");
			String name =  req.getParameter("oldName");
			String description = req.getParameter("description");
			double price = Double.parseDouble(req.getParameter("price"));
			String category =  req.getParameter("oldCategory");
			int quantity = Integer.parseInt(req.getParameter("quantity"));

			String username = req.getParameter("username");
			
			System.out.println(username);
			System.out.println(name);
			System.out.println(category);
			
			boolean flag = true;
			
			PreparedStatement st1 = con.prepareStatement(query1);
			ResultSet rs1 = st1.executeQuery();
			
			if(flag) {
				
				PreparedStatement st2 = con.prepareStatement(query2);
				st2.setString(1, name);
				st2.setString(2, category);
				
				System.out.println("1 "+name);
				System.out.println("2 "+category);
				
				st2.executeUpdate();
				
				
				PreparedStatement st3 = con.prepareStatement(query3);
				
				st3.setString(1, image);
				st3.setString(2, name);
				st3.setString(3, description);
				st3.setDouble(4, price);
				st3.setString(5, category);
				st3.setInt(6, quantity);
				st3.setString(7, username);
				
				st3.executeUpdate();
				
				
				PreparedStatement st4 = con.prepareStatement(query4);
				st4.setDouble(1,price);
				st4.setString(2, name);
				st4.setString(3, category);
				
				st4.executeUpdate();
				
				RequestDispatcher rd = req.getRequestDispatcher("SellerHomePage.jsp");
				rd.forward(req, resp);
				
			}
			
			
		}
		catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
	}
}
