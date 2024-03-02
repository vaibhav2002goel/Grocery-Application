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

@WebServlet("/AddProduct")
public class SellerAddProducts extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("Add product");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		String query1 = "select * from REPOSITORY";
		String query2 = "INSERT INTO REPOSITORY values (?,?,?,?,?,?,?)"; 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try(Connection con = DriverManager.getConnection(url,user,password)) {			
			String image = req.getParameter("image");
			String name = req.getParameter("name");
			String description = req.getParameter("description");
			double price = Double.parseDouble(req.getParameter("price"));
			String category = req.getParameter("category");
			int quantity = Integer.parseInt(req.getParameter("quantity"));

			String username = req.getParameter("username");
			System.out.println(username);
			
			boolean flag = true;
			
			PreparedStatement st1 = con.prepareStatement(query1);
			ResultSet rs1 = st1.executeQuery();
			
			while(rs1.next()) {
				if( name.equals(rs1.getString("ProductName")) && category.equals(rs1.getString("ProductCategory")) ) {
					flag = false;
					break;
				}
			}
			
			if(flag) {
				PreparedStatement st2 = con.prepareStatement(query2);
				
				st2.setString(1, image);
				st2.setString(2, name);
				st2.setString(3, description);
				st2.setDouble(4, price);
				st2.setString(5, category);
				st2.setInt(6, quantity);
				st2.setString(7, username);
				
				st2.executeUpdate();
				
				RequestDispatcher rd = req.getRequestDispatcher("SellerHomePage.jsp");
				rd.forward(req, resp);
				
			}
			else {
				req.setAttribute("page", "SellerAddItem.jsp");
				req.setAttribute("message", "The product with name and under same category already exists.");
				req.setAttribute("pageName", "Add Item Page");
				
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
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
