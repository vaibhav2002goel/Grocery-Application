package groceryShoppingWebsite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BuyerTransaction")
public class BuyerTransaction extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In Buyer Transation***********");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String url = "jdbc:mysql://localhost:3306/SHOPPING?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String user = "demo";
		String password = "password";
		
		out.println("<html>\n" + "<head><title></title>" + "<style>\n" + "" + "</style>\n" + "</head>" + "<body>" + "<h1 align=center>" + "RESULT OF QUERY" + "</h1>\n");

    
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("In jdbc dricer error");
			e.printStackTrace();
		}
		try(Connection con = DriverManager.getConnection(url,user,password)) {
			
			
			
			String startDate = req.getParameter("startDate");
			String endDate = req.getParameter("endDate");
			String buyer = req.getParameter("user");
			
			System.out.println(startDate);
			System.out.println(endDate);
			System.out.println(buyer);
			
			if( (startDate.equals("") && !endDate.equals("")) || (!startDate.equals("") && endDate.equals("")) ) {
				
				req.setAttribute("page", "SellerTransaction.jsp");
				req.setAttribute("message", "Please Enter both the Dates for the required information!!");
				req.setAttribute("pageName", "Transaction Page");
				
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
				rd.forward(req, resp);
				
				return;
			}
			
			if( (startDate.equals("") && endDate.equals("")) ) {
				
				String query1 = "select * from TRANSACTION where BuyerUsername=? AND SellerUsername=?";
				PreparedStatement st1 = con.prepareStatement(query1);
				st1.setString(1, buyer);
				st1.setString(2,req.getParameter("old-username"));
				ResultSet rs1 = st1.executeQuery();
				
				
				
				
				RequestDispatcher rd = req.getRequestDispatcher("SellerTransaction.jsp");
				rd.include(req, resp);
				out.println("<h1 style=\"text-align:center;\">TRANSACTIONS</h1><table border = \"1\" style=\"margin:auto;\">\n"
						+ "		<caption></caption>\n"
						+ "		<tr>\n"
						+ "			<th> ProductName </th>&nbsp;&nbsp;\n"
						+ "			<th> ProductCategory </th>&nbsp;&nbsp;\n"
						+ "			<th> ProductPrice </th>&nbsp;&nbsp;\n"
						+ "			<th> QuantityOrdered </th>&nbsp;&nbsp;\n"
						+ "			<th> BuyerUsername </th>&nbsp;&nbsp;\n"
						+ "			<th> SellerUsername </th>&nbsp;&nbsp;\n"
						+ "			<th> OrderPlacedDate </th>&nbsp;&nbsp;\n"
						+ "		</tr>");
				
				while(rs1.next()) {
					out.println("<tr>\n"
							+ "			<td> "+ rs1.getString("ProductName") +"</td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs1.getString("ProductCategory") +"  </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs1.getDouble("ProductPrice") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs1.getInt("QuantityOrdered") +"  </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs1.getString("BuyerUsername") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs1.getString("SellerUsername") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs1.getDate("OrderPlacedDate") +" </td>&nbsp;&nbsp;\n"
							+ "		</tr>");
				}
				
				out.println("</table><br><br><br><br>");
				
				
				return;
			}
			
			
			
			
			LocalDate sdate = LocalDate.parse(startDate);
			LocalDate sdate_sql = LocalDate.parse(startDate);
			
			LocalDate edate = LocalDate.parse(endDate);
			LocalDate edate_sql = LocalDate.parse(endDate);
			
			Duration diff = Duration.between(sdate.atStartOfDay(),edate.atStartOfDay());
			
			long days = diff.toDays();
			
			System.out.println(days);
			
			if(days>=0 && buyer.equals("Choose User")) {				
				
				
				String query2 = "select * from TRANSACTION where OrderPlacedDate>=? AND OrderPlacedDate<=? AND SellerUsername=?";
				
				PreparedStatement st2 = con.prepareStatement(query2);
				st2.setDate(1, java.sql.Date.valueOf(sdate_sql));
				st2.setDate(2, java.sql.Date.valueOf(edate_sql));
				st2.setString(3,req.getParameter("old-username"));
				ResultSet rs2 = st2.executeQuery();
				
				RequestDispatcher rd = req.getRequestDispatcher("SellerTransaction.jsp");
				rd.include(req, resp);
				out.println("<h1 style=\"text-align:center;\">TRANSACTIONS</h1><table border = \"1\" style=\"margin:auto;\">\n"
						+ "		<caption></caption>\n"
						+ "		<tr>\n"
						+ "			<th> ProductName </th>&nbsp;&nbsp;\n"
						+ "			<th> ProductCategory </th>&nbsp;&nbsp;\n"
						+ "			<th> ProductPrice </th>&nbsp;&nbsp;\n"
						+ "			<th> QuantityOrdered </th>&nbsp;&nbsp;\n"
						+ "			<th> BuyerUsername </th>&nbsp;&nbsp;\n"
						+ "			<th> SellerUsername </th>&nbsp;&nbsp;\n"
						+ "			<th> OrderPlacedDate </th>&nbsp;&nbsp;\n"
						+ "		</tr>");
				
				while(rs2.next()) {
					out.println("<tr>\n"
							+ "			<td> "+ rs2.getString("ProductName") +"</td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getString("ProductCategory") +"  </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getDouble("ProductPrice") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getInt("QuantityOrdered") +"  </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getString("BuyerUsername") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getString("SellerUsername") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getDate("OrderPlacedDate") +" </td>&nbsp;&nbsp;\n"
							+ "		</tr>");
				}
				
				out.println("</table><br><br><br><br>");
				
				
				return;
										
			}
			
			else if( days>=0 && !buyer.equals("Choose User") ) {
				String query2 = "select * from TRANSACTION where OrderPlacedDate>=? AND OrderPlacedDate<=? AND BuyerUsername=?";
				
				PreparedStatement st2 = con.prepareStatement(query2);
				st2.setDate(1, java.sql.Date.valueOf(sdate_sql));
				st2.setDate(2, java.sql.Date.valueOf(edate_sql));
				st2.setString(3, buyer);
				ResultSet rs2 = st2.executeQuery();
				
				RequestDispatcher rd = req.getRequestDispatcher("SellerTransaction.jsp");
				rd.include(req, resp);
				out.println("<h1 style=\"text-align:center;\">TRANSACTIONS</h1><table border = \"1\" style=\"margin:auto;\">\n"
						+ "		<caption></caption>\n"
						+ "		<tr>\n"
						+ "			<th> ProductName </th>&nbsp;&nbsp;\n"
						+ "			<th> ProductCategory </th>&nbsp;&nbsp;\n"
						+ "			<th> ProductPrice </th>&nbsp;&nbsp;\n"
						+ "			<th> QuantityOrdered </th>&nbsp;&nbsp;\n"
						+ "			<th> BuyerUsername </th>&nbsp;&nbsp;\n"
						+ "			<th> SellerUsername </th>&nbsp;&nbsp;\n"
						+ "			<th> OrderPlacedDate </th>&nbsp;&nbsp;\n"
						+ "		</tr>");
				
				while(rs2.next()) {
					out.println("<tr>\n"
							+ "			<td> "+ rs2.getString("ProductName") +"</td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getString("ProductCategory") +"  </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getDouble("ProductPrice") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getInt("QuantityOrdered") +"  </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getString("BuyerUsername") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getString("SellerUsername") +" </td>&nbsp;&nbsp;\n"
							+ "			<td> "+ rs2.getDate("OrderPlacedDate") +" </td>&nbsp;&nbsp;\n"
							+ "		</tr>");
				}
				
				out.println("</table><br><br><br><br>");
				
				
				return;
			
			}
			
			else {
				req.setAttribute("page", "SellerTransaction.jsp");
				req.setAttribute("message", "Wrong Dates has been Entered. Start Date entered is greater then the End Date!!");
				req.setAttribute("pageName", "Transaction Page");
				
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
				rd.forward(req, resp);
				
				return;
			}
			
			
			
			
			
		
		}catch(Exception e){ 
			RequestDispatcher rd = req.getRequestDispatcher("serverError.html");
			rd.forward(req, resp);
			e.printStackTrace();
		}
		
	}
}
